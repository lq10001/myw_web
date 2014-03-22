package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Hot extends Model<Hot> {

    public static final Hot hotDao = new Hot();

    public List<Hot> getListHot()
    {
        return hotDao.find("select * from hot");
    }

    public List<Hot> getListHotDefault(int type)
    {
        return hotDao.find("select * from hot  where isdefault = 1 and type =" + type);
    }


    public List<Hot> getListHotByUser(Integer userid)
    {
        return hotDao.find("select * from hot  where hot.userid =" + userid);
    }

    public List<Hot> getListHotByTrip(Integer tripid)
    {
        return hotDao.find("select * from hot  where  tripid = "+tripid);
    }


    public List<Hot> getListHotByUserAndTrip(Integer userid,Integer tripid)
    {
        return hotDao.find("select * from hot  where hot.userid =" + userid + " and tripid = "+tripid);
    }


    public List<Hot> getListHotTop10()
    {
        return hotDao.find("select  * from hot join img where hot.id = img.hotid and img.isdefault = 1 LIMIT 10 ");
    }

    public List<Hot> getListMyHot10(Integer userid)
    {
        return hotDao.find("select * from hot join img where hot.id = img.hotid and hot.userid =" + userid);
    }

    public Hot getHot(Integer id)
    {
        return hotDao.findById(id);
    }

    public Page<Hot> getListHot(int pageNum,int pageSize,Hot hot)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(hot, sb))
        {
            return hotDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return hotDao.paginateByCache("hot", "page_hot_" + pageNum, pageNum, pageSize, "select *", "from hot order by id desc");
        }
    }

    public boolean saveOrUpdate(Hot hot)
    {
        boolean ok = false;
        Integer id = hot.getInt("id");
        if (id == null || id <= 0){
            ok =  hot.save();
        }else{
            ok = hot.update();
        }
//        CacheKit.removeAll("hot");
        return ok;
    }

    public boolean updateDefalutImg(Object hotid,String imgpath)
    {
        Hot hot = new Hot();
        hot.set("id",hotid);
        hot.set("defaultimg",imgpath);
         return hot.update();
    }

}