package com.ly.sys.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.sys.model.Menu;
import com.ly.tool.Dwz;


public class MenuController extends Controller {

    public void index()
    {
    	Menu menu= getModel(Menu.class);
        setAttr("page", Menu.menuDao.getListMenu(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("menu", menu);
        render("menu_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("menu",null);
        }else{
            setAttr("menu", Menu.menuDao.getMenu(id));
        }
        render("menu.jsp");
    }

    public void save()
    {
        Menu menu = getModel(Menu.class);
        boolean ok = Menu.menuDao.saveOrUpdate(menu);
        renderJson(Dwz.jsonRtn(ok,"menu","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Menu.menuDao.deleteById(getParaToInt());
        CacheKit.removeAll("menu");
        renderJson(Dwz.jsonRtn(ok,"menu",""));
    }
}
