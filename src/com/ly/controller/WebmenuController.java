package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;


public class WebmenuController extends Controller {

    public void index()
    {

        Webmenu menu= getModel(Webmenu.class);
        setAttr("page", Webmenu.webmenuDao.getListWebmenu(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("webmenu", menu);
        render("webmenu_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("webmenu",null);
        }else{
            setAttr("webmenu", Webmenu.webmenuDao.getWebmenu(id));
        }
        render("webmenu.jsp");
    }

    public void save()
    {
        Webmenu webmenu = getModel(Webmenu.class);
        boolean ok = Webmenu.webmenuDao.saveOrUpdate(webmenu);
        renderJson(Dwz.jsonRtn(ok,"webmenu","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Webmenu.webmenuDao.deleteById(getParaToInt());
        CacheKit.removeAll("webmenu");
        renderJson(Dwz.jsonRtn(ok,"webmenu",""));
    }
}
