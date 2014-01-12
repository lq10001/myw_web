package com.ly.pg.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Protocal extends Model<Protocal> {

    public static final Protocal protocalDao = new Protocal();

    public Protocal getProtocal(Integer id)
    {
        return protocalDao.findById(id);
    }

    public Page<Protocal> getListProtocal(int pageNum,int pageSize,Protocal protocal)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(protocal, sb))
        {
            return protocalDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return protocalDao.paginateByCache("protocal", "page_protocal_" + pageNum, pageNum, pageSize, "select *", "from protocal order by id desc");
        }
    }

    public boolean saveOrUpdate(Protocal protocal)
    {
        boolean ok = false;
        Integer id = protocal.getInt("id");
        if (id == null || id <= 0){
            ok =  protocal.save();
        }else{
            ok = protocal.update();
        }
        CacheKit.removeAll("protocal");
        return ok;
    }
}