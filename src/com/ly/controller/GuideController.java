package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.Guide;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


public class GuideController extends Controller {

    public void index()
    {

        Guide menu= getModel(Guide.class);
        setAttr("page", Guide.guideDao.getListGuide(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("guide", menu);
        render("user_list.jsp");
        render("guide_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("guide",null);
        }else{
            setAttr("guide", Guide.guideDao.getGuide(id));
        }
        render("guide.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        Object tripid = session.getAttribute(Global.TRIP_ID);

        Guide guide = getModel(Guide.class);
        guide.set("userid",userid);
        guide.set("tripid",tripid);
        guide.set("adddate",new Date());
        System.out.println(guide.get("name"));
        boolean ok = Guide.guideDao.saveOrUpdate(guide);
        renderJson(ok ? "1" : "0");
    }

    public void del()
    {
        boolean ok =  Guide.guideDao.deleteById(getParaToInt());
        CacheKit.removeAll("guide");
        renderJson(Dwz.jsonRtn(ok,"guide",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer guideid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,guideid);
        setAttr("guide", Guide.guideDao.getGuide(guideid));


        render("/WEB-INF/index/show.jsp");
    }

}
