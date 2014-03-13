package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.Img;
import com.ly.model.Place;
import com.ly.model.Trip;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


public class PlaceController extends Controller {

    public void index()
    {

        Place menu= getModel(Place.class);
        setAttr("page", Place.placeDao.getListPlace(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("place", menu);
        render("place_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("place",null);
        }else{
            setAttr("place", Place.placeDao.getPlace(id));
        }
        render("place.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);
        Place place = getModel(Place.class);
        place.set("userid",userid);
        place.set("tripid",tripid);
        place.set("adddate",new Date());
        System.out.println("--------   "+place.get("name"));
        boolean ok = Place.placeDao.saveOrUpdate(place);
        if (ok)
        {
            Long days = Place.placeDao.getDays(Integer.parseInt(tripid.toString()));
            Trip.tripDao.updateDays(tripid,days);
            redirect("/showPlace");
        }
    }

    public void del()
    {
        boolean ok =  Place.placeDao.deleteById(getParaToInt());
        CacheKit.removeAll("place");
        renderJson(Dwz.jsonRtn(ok,"place",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer placeid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,placeid);
        setAttr("place", Place.placeDao.getPlace(placeid));

//        List<Img> list_img = Img.imgDao.getListImgByPlaceid(Integer.parseInt(userid.toString()),placeid);
//        setAttr("list_img",list_img);

        render("/WEB-INF/index/show.jsp");
    }

}
