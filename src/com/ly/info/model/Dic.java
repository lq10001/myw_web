package com.ly.info.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Dic extends Model<Dic> {

    public static final Dic dicDao = new Dic();

    public Dic getDic(Integer id)
    {
        return dicDao.findById(id);
    }

    public Page<Dic> getListDic(int pageNum,int pageSize,Dic dic)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(dic, sb))
        {
            return dicDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return dicDao.paginateByCache("dic", "page_dic_" + pageNum, pageNum, pageSize, "select *", "from dic order by id desc");
        }
    }

    public boolean saveOrUpdate(Dic dic)
    {
        boolean ok = false;
        Integer id = dic.getInt("id");
        if (id == null || id <= 0){
            ok =  dic.save();
        }else{
            ok = dic.update();
        }
        CacheKit.removeAll("dic");
        return ok;
    }
}