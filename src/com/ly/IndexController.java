package com.ly;

import com.jfinal.core.Controller;
import com.ly.tool.MenuTree;
import com.ly.model.Webmenu;

import javax.servlet.http.HttpSession;
import java.util.List;

public class IndexController extends Controller {


    private void getMenu()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
    }

    public void index() {
        getMenu();
        render("index/index.jsp");
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

    public void travel() {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","xing");

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
        Object o = session.getAttribute("email");
        if (o == null)
        {
            this.login();
        }else{
            render("index/my.jsp");
        }
    }

    public void upload()
    {
        getMenu();
        render("index/upload.jsp");
    }


}