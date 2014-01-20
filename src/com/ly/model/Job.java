package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;


public class Job extends Model<Job> {

    public static final Job jobDao = new Job();

    public Job getJob(Integer id)
    {
        return jobDao.findById(id);
    }

    public Page<Job> getListJob(int pageNum,int pageSize,Job job)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(job, sb))
        {
            return jobDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return jobDao.paginateByCache("job", "page_job_" + pageNum, pageNum, pageSize, "select *", "from job order by id desc");
        }
    }

    public boolean saveOrUpdate(Job job)
    {
        boolean ok = false;
        Integer id = job.getInt("id");
        if (id == null || id <= 0){
            ok =  job.save();
        }else{
            ok = job.update();
        }
        CacheKit.removeAll("job");
        return ok;
    }
}