package com.ly;

import com.jfinal.core.Controller;
import com.ly.model.*;
import com.ly.tool.MenuTree;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class IndexController extends Controller {


    private void getMenu()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
    }

    public void index() {
        getMenu();
        List<Trip> listTrip = Trip.tripDao.getListTripTop10();
        setAttr("list_trip",listTrip);

        render("index/index.jsp");

    }

    public void mudi() {
        getMenu();

        List<Trip> listTrip = Trip.tripDao.getListTripTop10();
        setAttr("list_trip",listTrip);

        setAttr("selmenu","mudi");
        render("index/mudi.jsp");
    }

    public void down() {
        render("index/down.jsp");
    }

    public void travel() {
        setAttr("selmenu","xing");
        getMenu();
        List<Trip> listTrip = Trip.tripDao.getListTripTop10();
        setAttr("list_trip",listTrip);
        render("index/xing.jsp");
    }

    public void ok() {
        String name = getPara("username");
        String pwd = getPara("password");
        String yz = getPara("yz");
        if (name.equals("hjpg") && pwd.equals("111"))
        {
            setAttr("menu_tree", MenuTree.getMenuTree());
            render("sys_index.jsp");
        }else{
            setAttr("err","用户名和密码不正确");
            render("login.jsp");
        }

    }

    public void login()
    {
        getMenu();
        render("index/login.jsp");
    }

    public void register()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        render("index/register.jsp");
    }

    public void my()
    {
        getMenu();
        HttpSession session = getSession();
        Object o_userid = session.getAttribute(Global.USER_ID);
        if (o_userid == null)
        {
            this.login();
        }else{
            Integer userid = Integer.parseInt(o_userid.toString());


            List<Trip> listFollow = Trip.tripDao.getListFollowTripByUser(userid);
            setAttr("list_follow",listFollow);

            List<Trip> listTrip = Trip.tripDao.getListTripByUser(userid);
            setAttr("list_trip",listTrip);


            List<Img> listImg = Img.imgDao.getListImgByUserId(userid);
            setAttr("list_img",listImg);
            render("index/my.jsp");
        }
    }

    public void showPlace()
    {
        getMenu();
        HttpSession session = getSession();
        Integer tripid = Integer.parseInt(session.getAttribute(Global.TRIP_ID).toString());
        setAttr("tripid",tripid);

        List<Place> list_place = Place.placeDao.getListPlaceByTripid(tripid);
        setAttr("list_place",list_place);

        Date d=new Date();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
        setAttr("nowDate",sf.format(d));

        render("index/place.jsp");
    }

    public void upload()
    {
        getMenu();
        HttpSession session = getSession();
        Integer placeid = Integer.parseInt(getPara(0));

        session.setAttribute(Global.PLACE_ID,placeid);

        setAttr(Global.TRIP_ID, session.getAttribute(Global.TRIP_ID));
        List<Img> list_img = Img.imgDao.getListImgByPlaceid(placeid);
        setAttr("list_img",list_img);
        render("index/upload.jsp");
    }

    public void linkimg()
    {
        getMenu();
        render("index/show.jsp");
    }

    public void showBaike()
    {
        getMenu();
        setAttr("selmenu","baike");

        List<Baike> baikes = Baike.baikeDao.getListBaike();
        setAttr("listBaike",baikes);
        render("index/baike.jsp");
    }

    public void myBaike()
    {
        getMenu();
        setAttr("selmenu","baike");

        HttpSession session = getSession();
        Object o_userid = session.getAttribute(Global.USER_ID);

        List<Baike> baikes = Baike.baikeDao.getListBaike(o_userid);
        setAttr("listBaike",baikes);
        render("index/baike.jsp");
    }

    public void baikeInfo()
    {
        getMenu();
        setAttr("selmenu","baike");

        Integer baikeid = Integer.parseInt(getPara(0));
        Baike baike = Baike.baikeDao.findById(baikeid);
        setAttr("baike",baike);
        render("index/baikeInfo.jsp");
    }



    public void loginOut()
    {
        getMenu();
        HttpSession session = getSession();
        session.removeAttribute(Global.USER_ID);
        Object userid = session.getAttribute(Global.USER_ID);
        redirect("/index");
    }

    public void search()
    {
        getMenu();
        String name = getPara("sname");
        List<Trip> listTrip = null;
        if (name.trim().length() > 0)
        {
            listTrip = Trip.tripDao.getListTripByName(name);
        }
        setAttr("list_trip",listTrip);
        render("index/search.jsp");
    }

    public void search2()
    {
        getMenu();
        String name = getPara("sname2");
        List<Trip> listTrip = null;
        if (name.trim().length() > 0)
        {
            listTrip = Trip.tripDao.getListTripByName(name);
        }
        setAttr("list_trip",listTrip);
        render("index/search.jsp");
    }


}