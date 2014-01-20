package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Link extends Model<Link> {

    public static final Link linkDao = new Link();

    public Link getLink(Integer id)
    {
        return linkDao.findById(id);
    }

    public Page<Link> getListLink(int pageNum,int pageSize,Link link)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(link, sb))
        {
            return linkDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return linkDao.paginateByCache("link", "page_link_" + pageNum, pageNum, pageSize, "select *", "from link order by id desc");
        }
    }

    public boolean saveOrUpdate(Link link)
    {
        boolean ok = false;
        Integer id = link.getInt("id");
        if (id == null || id <= 0){
            ok =  link.save();
        }else{
            ok = link.update();
        }
        CacheKit.removeAll("link");
        return ok;
    }
}