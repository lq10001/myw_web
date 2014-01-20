package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Newstype;
import com.ly.tool.Dwz;


public class NewstypeController extends Controller {

    public void index()
    {
    	Newstype newstype= getModel(Newstype.class);
        setAttr("page", Newstype.newstypeDao.getListNewstype(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),newstype));
        setAttr("newstype", newstype);
        render("newstype_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("newstype",null);
        }else{
            setAttr("newstype", Newstype.newstypeDao.getNewstype(id));
        }
        render("newstype.jsp");
    }

    public void save()
    {
        Newstype newstype = getModel(Newstype.class);
        boolean ok = Newstype.newstypeDao.saveOrUpdate(newstype);
        renderJson(Dwz.jsonRtn(ok, "newstype", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Newstype.newstypeDao.deleteById(getParaToInt());
        CacheKit.removeAll("newstype");
        renderJson(Dwz.jsonRtn(ok, "newstype", ""));
    }
}
