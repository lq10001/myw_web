package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class ImgLove extends Model<ImgLove> {

    public static final ImgLove imgLoveDao = new ImgLove();

    public List<ImgLove> getListImgLove()
    {
        return imgLoveDao.find("select * from imgLove");
    }


    public List<ImgLove> getListImgLoveByUser(Integer userid)
    {
        return imgLoveDao.find("select * from imgLove  where imgLove.userid =" + userid);
    }


    public List<ImgLove> getListFollowImgLoveByUser(Integer userid)
    {
        return imgLoveDao.find("select imgLove.*,follow.userid fuserid from follow inner join imgLove on follow.imgLoveid = imgLove.id where follow.userid=" + userid);
    }




    public List<ImgLove> getListImgLoveTop10()
    {
        return imgLoveDao.find("select * from imgLove LIMIT 10 ");
    }

    public List<ImgLove> getListMyImgLove10(Integer userid)
    {
        return imgLoveDao.find("select * from imgLove join img where imgLove.id = img.imgLoveid and imgLove.userid =" + userid);
    }

    public ImgLove getImgLove(Integer id)
    {
        return imgLoveDao.findById(id);
    }

    public ImgLove getImgLove(Object userid,Integer imgid)
    {
        return imgLoveDao.findFirst("select * from imglove where userid="+userid + " and imgid = "+imgid);
    }

    public Page<ImgLove> getListImgLove(int pageNum,int pageSize,ImgLove imgLove)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(imgLove, sb))
        {
            return imgLoveDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return imgLoveDao.paginateByCache("imgLove", "page_imgLove_" + pageNum, pageNum, pageSize, "select *", "from imgLove order by id desc");
        }
    }

    public boolean saveOrUpdate(ImgLove imgLove)
    {
        boolean ok = false;
        Integer id = imgLove.getInt("id");
        if (id == null || id <= 0){
            ok =  imgLove.save();
        }else{
            ok = imgLove.update();
        }
//        CacheKit.removeAll("imgLove");
        return ok;
    }

    public boolean updateDefalutImg(Object imgLoveid,String imgpath)
    {
        ImgLove imgLove = new ImgLove();
        imgLove.set("id",imgLoveid);
        imgLove.set("defaultimg",imgpath);
         return imgLove.update();
    }

    public boolean updateVisit(Object imgLoveid,int num)
    {
        ImgLove imgLove = new ImgLove();
        imgLove.set("id",imgLoveid);
        imgLove.set("visit",num);
        return imgLove.update();
    }

    public boolean updateDays(Object imgLoveid,Long days)
    {
        ImgLove imgLove = new ImgLove();
        imgLove.set("id",imgLoveid);
        imgLove.set("days",days);
        return imgLove.update();
    }

}