package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Comment;
import com.ly.tool.Dwz;


public class CommentController extends Controller {

    public void index()
    {
    	Comment comment= getModel(Comment.class);
        setAttr("page", Comment.commentDao.getListComment(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),comment));
        setAttr("comment", comment);
        render("comment_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("comment",null);
        }else{
            setAttr("comment", Comment.commentDao.getComment(id));
        }
        render("comment.jsp");
    }

    public void save()
    {
        Comment comment = getModel(Comment.class);
        boolean ok = Comment.commentDao.saveOrUpdate(comment);
        renderJson(Dwz.jsonRtn(ok, "comment", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Comment.commentDao.deleteById(getParaToInt());
        CacheKit.removeAll("comment");
        renderJson(Dwz.jsonRtn(ok, "comment", ""));
    }
}
