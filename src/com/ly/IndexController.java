package com.ly;

import com.jfinal.core.Controller;
import com.ly.tool.MenuTree;

import java.util.List;

public class IndexController extends Controller {
    public void index() {

        render("index/index3.jsp");
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