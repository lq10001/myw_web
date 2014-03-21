package com.ly.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

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