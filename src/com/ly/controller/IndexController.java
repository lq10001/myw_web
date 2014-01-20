package com.ly.controller;

import com.jfinal.core.Controller;
import com.ly.model.Product;
import com.ly.model.Webmenu;

import java.util.List;

public class IndexController extends Controller {
    public void index() {

       List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();

        List<Product> list_product =  Product.productDao.getListProduct(6);
        System.out.println("---- " +list_product.size());
        setAttr("product_list", list_product);
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","index");
        render("index/index3.jsp");
    }

    public void webproduct()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);

        setAttr("product_list", Product.productDao.getListProduct(1,20,null));

        setAttr("selmenu","product");
        render("index/product.jsp");
    }

    public void linkme()
    {
        List<Webmenu> list_menu = Webmenu.webmenuDao.getListMenu();
        setAttr("webmenu_list",list_menu);
        setAttr("selmenu","link");
        render("index/link.jsp");
    }

}