package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.Restaurant;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


public class RestaurantController extends Controller {

    public void index()
    {

        Restaurant menu= getModel(Restaurant.class);
        setAttr("page", Restaurant.restaurantDao.getListRestaurant(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("restaurant", menu);
        render("user_list.jsp");
        render("restaurant_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("restaurant",null);
        }else{
            setAttr("restaurant", Restaurant.restaurantDao.getRestaurant(id));
        }
        render("restaurant.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);

        Restaurant restaurant = getModel(Restaurant.class);
        restaurant.set("userid",userid);
        restaurant.set("tripid",tripid);
        restaurant.set("adddate",new Date());
        boolean ok = Restaurant.restaurantDao.saveOrUpdate(restaurant);
        renderJson(ok ? "1" : "0");
    }

    public void del()
    {
        boolean ok =  Restaurant.restaurantDao.deleteById(getParaToInt());
        CacheKit.removeAll("restaurant");
        renderJson(Dwz.jsonRtn(ok,"restaurant",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer restaurantid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,restaurantid);
        setAttr("restaurant", Restaurant.restaurantDao.getRestaurant(restaurantid));

        render("/WEB-INF/index/show.jsp");
    }

}
