package com.ly.controller;

import com.alibaba.fastjson.JSON;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.upload.UploadFile;
import com.ly.model.Img;
import com.ly.tool.Dwz;
import com.ly.vo.FileUploadInfo;
import org.nutz.lang.Files;
import org.nutz.lang.random.StringGenerator;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
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

    public void save()
    {

        PathKit pk = new PathKit();
        String contextPath = pk.getWebRootPath();
        String path = "/upload";
        String pathUrl = contextPath + path;
        int maxSize = 200 * 1024 * 1024;              //10M

        /*
        UploadFile upFile = getFile("upload_file", pathUrl, maxSize, "utf-8");
        String fileName = upFile.getFileName();
        String real_path = upFile.getSaveDirectory();
        String  pathAndName = real_path + fileName;
          */
        List<FileUploadInfo> fileInfos = new LinkedList<FileUploadInfo>();
        List<UploadFile> files = getFiles(pathUrl, maxSize, "utf-8");
        for (UploadFile uploadFile : files)
        {
            FileUploadInfo fileInfo = new FileUploadInfo();

            File f = uploadFile.getFile();
            String type = Files.getSuffixName(f);

            StringGenerator sg = new StringGenerator(3);
            String fileName = sg.next() + System.currentTimeMillis() + "." + type;
            Files.rename(f, fileName);

            fileInfo.setName(fileName);
            fileInfo.setUrl("/upload/"+fileName);
            fileInfo.setThumbnailUrl("/upload/"+fileName);
            fileInfo.setDeleteType("DELETE");
            fileInfo.setDeleteUrl("");
            fileInfo.setSize(f.getFreeSpace());
            fileInfos.add(fileInfo);
        }


        System.out.println(" ---- " + files.size() + "        " + JSON.toJSONString(fileInfos));

        HttpSession session = getSession();
        Object o = session.getAttribute("userid");


        Img img = getModel(Img.class);
        img.set("userid",o);
        img.set("adddate",new Date());
        boolean ok = Img.imgDao.saveOrUpdate(img);

        StringBuffer sb = new StringBuffer();
        sb.append("{\"files\":");
        sb.append(JSON.toJSONString(fileInfos));
        sb.append("}");

        System.out.println(sb.toString());

        renderJson(sb.toString());

    }

    public void del()
    {
        boolean ok =  Img.imgDao.deleteById(getParaToInt());
        CacheKit.removeAll("img");
        renderJson(Dwz.jsonRtn(ok,"img",""));
    }

}
