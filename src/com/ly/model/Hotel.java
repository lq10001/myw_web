package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Hotel extends Model<Hotel> {

    public static final Hotel hotelDao = new Hotel();

    public List<Hotel> getListHotel()
    {
        return hotelDao.find("select * from hotel");
    }


    public List<Hotel> getListHotelByUser(Integer userid)
    {
        return hotelDao.find("select * from hotel  where hotel.userid =" + userid);
    }

    public List<Hotel> getListHotelByUserAndTrip(Integer userid,Integer tripid)
    {
        return hotelDao.find("select * from hotel  where hotel.userid =" + userid + " and tripid = "+tripid);
    }


    public List<Hotel> getListHotelTop10()
    {
        return hotelDao.find("select  * from hotel join img where hotel.id = img.hotelid and img.isdefault = 1 LIMIT 10 ");
    }

    public List<Hotel> getListMyHotel10(Integer userid)
    {
        return hotelDao.find("select * from hotel join img where hotel.id = img.hotelid and hotel.userid =" + userid);
    }

    public Hotel getHotel(Integer id)
    {
        return hotelDao.findById(id);
    }

    public Page<Hotel> getListHotel(int pageNum,int pageSize,Hotel hotel)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(hotel, sb))
        {
            return hotelDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return hotelDao.paginateByCache("hotel", "page_hotel_" + pageNum, pageNum, pageSize, "select *", "from hotel order by id desc");
        }
    }

    public boolean saveOrUpdate(Hotel hotel)
    {
        boolean ok = false;
        Integer id = hotel.getInt("id");
        if (id == null || id <= 0){
            ok =  hotel.save();
        }else{
            ok = hotel.update();
        }
//        CacheKit.removeAll("hotel");
        return ok;
    }

    public boolean updateDefalutImg(Object hotelid,String imgpath)
    {
        Hotel hotel = new Hotel();
        hotel.set("id",hotelid);
        hotel.set("defaultimg",imgpath);
         return hotel.update();
    }

}