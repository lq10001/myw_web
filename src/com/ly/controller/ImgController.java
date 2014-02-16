package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.upload.UploadFile;
import com.ly.model.Img;
import com.ly.tool.Dwz;

import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;


public class ImgController extends Controller {

    public void index()
    {

        Img menu= getModel(Img.class);
        setAttr("page", Img.imgDao.getListImg(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu));
        setAttr("img", menu);
        render("user_list.jsp");
        render("img_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("img",null);
        }else{
            setAttr("img", Img.imgDao.getImg(id));
        }
        render("img.jsp");
    }

    public void save()
    {

        PathKit pk = new PathKit();
        String contextPath = pk.getWebRootPath();
        String path = "/upload";
        String pathUrl = contextPath + path;
        int maxSize = 200 * 1024 * 1024;              //10M

        /*
        UploadFile upFile = getFile("upload_file", pathUrl, maxSize, "utf-8");
        String fileName = upFile.getFileName();
        String real_path = upFile.getSaveDirectory();
        String  pathAndName = real_path + fileName;
          */
        List<UploadFile> files = getFiles(pathUrl, maxSize, "utf-8");
        System.out.println(" ---- " + files.size());

        HttpSession session = getSession();
        Object o = session.getAttribute("userid");


        Img img = getModel(Img.class);
        img.set("userid",o);
        img.set("adddate",new Date());
        boolean ok = Img.imgDao.saveOrUpdate(img);
        if (ok)
        {
            redirect("/upload");
        }
    }

    public void del()
    {
        boolean ok =  Img.imgDao.deleteById(getParaToInt());
        CacheKit.removeAll("img");
        renderJson(Dwz.jsonRtn(ok,"img",""));
    }

}
