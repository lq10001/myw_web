package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.Img;
import com.ly.model.Flight;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


public class FlightController extends Controller {

    public void index()
    {

        Flight menu= getModel(Flight.class);
        setAttr("page", Flight.flightDao.getListFlight(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("flight", menu);
        render("user_list.jsp");
        render("flight_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("flight",null);
        }else{
            setAttr("flight", Flight.flightDao.getFlight(id));
        }
        render("flight.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);

        Flight flight = getModel(Flight.class);
        flight.set("userid",userid);
        flight.set("tripid",tripid);
        flight.set("adddate",new Date());
        boolean ok = Flight.flightDao.saveOrUpdate(flight);
        renderJson(ok ? "1" : "0");
    }

    public void del()
    {
        boolean ok =  Flight.flightDao.deleteById(getParaToInt());
        CacheKit.removeAll("flight");
        renderJson(Dwz.jsonRtn(ok,"flight",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer flightid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,flightid);
        setAttr("flight", Flight.flightDao.getFlight(flightid));


        render("/WEB-INF/index/show.jsp");
    }

}
