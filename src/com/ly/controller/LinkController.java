package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Link;
import com.ly.tool.Dwz;


public class LinkController extends Controller {

    public void index()
    {
    	Link link= getModel(Link.class);
        setAttr("page", Link.linkDao.getListLink(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),link));
        setAttr("link", link);
        render("link_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("link",null);
        }else{
            setAttr("link", Link.linkDao.getLink(id));
        }
        render("link.jsp");
    }

    public void save()
    {
        Link link = getModel(Link.class);
        boolean ok = Link.linkDao.saveOrUpdate(link);
        renderJson(Dwz.jsonRtn(ok, "link", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Link.linkDao.deleteById(getParaToInt());
        CacheKit.removeAll("link");
        renderJson(Dwz.jsonRtn(ok, "link", ""));
    }
}
