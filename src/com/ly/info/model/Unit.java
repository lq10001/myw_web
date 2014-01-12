package com.ly.info.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Unit extends Model<Unit> {

    public static final Unit unitDao = new Unit();

    public Unit getUnit(Integer id)
    {
        return unitDao.findById(id);
    }

    public Page<Unit> getListUnit(int pageNum,int pageSize,Unit unit)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(unit, sb))
        {
            return unitDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return unitDao.paginateByCache("unit", "page_unit_" + pageNum, pageNum, pageSize, "select *", "from unit order by id desc");
        }
    }

    public boolean saveOrUpdate(Unit unit)
    {
        boolean ok = false;
        Integer id = unit.getInt("id");
        if (id == null || id <= 0){
            ok =  unit.save();
        }else{
            ok = unit.update();
        }
        CacheKit.removeAll("unit");
        return ok;
    }
}