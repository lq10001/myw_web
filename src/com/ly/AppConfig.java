package com.ly;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.ly.controller.*;
import com.ly.model.*;

public class AppConfig extends JFinalConfig {
    public void configConstant(Constants me) {
        me.setDevMode(true);
        loadPropertyFile("classes/config.txt");
        me.setViewType(ViewType.JSP);
        me.setBaseViewPath("/WEB-INF");

    }

    public void configRoute(Routes me) {
        me.add("/", IndexController.class);
        me.add("/ad", AdController.class);

        me.add("/comment", CommentController.class);
        me.add("/info", InfoController.class);

        me.add("/job", JobController.class);
        me.add("/link", LinkController.class);
        me.add("/menu", MenuController.class);
        me.add("/news", NewsController.class);
        me.add("/newstype", NewstypeController.class);

        me.add("/user", UserController.class);
        me.add("/webmenu", WebmenuController.class);

        me.add("/manage", ManageController.class);
        me.add("/trip",TripController.class);
        me.add("/img",ImgController.class);

//        AutoBindRoutes routes = new AutoBindRoutes();
//        me.add(routes);
    }

    public void configPlugin(Plugins me) {

        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcurl"), getProperty("username"), getProperty("password").trim());
        c3p0Plugin.setMaxPoolSize(getPropertyToInt("maxpool"));
        c3p0Plugin.setMinPoolSize(getPropertyToInt("minpool"));
        me.add(c3p0Plugin);


        // 配置ActiveRecord插件
        /*
        AutoTableBindPlugin atbp = new AutoTableBindPlugin(c3p0Plugin);
        atbp.setShowSql(true);
        me.add(atbp);
        */
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);

        arp.addMapping("menu", Menu.class);
        arp.addMapping("user", User.class);
        arp.addMapping("ad", Ad.class);
        arp.addMapping("comment", Comment.class);
        arp.addMapping("info", Info.class);
        arp.addMapping("job", Job.class);

        arp.addMapping("link", Link.class);
        arp.addMapping("news", News.class);
        arp.addMapping("newstype", Newstype.class);

        arp.addMapping("product", Product.class);
        arp.addMapping("webmenu", Webmenu.class);
        arp.addMapping("trip",Trip.class);
        arp.addMapping("img",Img.class);


        // 缓存插件
        me.add(new EhCachePlugin());
    }

    public void configInterceptor(Interceptors me) {
    }

    public void configHandler(Handlers me) {
    }
}