package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Trip;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;


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
        Object o = session.getAttribute("userid");
        Trip trip = getModel(Trip.class);
        trip.set("userid",o);
        boolean ok = Trip.tripDao.saveOrUpdate(trip);
        if (ok)
        {
            redirect("/upload");
        }
    }

    public void del()
    {
        boolean ok =  Trip.tripDao.deleteById(getParaToInt());
        CacheKit.removeAll("trip");
        renderJson(Dwz.jsonRtn(ok,"trip",""));
    }
}
