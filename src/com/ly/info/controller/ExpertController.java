package com.ly.info.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.info.model.Expert;
import com.ly.tool.Dwz;


public class ExpertController extends Controller {

    public void index()
    {
    	Expert expert= getModel(Expert.class);
        setAttr("page", Expert.expertDao.getListExpert(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),expert));
        setAttr("expert", expert);
        render("expert_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("expert",null);
        }else{
            setAttr("expert", Expert.expertDao.getExpert(id));
        }
        render("expert.jsp");
    }

    public void save()
    {
        Expert expert = getModel(Expert.class);
        boolean ok = Expert.expertDao.saveOrUpdate(expert);
        renderJson(Dwz.jsonRtn(ok,"expert","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Expert.expertDao.deleteById(getParaToInt());
        CacheKit.removeAll("expert");
        renderJson(Dwz.jsonRtn(ok,"expert",""));
    }
}
