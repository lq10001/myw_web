package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Ad extends Model<Ad> {

    public static final Ad adDao = new Ad();

    public Ad getAd(Integer id)
    {
        return adDao.findById(id);
    }

    public Page<Ad> getListAd(int pageNum,int pageSize,Ad ad)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(ad, sb))
        {
            return adDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return adDao.paginateByCache("ad", "page_ad_" + pageNum, pageNum, pageSize, "select *", "from ad order by id desc");
        }
    }

    public boolean saveOrUpdate(Ad ad)
    {
        boolean ok = false;
        Integer id = ad.getInt("id");
        if (id == null || id <= 0){
            ok =  ad.save();
        }else{
            ok = ad.update();
        }
        CacheKit.removeAll("ad");
        return ok;
    }
}