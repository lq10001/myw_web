package com.ly.pg.controller;

import com.jfinal.core.Controller;


public class TaskController extends Controller {

    public void index()
    {
        render("task_list.jsp");
    }

    public void edit()
    {
        render("task.jsp");
    }

    public void save()
    {
        render("task.jsp");
    }

    public void del()
    {
        render("task_list.jsp");
    }
}
