package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class Trip extends Model<Trip> {

    public static final Trip tripDao = new Trip();

    public List<Trip> getListTrip()
    {
        return tripDao.find("select * from trip");
    }


    public List<Trip> getListTripByUser(Integer userid)
    {
        return tripDao.find("select * from trip  where trip.userid =" + userid);
    }

    public List<Trip> getListTripTop10()
    {
        return tripDao.find("select * from trip LIMIT 10 ");
    }

    public List<Trip> getListMyTrip10(Integer userid)
    {
        return tripDao.find("select * from trip join img where trip.id = img.tripid and trip.userid =" + userid);
    }

    public Trip getTrip(Integer id)
    {
        return tripDao.findById(id);
    }

    public Page<Trip> getListTrip(int pageNum,int pageSize,Trip trip)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(trip, sb))
        {
            return tripDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return tripDao.paginateByCache("trip", "page_trip_" + pageNum, pageNum, pageSize, "select *", "from trip order by id desc");
        }
    }

    public boolean saveOrUpdate(Trip trip)
    {
        boolean ok = false;
        Integer id = trip.getInt("id");
        if (id == null || id <= 0){
            ok =  trip.save();
        }else{
            ok = trip.update();
        }
//        CacheKit.removeAll("trip");
        return ok;
    }

    public boolean updateDefalutImg(Object tripid,String imgpath)
    {
        Trip trip = new Trip();
        trip.set("id",tripid);
        trip.set("defaultimg",imgpath);
         return trip.update();
    }

}