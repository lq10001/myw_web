package com.ly.pg.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Project extends Model<Project> {

    public static final Project projectDao = new Project();

    public Project getProject(Integer id)
    {
        return projectDao.findById(id);
    }

    public Page<Project> getListProject(int pageNum,int pageSize,Project project)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(project, sb))
        {
            return projectDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return projectDao.paginateByCache("project", "page_project_" + pageNum, pageNum, pageSize, "select *", "from project order by id desc");
        }
    }

    public boolean saveOrUpdate(Project project)
    {
        boolean ok = false;
        Integer id = project.getInt("id");
        if (id == null || id <= 0){
            ok =  project.save();
        }else{
            ok = project.update();
        }
        CacheKit.removeAll("project");
        return ok;
    }
}