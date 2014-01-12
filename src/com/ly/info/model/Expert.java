package com.ly.info.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Expert extends Model<Expert> {

    public static final Expert expertDao = new Expert();

    public Expert getExpert(Integer id)
    {
        return expertDao.findById(id);
    }

    public Page<Expert> getListExpert(int pageNum,int pageSize,Expert expert)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(expert, sb))
        {
            return expertDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return expertDao.paginateByCache("expert", "page_expert_" + pageNum, pageNum, pageSize, "select *", "from expert order by id desc");
        }
    }

    public boolean saveOrUpdate(Expert expert)
    {
        boolean ok = false;
        Integer id = expert.getInt("id");
        if (id == null || id <= 0){
            ok =  expert.save();
        }else{
            ok = expert.update();
        }
        CacheKit.removeAll("expert");
        return ok;
    }
}