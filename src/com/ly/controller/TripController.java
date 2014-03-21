package com.ly.controller;

import com.alibaba.fastjson.JSON;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.*;
import com.ly.tool.Dwz;
import com.ly.vo.TripDay;
import com.ly.vo.TripInfo;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;


public class TripController extends Controller {

    public void index()
    {

        Trip menu= getModel(Trip.class);
        setAttr("page", Trip.tripDao.getListTrip(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("trip", menu);
        render("user_list.jsp");
        render("trip_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("trip",null);
        }else{
            setAttr("trip", Trip.tripDao.getTrip(id));
        }
        render("trip.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Trip trip = getModel(Trip.class);
        trip.set("userid",userid);
        trip.set("adddate",new Date());
        System.out.println(trip.get("name"));
        boolean ok = Trip.tripDao.saveOrUpdate(trip);
        if (ok)
        {
            Integer tripid = trip.getInt("id");
            session.setAttribute(Global.TRIP_ID,tripid);
            redirect("/upload");
        }
    }

    public void del()
    {
        boolean ok =  Trip.tripDao.deleteById(getParaToInt());
        CacheKit.removeAll("trip");
        renderJson(Dwz.jsonRtn(ok,"trip",""));
    }

    public void show()
    {
        Integer tripid = Integer.parseInt(getPara(0));
        showImg(tripid);
    }

    private void showImg(Integer tripid)
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();

        session.setAttribute(Global.TRIP_ID,tripid);
        Trip trip = Trip.tripDao.getTrip(tripid);
        setAttr("trip",trip);

        int visit = trip.getInt("visit");

        Trip.tripDao.updateVisit(tripid,visit + 1);

        List<Img> listDate = Img.imgDao.getListImgDate(tripid);
        int i = 0;
        Date minDate = null;
        List<TripDay> listDay = new LinkedList<TripDay>();
        for (Img img: listDate)
        {
            TripDay tripDay = new TripDay();
            Date tripdate = img.getDate("createdate");
            if (tripdate == null)
            {
                continue;
            }
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            String a1=dateFormat.format(tripdate);
            if (i  < 1)
            {
                minDate = tripdate;
                tripDay.setDay(1L);
                tripDay.setTripDate(a1);
            }else{
                // 86400000 =  24*60*60*1000
                Long day = (tripdate.getTime() - minDate.getTime()) /  86400000;
                System.out.println(day);
                tripDay.setDay(day + 1);
                tripDay.setTripDate(a1);


            }
            listDay.add(tripDay);
            i++;
        }
        setAttr("list_day",listDay);


        List<Img> list_img = Img.imgDao.getListImgLoveByTripid(tripid);
        setAttr("list_img",list_img);

        List<Flight> flight_list = Flight.flightDao.getListFlightByTrip(tripid);
        setAttr("flight_list",flight_list);

        List<Hotel> hotel_list = Hotel.hotelDao.getListHotelByTrip(tripid);
        setAttr("hotel_list",hotel_list);

        List<Place> place_list = Place.placeDao.getListPlaceByTripid(tripid);
        setAttr("place_list",place_list);

        List<Guide> guide_list = Guide.guideDao.getListGuideByTrip(tripid);
        setAttr("guide_list",guide_list);

        List<Restaurant> res_list = Restaurant.restaurantDao.getListRestaurantByTrip(tripid);
        setAttr("restaurant_list",res_list);

        render("/WEB-INF/index/show.jsp");
    }

    public void follow()
    {
        int id = getParaToInt("id");

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Follow follow = new Follow();
        follow.set("tripid",id);
        follow.set("userid",userid);
        boolean ok =  Follow.followDao.saveOrUpdate(follow);
        renderJson(ok ? "1" : "0");
    }

    public void listPlace()
    {
        HttpSession session = getSession();
        Object o_tripid = session.getAttribute(Global.TRIP_ID);
        Integer tripid = Integer.parseInt(o_tripid.toString());

        String tripDtae  = getPara("tripDate");
        List<TripInfo> infos = new LinkedList<TripInfo>();
        List<Place> placeList = Place.placeDao.getListPlaceByDate(tripid, tripDtae);
        for (Place place : placeList)
        {
            TripInfo info = new TripInfo();
            info.setType(place.getInt("type"));
            info.setName(place.getStr("name"));
            infos.add(info);
        }

        List<Hotel> hotel_list = Hotel.hotelDao.getListHotelByTrip(tripid);
        setAttr("hotel_list",hotel_list);


        System.out.println(JSON.toJSONString(infos));

        renderJson(JSON.toJSONString(infos));
    }

    public void love()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        if (userid == null)
        {
            renderJson("-1");
            return;
        }

        int tripid = getParaToInt("id");
        Trip trip = Trip.tripDao.findById(tripid);

        TripLove tripLove = TripLove.tripLoveDao.getTripLove(userid,tripid);

        int num = 0;

        if (tripLove == null)
        {
            TripLove tlove = new TripLove();

            tlove.set("userid",userid);
            tlove.set("tripid",tripid);
            TripLove.tripLoveDao.saveOrUpdate(tlove);
            num = trip.getInt("love") + 1;
        }else{
            tripLove.delete();
            num = trip.getInt("love") - 1;
        }
        trip.set("love",num);
        Boolean ok = Trip.tripDao.saveOrUpdate(trip);
        renderJson(ok ? num : "0");
    }

}
