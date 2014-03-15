package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class TripLove extends Model<TripLove> {

    public static final TripLove tripLoveDao = new TripLove();

    public List<TripLove> getListTripLove()
    {
        return tripLoveDao.find("select * from tripLove");
    }


    public List<TripLove> getListTripLoveByUser(Integer userid)
    {
        return tripLoveDao.find("select * from tripLove  where tripLove.userid =" + userid);
    }


    public List<TripLove> getListFollowTripLoveByUser(Integer userid)
    {
        return tripLoveDao.find("select tripLove.*,follow.userid fuserid from follow inner join tripLove on follow.tripLoveid = tripLove.id where follow.userid=" + userid);
    }




    public List<TripLove> getListTripLoveTop10()
    {
        return tripLoveDao.find("select * from tripLove LIMIT 10 ");
    }

    public List<TripLove> getListMyTripLove10(Integer userid)
    {
        return tripLoveDao.find("select * from tripLove join trip where tripLove.id = trip.tripLoveid and tripLove.userid =" + userid);
    }

    public TripLove getTripLove(Integer id)
    {
        return tripLoveDao.findById(id);
    }

    public TripLove getTripLove(Object userid,Integer tripid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from triplove where userid=");
        sb.append(userid);
        sb.append(" and tripid = ");
        sb.append(tripid);
        System.out.println(sb.toString());
        return tripLoveDao.findFirst(sb.toString());
    }

    public Page<TripLove> getListTripLove(int pageNum,int pageSize,TripLove tripLove)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(tripLove, sb))
        {
            return tripLoveDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return tripLoveDao.paginateByCache("tripLove", "page_tripLove_" + pageNum, pageNum, pageSize, "select *", "from tripLove order by id desc");
        }
    }

    public boolean saveOrUpdate(TripLove tripLove)
    {
        boolean ok = false;
        Integer id = tripLove.getInt("id");
        if (id == null || id <= 0){
            ok =  tripLove.save();
        }else{
            ok = tripLove.update();
        }
//        CacheKit.removeAll("tripLove");
        return ok;
    }

    public boolean updateDefalutTrip(Object tripLoveid,String trippath)
    {
        TripLove tripLove = new TripLove();
        tripLove.set("id",tripLoveid);
        tripLove.set("defaulttrip",trippath);
         return tripLove.update();
    }

    public boolean updateVisit(Object tripLoveid,int num)
    {
        TripLove tripLove = new TripLove();
        tripLove.set("id",tripLoveid);
        tripLove.set("visit",num);
        return tripLove.update();
    }

    public boolean updateDays(Object tripLoveid,Long days)
    {
        TripLove tripLove = new TripLove();
        tripLove.set("id",tripLoveid);
        tripLove.set("days",days);
        return tripLove.update();
    }

}