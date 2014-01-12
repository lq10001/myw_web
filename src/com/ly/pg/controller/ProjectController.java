package com.ly.pg.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.pg.model.Project;
import com.ly.tool.Dwz;


public class ProjectController extends Controller {

    public void index()
    {
    	Project project= getModel(Project.class);
        setAttr("page", Project.projectDao.getListProject(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),project));
        setAttr("project", project);
        render("project_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("project",null);
        }else{
            setAttr("project", Project.projectDao.getProject(id));
        }
        render("project.jsp");
    }

    public void save()
    {
        Project project = getModel(Project.class);
        boolean ok = Project.projectDao.saveOrUpdate(project);
        renderJson(Dwz.jsonRtn(ok,"project","closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Project.projectDao.deleteById(getParaToInt());
        CacheKit.removeAll("project");
        renderJson(Dwz.jsonRtn(ok,"project",""));
    }
}
