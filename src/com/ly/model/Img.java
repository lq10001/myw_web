package com.ly.model;

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

    public List<Img> getListImgByTripid(Integer userid,Integer tripid)
    {
        return imgDao.find("select * from img where userid = " + userid + " and tripid =" + tripid);
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