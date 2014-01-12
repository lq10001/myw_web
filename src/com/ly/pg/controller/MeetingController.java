package com.ly.pg.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.pg.model.Project;
import com.ly.tool.Dwz;


public class MeetingController extends Controller {

    public void index()
    {
        render("meeting_list.jsp");
    }

    public void edit()
    {
        render("meeting.jsp");
    }

    public void save()
    {
        render("meeting.jsp");
    }

    public void del()
    {
        render("meeting_list.jsp");
    }
}
