package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Job;
import com.ly.tool.Dwz;


public class JobController extends Controller {

    public void index()
    {
    	Job job= getModel(Job.class);
        setAttr("page", Job.jobDao.getListJob(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),job));
        setAttr("job", job);
        render("job_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("job",null);
        }else{
            setAttr("job", Job.jobDao.getJob(id));
        }
        render("job.jsp");
    }

    public void save()
    {
        Job job = getModel(Job.class);
        boolean ok = Job.jobDao.saveOrUpdate(job);
        renderJson(Dwz.jsonRtn(ok, "job", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Job.jobDao.deleteById(getParaToInt());
        CacheKit.removeAll("job");
        renderJson(Dwz.jsonRtn(ok, "job", ""));
    }
}
