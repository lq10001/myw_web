package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Guide extends Model<Guide> {

    public static final Guide guideDao = new Guide();

    public List<Guide> getListGuide()
    {
        return guideDao.find("select * from guide");
    }


    public List<Guide> getListGuideByUser(Integer userid)
    {
        return guideDao.find("select * from guide  where guide.userid =" + userid);
    }

    public List<Guide> getListGuideByTrip(Integer tripid)
    {
        return guideDao.find("select * from guide  where  tripid = "+tripid);
    }


    public List<Guide> getListGuideByUserAndTrip(Integer userid,Integer tripid)
    {
        return guideDao.find("select * from guide  where guide.userid =" + userid + " and tripid = "+tripid);
    }


    public List<Guide> getListGuideTop10()
    {
        return guideDao.find("select  * from guide join img where guide.id = img.guideid and img.isdefault = 1 LIMIT 10 ");
    }

    public List<Guide> getListMyGuide10(Integer userid)
    {
        return guideDao.find("select * from guide join img where guide.id = img.guideid and guide.userid =" + userid);
    }

    public Guide getGuide(Integer id)
    {
        return guideDao.findById(id);
    }

    public Page<Guide> getListGuide(int pageNum,int pageSize,Guide guide)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(guide, sb))
        {
            return guideDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return guideDao.paginateByCache("guide", "page_guide_" + pageNum, pageNum, pageSize, "select *", "from guide order by id desc");
        }
    }

    public boolean saveOrUpdate(Guide guide)
    {
        boolean ok = false;
        Integer id = guide.getInt("id");
        if (id == null || id <= 0){
            ok =  guide.save();
        }else{
            ok = guide.update();
        }
//        CacheKit.removeAll("guide");
        return ok;
    }

    public boolean updateDefalutImg(Object guideid,String imgpath)
    {
        Guide guide = new Guide();
        guide.set("id",guideid);
        guide.set("defaultimg",imgpath);
         return guide.update();
    }

}