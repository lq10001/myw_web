package com.ly.pg.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.pg.model.Protocal;
import com.ly.tool.Dwz;


public class ProtocalController extends Controller {

    public void index()
    {
    	Protocal protocal= getModel(Protocal.class);
        setAttr("page", Protocal.protocalDao.getListProtocal(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),protocal));
        setAttr("protocal", protocal);
        render("protocal_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("protocal",null);
        }else{
            setAttr("protocal", Protocal.protocalDao.getProtocal(id));
        }
        render("protocal.jsp");
    }

    public void save()
    {
        Protocal protocal = getModel(Protocal.class);
        boolean ok = Protocal.protocalDao.saveOrUpdate(protocal);
        renderJson(Dwz.jsonRtn(ok,"protocal","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Protocal.protocalDao.deleteById(getParaToInt());
        CacheKit.removeAll("protocal");
        renderJson(Dwz.jsonRtn(ok,"protocal",""));
    }
}
