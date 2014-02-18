package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.User;
import com.ly.tool.Dwz;


public class UserController extends Controller {

    public void index()
    {
    	User user= getModel(User.class);
        setAttr("page", User.userDao.getListUser(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),user));
        setAttr("user", user);
        render("user_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("user",null);
        }else{
            setAttr("user", User.userDao.getUser(id));
        }
        render("user.jsp");
    }

    public void save()
    {
        User user = getModel(User.class);
        boolean ok = User.userDao.saveOrUpdate(user);
        renderJson(Dwz.jsonRtn(ok,"user","closeCurrent"));
    }


    public void del()
    {
        boolean ok =  User.userDao.deleteById(getParaToInt());
        CacheKit.removeAll("user");
        renderJson(Dwz.jsonRtn(ok,"user",""));
    }


    public void register()
    {
        User user = getModel(User.class);
        boolean ok = User.userDao.saveOrUpdate(user);
        if (ok)
        {
            redirect("/index");
        }else{
            redirect("/register");
        }

    }

    public void login()
    {
        User user = getModel(User.class);
        User rtnUser = User.userDao.login(user.getStr("email"),user.getStr("password"));
        if (rtnUser != null)
        {
            getSession().setAttribute("email",user.getStr("email"));
            getSession().setAttribute("userid",rtnUser.getInt("id"));
            redirect("/my");
        }else{
            redirect("/login");
        }

    }

}
