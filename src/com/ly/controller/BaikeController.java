package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.upload.UploadFile;
import com.ly.Global;
import com.ly.model.Baike;
import com.ly.model.Trip;
import com.ly.model.User;
import com.ly.model.Webmenu;
import com.ly.tool.Dwz;
import org.nutz.lang.Files;
import org.nutz.lang.random.StringGenerator;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;


public class BaikeController extends Controller {

    public void index()
    {

        Baike menu= getModel(Baike.class);
        setAttr("page", Baike.baikeDao.getListBaike(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("baike", menu);
        render("baike_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("baike",null);
        }else{
            setAttr("baike", Baike.baikeDao.getBaike(id));
        }
        render("baike.jsp");
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        UploadFile uploadFile = getFile();
        File f = uploadFile.getFile();

        String type = Files.getSuffixName(f);
        StringGenerator sg = new StringGenerator(5);
        String name = sg.next() + System.currentTimeMillis();
        String fileName = name + "." + type;
        Files.rename(f, fileName);

        Baike baike = getModel(Baike.class);
        baike.set("imgurl","/upload/"+fileName);
        baike.set("userid",userid);
        baike.set("adddate",new Date());
        boolean ok = Baike.baikeDao.saveOrUpdate(baike);
        if (ok)
        {
            redirect("/showBaike");
        }
    }

    public void del()
    {
        boolean ok =  Baike.baikeDao.deleteById(getParaToInt());
        CacheKit.removeAll("baike");
        renderJson(Dwz.jsonRtn(ok,"baike",""));
    }

    public void show()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);

        Integer baikeid = Integer.parseInt(getPara(0));
        session.setAttribute(Global.TRIP_ID,baikeid);
        Baike baike =  Baike.baikeDao.getBaike(baikeid);
        setAttr("baike", baike);
        User user = User.userDao.findById(baike.getInt("userid"));
        setAttr("authorname",user.get("name"));

//        List<Img> list_img = Img.imgDao.getListImgByBaikeid(Integer.parseInt(userid.toString()),baikeid);
//        setAttr("list_img",list_img);

        render("/WEB-INF/index/show.jsp");
    }

}
