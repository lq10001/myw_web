package com.ly.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class Img extends Model<Img> {

    public static final Img imgDao = new Img();

    public List<Img> getListImg()
    {
        return imgDao.find("select * from img");
    }

    public List<Img> getListImgLoveByTripid(Integer tripid)
    {
        return imgDao.find("select img.*,imglove.id  as imgloveid from img  left join imglove on img.id = imglove.imgid where  tripid =" + tripid);
    }

    public List<Img> getListImgDate(Integer tripid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select distinct date(createdate) as createdate from img where tripid = ");
        sb.append(tripid);
        sb.append(" order by createdate");
        System.out.println(sb.toString());
        return imgDao.find(sb.toString());
    }

    public List<Img> getListImgByTripid(Object tripid)
    {
        return imgDao.find("select * from img where  tripid =" + tripid);
    }

    public Long count(Object tripid)
    {
        return Db.queryLong("select count(id) from img where tripid = " + tripid);
    }

    public List<Img> getListImgByPlaceid(Integer placeid)
    {
        return imgDao.find("select * from img where placeid = " + placeid);
    }


    public List<Img> getListImgByUserId(Integer userid)
    {
        return imgDao.find("select * from img where userid = " + userid + " limit 10");
    }

    public List<Img> getListLoveImgByUserId(Integer userid)
    {
        return imgDao.find("select img.* from imglove inner join  img on img.id = imglove.imgid where img.userid = " + userid + " limit 10");
    }

    public List<Img> getListImgByHotname(String name)
    {
        StringBuffer sb = new StringBuffer("select * from img where gpsname like ");
        sb.append("'%");
        sb.append(name);
        sb.append("%' limit 20");
        System.out.println(sb.toString());
        return imgDao.find(sb.toString());

    }

    public List<Img> getListImgLove()
    {
        String sql = "select * from img order by love desc limit 20";
        return  imgDao.find(sql);
    }


    public Img getImg(Integer id)
    {
        return imgDao.findById(id);
    }

    public Page<Img> getListImg(int pageNum,int pageSize,Img img)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(img, sb))
        {
            return imgDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return imgDao.paginateByCache("img", "page_img_" + pageNum, pageNum, pageSize, "select *", "from img order by id desc");
        }
    }

    public Date getEndDate(Object tripid) throws ParseException {
        StringBuffer sb = new StringBuffer("select max(createdate) as createdate from img where tripid = ");
        sb.append(tripid);
        Img img = imgDao.findFirst(sb.toString());
        String strDate = img.getTimestamp("createdate").toString();
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df2.parse(strDate);
    }


    public boolean saveOrUpdate(Img img)
    {
        boolean ok = false;
        Integer id = img.getInt("id");
        if (id == null || id <= 0){
            ok =  img.save();
        }else{
            ok = img.update();
        }
//        CacheKit.removeAll("img");
        return ok;
    }
}