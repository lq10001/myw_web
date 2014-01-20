package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class Webmenu extends Model<Webmenu> {

    public static final Webmenu webmenuDao = new Webmenu();

    public List<Webmenu> getListMenu()
    {
        return webmenuDao.find("select * from webmenu order by id");
    }

    public Webmenu getWebmenu(Integer id)
    {
        return webmenuDao.findById(id);
    }

    public Page<Webmenu> getListWebmenu(int pageNum,int pageSize,Webmenu webmenu)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(webmenu, sb))
        {
            return webmenuDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return webmenuDao.paginateByCache("webmenu", "page_webmenu_" + pageNum, pageNum, pageSize, "select *", "from webmenu order by id desc");
        }
    }

    public boolean saveOrUpdate(Webmenu webmenu)
    {
        boolean ok = false;
        Integer id = webmenu.getInt("id");
        if (id == null || id <= 0){
            ok =  webmenu.save();
        }else{
            ok = webmenu.update();
        }
        CacheKit.removeAll("webmenu");
        return ok;
    }
}