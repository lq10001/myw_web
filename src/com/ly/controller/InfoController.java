package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Info;
import com.ly.tool.Dwz;


public class InfoController extends Controller {

    public void index()
    {
    	Info info= getModel(Info.class);
        setAttr("page", Info.infoDao.getListInfo(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),info));
        setAttr("info", info);
        render("info_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("info",null);
        }else{
            setAttr("info", Info.infoDao.getInfo(id));
        }
        render("info.jsp");
    }

    public void save()
    {
        Info info = getModel(Info.class);
        boolean ok = Info.infoDao.saveOrUpdate(info);
        renderJson(Dwz.jsonRtn(ok, "info", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Info.infoDao.deleteById(getParaToInt());
        CacheKit.removeAll("info");
        renderJson(Dwz.jsonRtn(ok, "info", ""));
    }
}
