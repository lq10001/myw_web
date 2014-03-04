package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Flight extends Model<Flight> {

    public static final Flight flightDao = new Flight();

    public List<Flight> getListFlight()
    {
        return flightDao.find("select * from flight");
    }


    public List<Flight> getListFlightByUser(Integer userid)
    {
        return flightDao.find("select * from flight  where flight.userid =" + userid);
    }

    public List<Flight> getListFlightByUserAndTrip(Integer userid,Integer tripid)
    {
        return flightDao.find("select * from flight  where flight.userid =" + userid + " and tripid = "+tripid);
    }

    public List<Flight> getListFlightTop10()
    {
        return flightDao.find("select  * from flight join img where flight.id = img.flightid and img.isdefault = 1 LIMIT 10 ");
    }

    public List<Flight> getListMyFlight10(Integer userid)
    {
        return flightDao.find("select * from flight join img where flight.id = img.flightid and flight.userid =" + userid);
    }

    public Flight getFlight(Integer id)
    {
        return flightDao.findById(id);
    }

    public Page<Flight> getListFlight(int pageNum,int pageSize,Flight flight)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(flight, sb))
        {
            return flightDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return flightDao.paginateByCache("flight", "page_flight_" + pageNum, pageNum, pageSize, "select *", "from flight order by id desc");
        }
    }

    public boolean saveOrUpdate(Flight flight)
    {
        boolean ok = false;
        Integer id = flight.getInt("id");
        if (id == null || id <= 0){
            ok =  flight.save();
        }else{
            ok = flight.update();
        }
//        CacheKit.removeAll("flight");
        return ok;
    }

    public boolean updateDefalutImg(Object flightid,String imgpath)
    {
        Flight flight = new Flight();
        flight.set("id",flightid);
        flight.set("defaultimg",imgpath);
         return flight.update();
    }

}