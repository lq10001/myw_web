package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Ad;
import com.ly.tool.Dwz;


public class AdController extends Controller {

    public void index()
    {
    	Ad ad= getModel(Ad.class);
        setAttr("page", Ad.adDao.getListAd(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),ad));
        setAttr("ad", ad);
        render("ad_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("ad",null);
        }else{
            setAttr("ad", Ad.adDao.getAd(id));
        }
        render("ad.jsp");
    }

    public void save()
    {
        Ad ad = getModel(Ad.class);
        boolean ok = Ad.adDao.saveOrUpdate(ad);
        renderJson(Dwz.jsonRtn(ok,"ad","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Ad.adDao.deleteById(getParaToInt());
        CacheKit.removeAll("ad");
        renderJson(Dwz.jsonRtn(ok,"ad",""));
    }
}
