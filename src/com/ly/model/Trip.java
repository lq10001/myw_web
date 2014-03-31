package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class Trip extends Model<Trip> {

    public static final Trip tripDao = new Trip();

    public List<Trip> getListTrip()
    {
        return tripDao.find("select * from trip");
    }


    public List<Trip> getListTripByUser(Integer userid)
    {
        return tripDao.find("select * from trip  where type = 1 and trip.userid =" + userid);
    }

    public Trip getTripVisit(Integer userid)
    {
        return tripDao.findFirst("select count(visit) as visit from trip  where userid  =" + userid);
    }

    public List<Trip> getListTripByName(String name)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from trip  where name like '%");
        sb.append(name);
        sb.append("%'");
        return tripDao.find(sb.toString());
    }

    public List<Trip> getListTripHotname(String name)
    {
        StringBuffer sb = new StringBuffer("select * from trip where name like ");
        sb.append("'%");
        sb.append(name);
        sb.append("%' limit 40");
        return tripDao.find(sb.toString());

    }


    public List<Trip> getListFollowTripByUser(Integer userid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from trip  where  type = 2 and userid = ");
        sb.append(userid.toString());
        return tripDao.find(sb.toString());
    }

    public List<Trip> getListTripTop10()
    {
        return tripDao.find("select * from trip order by visit desc  LIMIT 12 ");
    }

    public List<Trip> getListTripHot()
    {
        return tripDao.find("select * from trip order by love desc  LIMIT 20 ");
    }


    public List<Trip> getListMyTrip10(Integer userid)
    {
        return tripDao.find("select * from trip join img where trip.id = img.tripid and trip.userid =" + userid);
    }

    public List<Trip> getListTripEnd()
    {
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
        StringBuffer sb = new StringBuffer();
        sb.append("select * from trip where enddate < '");
        sb.append(df2.format(new Date()));
        sb.append("' order by enddate desc,love desc, visit desc limit 12 ");
        return tripDao.find(sb.toString());
    }

    public List<Trip> getListTripNow()
    {
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
        StringBuffer sb = new StringBuffer();
        sb.append("select * from trip where enddate >= '");
        sb.append(df2.format(new Date()));
        sb.append("' order by enddate desc,love desc,visit desc limit 12 ");
        return tripDao.find(sb.toString());
    }

    public Integer getLoveCount(Object userid)
    {
        StringBuffer sb = new StringBuffer("select sum(love)  as love from trip where userid = ");
        sb.append(userid);
        Trip trip = tripDao.findFirst(sb.toString());
        BigDecimal love = trip.getBigDecimal("love");
        return love == null ? 0 : love.intValue();
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

    public boolean updateVisit(Object tripid,int num)
    {
        Trip trip = new Trip();
        trip.set("id",tripid);
        trip.set("visit",num);
        return trip.update();
    }

    public boolean updateDays(Object tripid,Long days)
    {
        Trip trip = new Trip();
        trip.set("id",tripid);
        trip.set("days",days);
        return trip.update();
    }


}