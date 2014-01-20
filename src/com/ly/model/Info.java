package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Info extends Model<Info> {

    public static final Info infoDao = new Info();

    public Info getInfo(Integer id)
    {
        return infoDao.findById(id);
    }

    public Page<Info> getListInfo(int pageNum,int pageSize,Info info)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(info, sb))
        {
            return infoDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return infoDao.paginateByCache("info", "page_info_" + pageNum, pageNum, pageSize, "select *", "from info order by id desc");
        }
    }

    public boolean saveOrUpdate(Info info)
    {
        boolean ok = false;
        Integer id = info.getInt("id");
        if (id == null || id <= 0){
            ok =  info.save();
        }else{
            ok = info.update();
        }
        CacheKit.removeAll("info");
        return ok;
    }
}