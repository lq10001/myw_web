package com.ly;

import com.jfinal.core.Controller;
import com.ly.tool.MenuTree;
import com.ly.model.Webmenu;

import java.util.List;

public class IndexController extends Controller {
    public void index() {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","index");
        render("index/index3.jsp");
    }

    public void mudi() {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","mudi");

        render("index/mudi.jsp");
    }

    public void down() {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","down");

        render("index/down.jsp");
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



}