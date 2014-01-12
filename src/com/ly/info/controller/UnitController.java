package com.ly.info.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.info.model.Unit;
import com.ly.tool.Dwz;


public class UnitController extends Controller {

    public void index()
    {
    	Unit unit= getModel(Unit.class);
        setAttr("page", Unit.unitDao.getListUnit(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),unit));
        setAttr("unit", unit);
        render("unit_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("unit",null);
        }else{
            setAttr("unit", Unit.unitDao.getUnit(id));
        }
        render("unit.jsp");
    }

    public void save()
    {
        Unit unit = getModel(Unit.class);
        boolean ok = Unit.unitDao.saveOrUpdate(unit);
        renderJson(Dwz.jsonRtn(ok,"unit","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Unit.unitDao.deleteById(getParaToInt());
        CacheKit.removeAll("unit");
        renderJson(Dwz.jsonRtn(ok,"unit",""));
    }
}
