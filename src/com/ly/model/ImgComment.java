package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class ImgComment extends Model<ImgComment> {

    public static final ImgComment imgCommentDao = new ImgComment();

    public ImgComment getImgComment(Integer id)
    {
        return imgCommentDao.findById(id);
    }

    public Page<ImgComment> getListImgComment(int pageNum,int pageSize,ImgComment imgComment)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(imgComment, sb))
        {
            return imgCommentDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return imgCommentDao.paginateByCache("imgComment", "page_imgComment_" + pageNum, pageNum, pageSize, "select *", "from imgComment order by id desc");
        }
    }

    public ImgComment queryImgComment(Object userid, Integer imgid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from imgcomment where userid =  ");
        sb.append(userid);
        sb.append(" and imgid = ");
        sb.append(imgid);
        System.out.println(sb.toString());
        return imgCommentDao.findFirst(sb.toString());
    }

    public List<ImgComment> getListImgComment(Integer imgid)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("select imgcomment.*,user.name from imgcomment left join user on imgcomment.userid = user.id where imgid = ");
        sb.append(imgid);
        System.out.println(sb.toString());
        return imgCommentDao.find(sb.toString());
    }

    public boolean saveOrUpdate(ImgComment imgComment)
    {
        boolean ok = false;
        Integer id = imgComment.getInt("id");
        if (id == null || id <= 0){
            ok =  imgComment.save();
        }else{
            ok = imgComment.update();
        }
        CacheKit.removeAll("imgComment");
        return ok;
    }
}