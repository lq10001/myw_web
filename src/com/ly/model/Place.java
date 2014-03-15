package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.Date;
import java.util.List;


public class Place extends Model<Place> {

    public static final Place placeDao = new Place();

    public List<Place> getListPlace()
    {
        return placeDao.find("select * from place");
    }


    public List<Place> getListPlace(Integer userid)
    {
        return placeDao.find("select * from place where userid =" + userid);
    }

    public List<Place> getPlaceDate(Integer tripid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select  DISTINCT tripdate from placeview where tripid =");
        sb.append(tripid);
        sb.append(" order by tripdate");
        return placeDao.find(sb.toString());
    }

    public List<Place> getListPlaceByTripid(Integer tripid)
    {
        return placeDao.find("select * from place where tripid =" + tripid);
    }

    public List<Place> getListPlaceByDate(Integer tripid,String tripDate)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from placeview where tripid =");
        sb.append(tripid);
        sb.append(" and tripdate ='");
        sb.append(tripDate);
        sb.append("'");
        System.out.println(sb.toString());
        return placeDao.find(sb.toString());
    }


    public List<Place> getListPlaceTop10()
    {
        return placeDao.find("select * from place limit 10");
    }



    public Place getPlace(Integer id)
    {
        return placeDao.findById(id);
    }

    public Page<Place> getListPlace(int pageNum,int pageSize,Place place)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(place, sb))
        {
            return placeDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return placeDao.paginateByCache("place", "page_place_" + pageNum, pageNum, pageSize, "select *", "from place order by id desc");
        }
    }

    public boolean saveOrUpdate(Place place)
    {
        boolean ok = false;
        Integer id = place.getInt("id");
        if (id == null || id <= 0){
            ok =  place.save();
        }else{
            ok = place.update();
        }
//        CacheKit.removeAll("place");
        return ok;
    }

    public Long getDays(int tripid)
    {
        Place p =  placeDao.findFirst("select id,  datediff(max(adddate) , min(adddate)) as days from place where tripid = "+tripid);
        Long days = p.getLong("days");
        return  days;
    }


}