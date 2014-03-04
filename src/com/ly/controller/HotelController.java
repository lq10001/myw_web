package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.Img;
import com.ly.model.Hotel;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


public class HotelController extends Controller {

    public void index()
    {

        Hotel menu= getModel(Hotel.class);
        setAttr("page", Hotel.hotelDao.getListHotel(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("hotel", menu);
        render("user_list.jsp");
        render("hotel_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("hotel",null);
        }else{
            setAttr("hotel", Hotel.hotelDao.getHotel(id));
        }
        render("hotel.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);

        Hotel hotel = getModel(Hotel.class);
        hotel.set("userid",userid);
        hotel.set("tripid",tripid);
        hotel.set("adddate",new Date());
        System.out.println(hotel.get("name"));
        boolean ok = Hotel.hotelDao.saveOrUpdate(hotel);
        renderJson(ok ? "1" : "0");
    }

    public void del()
    {
        boolean ok =  Hotel.hotelDao.deleteById(getParaToInt());
        CacheKit.removeAll("hotel");
        renderJson(Dwz.jsonRtn(ok,"hotel",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer hotelid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,hotelid);
        setAttr("hotel", Hotel.hotelDao.getHotel(hotelid));


        render("/WEB-INF/index/show.jsp");
    }

}
