package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.upload.UploadFile;
import com.ly.Global;
import com.ly.model.User;
import com.ly.tool.Dwz;
import net.coobird.thumbnailator.Thumbnails;
import org.nutz.lang.Files;
import org.nutz.lang.random.StringGenerator;

import java.io.File;
import java.io.IOException;


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

    public void save() throws IOException {

        UploadFile uploadFile = getFile();
        User user = getModel(User.class);

        if (uploadFile != null)
        {
            File f = uploadFile.getFile();

            String type = Files.getSuffixName(f);
            StringGenerator sg = new StringGenerator(5);
            String name = sg.next() + System.currentTimeMillis();
            String filename200 = name + "_200_200." + type;

            Thumbnails.of(f).size(200,200).toFile(uploadFile.getSaveDirectory() + "/" + filename200);
            user.set("imgpath","/upload/"+filename200);
        }

        boolean ok = User.userDao.saveOrUpdate(user);
        redirect("/my");
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
            getSession().setAttribute(Global.USER_NAME,user.getStr(Global.USER_NAME));
            getSession().setAttribute(Global.USER_ID,user.getInt("id"));
            redirect("/my");
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
            getSession().setAttribute(Global.USER_NAME,rtnUser.getStr(Global.USER_NAME));
            getSession().setAttribute(Global.USER_ID,rtnUser.getInt("id"));
            redirect("/my");
        }else{
            redirect("/login");
        }

    }

}
