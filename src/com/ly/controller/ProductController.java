package com.ly.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.model.Product;
import com.ly.tool.Dwz;


public class ProductController extends Controller {

    public void index()
    {
    	Product product= getModel(Product.class);
        setAttr("page", Product.productDao.getListProduct(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),product));
        setAttr("product", product);
        render("product_list.jsp");
    }

    public void edit()
    {
        Integer id = getParaToInt();
        if (id == null || id <= 0){
            setAttr("product",null);
        }else{
            setAttr("product", Product.productDao.getProduct(id));
        }
        render("product.jsp");
    }

    public void save()
    {
        Product product = getModel(Product.class);
        boolean ok = Product.productDao.saveOrUpdate(product);
        renderJson(Dwz.jsonRtn(ok, "product", "closeCurrent"));
    }

    public void del()
    {
        boolean ok =  Product.productDao.deleteById(getParaToInt());
        CacheKit.removeAll("product");
        renderJson(Dwz.jsonRtn(ok, "product", ""));
    }
}
