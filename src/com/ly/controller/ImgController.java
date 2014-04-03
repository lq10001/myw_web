package com.ly.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.exif.GpsDirectory;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.upload.UploadFile;
import com.ly.Global;
import com.ly.model.*;
import com.ly.tool.Dwz;
import com.ly.vo.FileUploadInfo;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.sanselan.ImageReadException;
import org.apache.sanselan.Sanselan;
import org.apache.sanselan.common.IImageMetadata;
import org.apache.sanselan.formats.jpeg.JpegImageMetadata;
import org.apache.sanselan.formats.tiff.TiffField;
import org.apache.sanselan.formats.tiff.TiffImageMetadata;
import org.apache.sanselan.formats.tiff.constants.TagConstantsUtils;
import org.apache.sanselan.formats.tiff.constants.TiffTagConstants;
import org.nutz.lang.Files;
import org.nutz.lang.random.StringGenerator;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;


public class ImgController extends Controller {

    public void index()
    {

        Img menu= getModel(Img.class);
        setAttr("page", Img.imgDao.getListImg(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("img", menu);
        render("user_list.jsp");
        render("img_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("img",null);
        }else{
            setAttr("img", Img.imgDao.getImg(id));
        }
        render("img.jsp");
    }

    public void save() throws IOException,ImageReadException,ParseException {

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);
        Object placeid = session.getAttribute(Global.PLACE_ID);

        PathKit pk = new PathKit();
        String contextPath = pk.getWebRootPath();
        String path = "/upload";
        String pathUrl = contextPath + path;
        int maxSize = 20 * 1024 * 1024;              //20M

        List<FileUploadInfo> fileInfos = new LinkedList<FileUploadInfo>();
        List<UploadFile> files = getFiles(pathUrl, maxSize, "utf-8");
        for (UploadFile uploadFile : files)
        {
            FileUploadInfo fileInfo = new FileUploadInfo();

            File uploadFile1 = uploadFile.getFile();

            //exif
            String lat = "";
            String lon = "";
            String createDate = "";


            final IImageMetadata metadata = Sanselan.getMetadata(uploadFile1);
            if (metadata instanceof JpegImageMetadata) {
                final JpegImageMetadata jpegMetadata = (JpegImageMetadata) metadata;
                final TiffField field = jpegMetadata.findEXIFValue(TiffTagConstants.TIFF_TAG_DATE_TIME);
                if (field != null) {
                    String a1  = field.getValueDescription();
                    createDate = a1.substring(1,a1.length() - 1);
                }

                final TiffImageMetadata exifMetadata = jpegMetadata.getExif();
                if (null != exifMetadata) {
                    final TiffImageMetadata.GPSInfo gpsInfo = exifMetadata.getGPS();
                    if (null != gpsInfo) {
                        final double longitude = gpsInfo.getLongitudeAsDegreesEast();
                        final double latitude = gpsInfo.getLatitudeAsDegreesNorth();
                        lon = String.valueOf(longitude);
                        lat = String.valueOf(latitude);
//                        geocodeAddr(latitude,longitude);
                    }
                }
            }

            String type = Files.getSuffixName(uploadFile1);

            StringGenerator sg = new StringGenerator(5);
            String name = sg.next() + System.currentTimeMillis();
            String fileName = name + "." + type;

            String filename200 = name + "_200_200." + type;
            String filename800 = name + "_800_800." + type;


            Thumbnails.of(uploadFile1).size(200,200).toFile(uploadFile.getSaveDirectory() + "/" + filename200);
            Thumbnails.of(uploadFile1).size(800,800).toFile(uploadFile.getSaveDirectory() + "/" + filename800);

            Files.rename(uploadFile1, fileName);

            String url = "/upload/"+fileName;
            String s_url  = "/upload/"+filename200;
            String url_800 = "/upload/"+filename800;

            Img img = new Img();
            img.set("userid",userid);
            img.set("tripid",tripid);
            img.set("placeid",placeid);
            img.set("adddate",new Date());
            img.set("imgpath",url);
            img.set("smallimgpath",s_url);
            img.set("imgpath800",url_800);
            img.set("lat",lat);
            img.set("lon",lon);
            if (createDate.equals(""))
            {
                img.set("createdate",new Date());
            }else{
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
                Date myDate = sdf.parse(createDate);
                SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                img.set("createdate", df2.format(myDate));
            }


            Img.imgDao.saveOrUpdate(img);

            Date endDate = Img.imgDao.getEndDate(tripid);


            Trip trip = Trip.tripDao.findById(tripid);
            trip.set("id",tripid);
            trip.set("defaultimg",s_url);
            trip.set("enddate",endDate);
            Trip.tripDao.saveOrUpdate(trip);

            DecimalFormat df = new DecimalFormat("#.00");
            fileInfo.setName(fileName);
            fileInfo.setUrl(url);
            fileInfo.setThumbnailUrl(s_url);
            fileInfo.setDeleteType("DELETE");
            fileInfo.setDeleteUrl(img.getInt("id").toString());
            fileInfo.setSize( df.format((double) uploadFile1.getTotalSpace() / 1024) + "K");
            fileInfos.add(fileInfo);
        }

        StringBuffer sb = new StringBuffer();
        sb.append("{\"files\":");
        sb.append(JSON.toJSONString(fileInfos));
        sb.append("}");

        renderJson(sb.toString());

    }

    public void delFollow()
    {
        int id = getParaToInt("id");
        Img oldImg = Img.imgDao.findById(id);
        String str1 = oldImg.get("smallimg2path");
        String str2 = oldImg.get("imgpath2800");
        oldImg.set("smallimgpath",str1);
        oldImg.set("imgpath800",str2);
        oldImg.set("smallimg2path","");
        oldImg.set("imgpath2800","");

        Boolean ok = Img.imgDao.saveOrUpdate(oldImg);
        renderJson(ok ? 1 : 0);
    }

    public void uploadImg() throws IOException {

        int id = getParaToInt(0);


        UploadFile uploadFile = getFile();
        File f = uploadFile.getFile();

        String type = Files.getSuffixName(f);
        StringGenerator sg = new StringGenerator(5);
        String name = sg.next() + System.currentTimeMillis();
        String filename200 = name + "_200_200." + type;
        String filename800 = name + "_800_800." + type;


        Thumbnails.of(f).size(200,200).toFile(uploadFile.getSaveDirectory() + "/" + filename200);
        Thumbnails.of(f).size(800,800).toFile(uploadFile.getSaveDirectory() + "/" + filename800);
        String path2  = "/upload/"+filename200;
        String path8  = "/upload/"+filename800;

        Img oldImg = Img.imgDao.findById(id);
        oldImg.set("imgpath2800",path8);
        oldImg.set("smallimg2path",path2);
        Boolean ok =   Img.imgDao.saveOrUpdate(oldImg);

        DecimalFormat df = new DecimalFormat("#.00");
        FileUploadInfo fileInfo = new FileUploadInfo();
        fileInfo.setName(filename800);
        fileInfo.setUrl(path8);
        fileInfo.setThumbnailUrl(path2);
        fileInfo.setDeleteType("DELETE");
        fileInfo.setDeleteUrl("");
        fileInfo.setSize( 10 + "K");

        List<FileUploadInfo> fileInfos = new LinkedList<FileUploadInfo>();
        fileInfos.add(fileInfo);

    StringBuffer sb = new StringBuffer();
    sb.append("{\"files\":");
    sb.append(JSON.toJSONString(fileInfos));
    sb.append("}");

    renderJson(sb.toString());

    }

    public void del()
    {
        int id = getParaToInt("id");
        boolean ok =  Img.imgDao.deleteById(id);
        Object oTripid = getSession().getAttribute(Global.TRIP_ID);
        renderJson(ok ? Img.imgDao.count(oTripid) : "-1");
    }

    public void defaultImg()
    {
        int id = getParaToInt("id");
        Img img = Img.imgDao.findById(id);
        Boolean ok =  Trip.tripDao.updateDefalutImg(img.getInt("tripid"),img.getStr("imgpath"));
        renderJson(ok ? "1" : "0");

    }

    public void mark()
    {
        Img img = getModel(Img.class);
        Boolean ok = Img.imgDao.saveOrUpdate(img);
        renderJson(ok ? "1" : "0");
    }

    public void imgGps()
    {
        Img img = getModel(Img.class);
        Boolean ok = Img.imgDao.saveOrUpdate(img);
        renderJson(ok ? "1" : "0");
    }

    public void love()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        if (userid == null)
        {
            renderJson("-1");
            return;
        }

        int imgid = getParaToInt("id");

        Img img = Img.imgDao.findById(imgid);

        ImgLove imgLove = ImgLove.imgLoveDao.getImgLove(userid,imgid);

        int num = 0;

        if (imgLove == null)
        {
            ImgLove iLove = new ImgLove();
            iLove.set("userid",userid);
            iLove.set("imgid",imgid);
            ImgLove.imgLoveDao.saveOrUpdate(iLove);
            num = img.getInt("love") + 1;
        }else{
            imgLove.delete();
            num = img.getInt("love") - 1;
        }
        img.set("love",num);
        Boolean ok = Img.imgDao.saveOrUpdate(img);
        renderJson(ok ? num : "0");
    }
    private JSONObject geocodeAddr(double lat, double lng) {


//        String str = getRequestByUrl("http://ditu.google.com/maps/api/geocode/json?latlng=31.1899209667,121.3918055000&sensor=false&&language=zh-CN");

//        String urlString = "http://ditu.google.com/maps/api/geocode/json?latlng="+lat+","+lng+"&sensor=false&&language=zh-CN";
          String urlString = "http://ditu.google.com/maps/api/geocode/json?latlng=30.628621111111112,104.05973694444444&sensor=false&&language=zh-CN";
        StringBuilder sTotalString = new StringBuilder();
        try {

            URL url = new URL(urlString);
            URLConnection connection = url.openConnection();
            HttpURLConnection httpConnection = (HttpURLConnection) connection;

            InputStream urlStream = httpConnection.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(urlStream));

            String sCurrentLine = "";
            while ((sCurrentLine = bufferedReader.readLine()) != null) {
                sTotalString.append(sCurrentLine);
            }
            bufferedReader.close();
            httpConnection.disconnect(); // 关闭http连接

        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        System.out.println(sTotalString.toString());

        return null;
    }

    public static void main(String[] args)
    {
        getAddressByLatLng("");
    }

    public static String getAddressByLatLng(String latLng){
        String address = "";
        BufferedReader in= null;
        try {
            String urlString = "http://ditu.google.cn/maps/api/geocode/json?latlng=30.628621111111112,104.05973694444444&sensor=false&&language=zh-CN";

            URL url = new URL(urlString);
            HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
            httpConn.setDoInput(true);
            in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(),"UTF-8"));
            String line;
            String result="";
            while ((line = in.readLine()) != null) {
                result += line;
            }
            in.close();
            JSONObject jsonObject =JSONObject.parseObject(result);
            System.out.println(result);
            System.out.println(jsonObject);
            JSONArray array = JSONArray.parseArray(result);



        }catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return address;
    }

}
