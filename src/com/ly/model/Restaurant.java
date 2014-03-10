package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.ly.tool.Cnd;

import java.util.List;


public class Restaurant extends Model<Restaurant> {

    public static final Restaurant restaurantDao = new Restaurant();

    public List<Restaurant> getListRestaurant()
    {
        return restaurantDao.find("select * from restaurant");
    }


    public List<Restaurant> getListRestaurantByUser(Integer userid)
    {
        return restaurantDao.find("select * from restaurant  where restaurant.userid =" + userid);
    }

    public List<Restaurant> getListRestaurantByTrip(Integer tripid)
    {
        return restaurantDao.find("select * from restaurant  where  tripid = "+tripid);
    }


    public List<Restaurant> getListRestaurantByUserAndTrip(Integer userid,Integer tripid)
    {
        return restaurantDao.find("select * from restaurant  where restaurant.userid =" + userid + " and tripid = "+tripid);
    }


    public List<Restaurant> getListRestaurantTop10()
    {
        return restaurantDao.find("select  * from restaurant join img where restaurant.id = img.restaurantid and img.isdefault = 1 LIMIT 10 ");
    }

    public List<Restaurant> getListMyRestaurant10(Integer userid)
    {
        return restaurantDao.find("select * from restaurant join img where restaurant.id = img.restaurantid and restaurant.userid =" + userid);
    }

    public Restaurant getRestaurant(Integer id)
    {
        return restaurantDao.findById(id);
    }

    public Page<Restaurant> getListRestaurant(int pageNum,int pageSize,Restaurant restaurant)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(restaurant, sb))
        {
            return restaurantDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return restaurantDao.paginateByCache("restaurant", "page_restaurant_" + pageNum, pageNum, pageSize, "select *", "from restaurant order by id desc");
        }
    }

    public boolean saveOrUpdate(Restaurant restaurant)
    {
        boolean ok = false;
        Integer id = restaurant.getInt("id");
        if (id == null || id <= 0){
            ok =  restaurant.save();
        }else{
            ok = restaurant.update();
        }
//        CacheKit.removeAll("restaurant");
        return ok;
    }

    public boolean updateDefalutImg(Object restaurantid,String imgpath)
    {
        Restaurant restaurant = new Restaurant();
        restaurant.set("id",restaurantid);
        restaurant.set("defaultimg",imgpath);
         return restaurant.update();
    }

}