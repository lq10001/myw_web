package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.News;
import com.ly.tool.Dwz;


public class NewsController extends Controller {

    public void index()
    {
    	News news= getModel(News.class);
        setAttr("page", News.newsDao.getListNews(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),news));
        setAttr("news", news);
        render("news_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("news",null);
        }else{
            setAttr("news", News.newsDao.getNews(id));
        }
        render("news.jsp");
    }

    public void save()
    {
        News news = getModel(News.class);
        boolean ok = News.newsDao.saveOrUpdate(news);
        renderJson(Dwz.jsonRtn(ok, "news", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  News.newsDao.deleteById(getParaToInt());
        CacheKit.removeAll("news");
        renderJson(Dwz.jsonRtn(ok, "news", ""));
    }
}
