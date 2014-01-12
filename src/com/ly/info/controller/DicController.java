package com.ly.info.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.info.model.Dic;
import com.ly.tool.Dwz;


public class DicController extends Controller {

    public void index()
    {
    	Dic dic= getModel(Dic.class);
        setAttr("page", Dic.dicDao.getListDic(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),dic));
        setAttr("dic", dic);
        render("dic_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("dic",null);
        }else{
            setAttr("dic", Dic.dicDao.getDic(id));
        }
        render("dic.jsp");
    }

    public void save()
    {
        Dic dic = getModel(Dic.class);
        boolean ok = Dic.dicDao.saveOrUpdate(dic);
        renderJson(Dwz.jsonRtn(ok,"dic","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Dic.dicDao.deleteById(getParaToInt());
        CacheKit.removeAll("dic");
        renderJson(Dwz.jsonRtn(ok,"dic",""));
    }
}
