package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Baike extends Model<Baike> {

    public static final Baike baikeDao = new Baike();

    public List<Baike> getListBaike()
    {
        return baikeDao.find("select baike.*,`user`.`name` from baike inner join user on baike.userid = user.id  order by id desc");
    }


    public List<Baike> getListBaike(Object userid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from baike where userid =");
        sb.append(userid);
        sb.append(" order by id desc ");
        return baikeDao.find(sb.toString());
    }

    public List<Baike> getBaikeDate(Integer tripid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select  DISTINCT tripdate from baikeview where tripid =");
        sb.append(tripid);
        sb.append(" order by tripdate");
        return baikeDao.find(sb.toString());
    }

    public List<Baike> getListBaikeByTripid(Integer tripid)
    {
        return baikeDao.find("select * from baike where tripid =" + tripid);
    }

    public List<Baike> getListBaikeByDate(Integer tripid,String tripDate)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from baikeview where tripid =");
        sb.append(tripid);
        sb.append(" and tripdate ='");
        sb.append(tripDate);
        sb.append("'");
        System.out.println(sb.toString());
        return baikeDao.find(sb.toString());
    }


    public List<Baike> getListBaikeTop10()
    {
        return baikeDao.find("select * from baike limit 10");
    }



    public Baike getBaike(Integer id)
    {
        return baikeDao.findById(id);
    }

    public Page<Baike> getListBaike(int pageNum,int pageSize,Baike baike)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(baike, sb))
        {
            return baikeDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return baikeDao.paginateByCache("baike", "page_baike_" + pageNum, pageNum, pageSize, "select *", "from baike order by id desc");
        }
    }

    public boolean saveOrUpdate(Baike baike)
    {
        boolean ok = false;
        Integer id = baike.getInt("id");
        if (id == null || id <= 0){
            ok =  baike.save();
        }else{
            ok = baike.update();
        }
//        CacheKit.removeAll("baike");
        return ok;
    }

    public Long getDays(int tripid)
    {
        Baike p =  baikeDao.findFirst("select id,  datediff(max(adddate) , min(adddate)) as days from baike where tripid = "+tripid);
        Long days = p.getLong("days");
        return  days;
    }


}