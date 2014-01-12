package com.ly.pg.controller;

import com.jfinal.core.Controller;


public class AssesscountController extends Controller {

    public void index()
    {
        render("assesscount_list.jsp");
    }

    public void edit()
    {
        render("assesscount.jsp");
    }

    public void save()
    {
        render("assesscount.jsp");
    }

    public void del()
    {
        render("assesscount_list.jsp");
    }
}
