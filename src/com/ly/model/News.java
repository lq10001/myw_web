package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class News extends Model<News> {

    public static final News newsDao = new News();

    public News getNews(Integer id)
    {
        return newsDao.findById(id);
    }

    public Page<News> getListNews(int pageNum,int pageSize,News news)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(news, sb))
        {
            return newsDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return newsDao.paginateByCache("news", "page_news_" + pageNum, pageNum, pageSize, "select *", "from news order by id desc");
        }
    }

    public boolean saveOrUpdate(News news)
    {
        boolean ok = false;
        Integer id = news.getInt("id");
        if (id == null || id <= 0){
            ok =  news.save();
        }else{
            ok = news.update();
        }
        CacheKit.removeAll("news");
        return ok;
    }
}