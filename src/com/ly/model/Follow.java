package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Follow extends Model<Follow> {

    public static final Follow followDao = new Follow();

    public List<Follow> getListFollow()
    {
        return followDao.find("select * from follow");
    }


    public List<Follow> getListFollowByUser(Integer userid)
    {
        return followDao.find("select * from follow  where follow.userid =" + userid);
    }


    public List<Follow> getListFollowFollowByUser(Integer userid)
    {
        return followDao.find("select follow.* from follow inner join follow on follow.followid = follow.id where follow.userid =" + userid);
    }




    public List<Follow> getListFollowTop10()
    {
        return followDao.find("select * from follow LIMIT 10 ");
    }

    public List<Follow> getListMyFollow10(Integer userid)
    {
        return followDao.find("select * from follow join img where follow.id = img.followid and follow.userid =" + userid);
    }

    public Follow getFollow(Integer id)
    {
        return followDao.findById(id);
    }

    public Page<Follow> getListFollow(int pageNum,int pageSize,Follow follow)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(follow, sb))
        {
            return followDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return followDao.paginateByCache("follow", "page_follow_" + pageNum, pageNum, pageSize, "select *", "from follow order by id desc");
        }
    }

    public boolean saveOrUpdate(Follow follow)
    {
        boolean ok = false;
        Integer id = follow.getInt("id");
        if (id == null || id <= 0){
            ok =  follow.save();
        }else{
            ok = follow.update();
        }
//        CacheKit.removeAll("follow");
        return ok;
    }

    public boolean updateDefalutImg(Object followid,String imgpath)
    {
        Follow follow = new Follow();
        follow.set("id",followid);
        follow.set("defaultimg",imgpath);
         return follow.update();
    }

}