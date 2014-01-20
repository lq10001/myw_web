package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class Menu extends Model<Menu> {

    public static final Menu menuDao = new Menu();

    public Menu getMenu(Integer id)
    {
        return menuDao.findById(id);
    }

    public Page<Menu> getListMenu(int pageNum,int pageSize,Menu menu)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(menu, sb))
        {
            return menuDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return menuDao.paginateByCache("menu", "page_menu_" + pageNum, pageNum, pageSize, "select *", "from menu order by id desc");
        }
    }

    public boolean saveOrUpdate(Menu menu)
    {
        boolean ok = false;
        Integer id = menu.getInt("id");
        if (id == null || id <= 0){
            ok =  menu.save();
        }else{
            ok = menu.update();
        }
        CacheKit.removeAll("menu");
        return ok;
    }

    //menu_tree

    public List<Menu> getListPMenu()
    {
        return menuDao.find("select * from menu where pname = '0' order by id");
    }

    public List<Menu> getListMenu(String pname)
    {
        return menuDao.find("select * from menu where pname = '"+pname+"' order by id");
    }



}