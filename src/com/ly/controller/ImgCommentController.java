package com.ly.controller;

import com.alibaba.fastjson.JSON;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.Global;
import com.ly.model.ImgComment;
import com.ly.tool.Dwz;
import com.ly.vo.ImgCommentVo;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;


public class ImgCommentController extends Controller {

    public void index()
    {
    }

    public void edit()
    {
    }

    public void save()
    {
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        if (userid == null)
        {
            renderJson("-1");
            return;
        }

        ImgComment imgComment = getModel(ImgComment.class);
        imgComment.set("userid",userid);
        imgComment.set("adddate", new Date());
        boolean ok = ImgComment.imgCommentDao.saveOrUpdate(imgComment);

        renderJson(JSON.toJSONString(allList(imgComment.getInt("imgid"))));
    }

    public void del()
    {
        Integer imgid = getParaToInt("id");
        HttpSession session = getSession();
        Object userid = session.getAttribute(Global.USER_ID);
        ImgComment ic = ImgComment.imgCommentDao.queryImgComment(userid, imgid);
        if (ic != null)
        {
            ic.delete();
        }

        renderJson(JSON.toJSONString(allList(imgid)));
    }

    public void list()
    {
        Integer imgid = getParaToInt("id");
        renderJson(JSON.toJSONString(allList(imgid)));
    }

    private List<ImgCommentVo> allList(Integer imgid)
    {
        List<ImgCommentVo> imgCommentVos = new LinkedList<ImgCommentVo>();
        List<ImgComment> comments = ImgComment.imgCommentDao.getListImgComment(imgid);

        for (ImgComment com : comments)
        {
            ImgCommentVo vo = new ImgCommentVo();
            vo.setId(com.getInt("id"));
            vo.setImgId(com.getInt("imgid"));
            vo.setUserId(com.getInt("userid"));

            vo.setName(com.getStr("name"));
            vo.setContent(com.getStr("content"));
            imgCommentVos.add(vo);
        }
        return imgCommentVos;
    }
}
