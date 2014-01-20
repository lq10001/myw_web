package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Newstype extends Model<Newstype> {

    public static final Newstype newstypeDao = new Newstype();

    public Newstype getNewstype(Integer id)
    {
        return newstypeDao.findById(id);
    }

    public Page<Newstype> getListNewstype(int pageNum,int pageSize,Newstype newstype)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(newstype, sb))
        {
            return newstypeDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return newstypeDao.paginateByCache("newstype", "page_newstype_" + pageNum, pageNum, pageSize, "select *", "from newstype order by id desc");
        }
    }

    public boolean saveOrUpdate(Newstype newstype)
    {
        boolean ok = false;
        Integer id = newstype.getInt("id");
        if (id == null || id <= 0){
            ok =  newstype.save();
        }else{
            ok = newstype.update();
        }
        CacheKit.removeAll("newstype");
        return ok;
    }
}