package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Comment extends Model<Comment> {

    public static final Comment commentDao = new Comment();

    public Comment getComment(Integer id)
    {
        return commentDao.findById(id);
    }

    public Page<Comment> getListComment(int pageNum,int pageSize,Comment comment)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(comment, sb))
        {
            return commentDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return commentDao.paginateByCache("comment", "page_comment_" + pageNum, pageNum, pageSize, "select *", "from comment order by id desc");
        }
    }

    public boolean saveOrUpdate(Comment comment)
    {
        boolean ok = false;
        Integer id = comment.getInt("id");
        if (id == null || id <= 0){
            ok =  comment.save();
        }else{
            ok = comment.update();
        }
        CacheKit.removeAll("comment");
        return ok;
    }
}