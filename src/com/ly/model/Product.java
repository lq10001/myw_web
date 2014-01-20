package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class Product extends Model<Product> {

    public static final Product productDao = new Product();

    public Product getProduct(Integer id)
    {
        return productDao.findById(id);
    }

    public List<Product> getListProduct(int count)
    {
        return productDao.find("select * from product order by id");
    }

    public Page<Product> getListProduct(int pageNum,int pageSize,Product product)
    {
    	StringBuffer sb = new StringBuffer();
        if(product != null && Cnd.getSql(product, sb))
        {
            return productDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return productDao.paginateByCache("product", "page_product_" + pageNum, pageNum, pageSize, "select *", "from product order by id desc");
        }
    }

    public boolean saveOrUpdate(Product product)
    {
        boolean ok = false;
        Integer id = product.getInt("id");
        if (id == null || id <= 0){
            ok =  product.save();
        }else{
            ok = product.update();
        }
        CacheKit.removeAll("product");
        return ok;
    }
}