package com.ly;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.ly.info.model.Dic;
import com.ly.info.model.Expert;
import com.ly.info.model.Unit;
import com.ly.pg.model.Project;
import com.ly.pg.model.Protocal;
import com.ly.sys.model.Menu;
import com.ly.sys.model.User;

public class AppConfig extends JFinalConfig {
    public void configConstant(Constants me) {
        me.setDevMode(true);
        loadPropertyFile("classes/config.txt");
        me.setViewType(ViewType.JSP);
        me.setBaseViewPath("/WEB-INF");

    }

    public void configRoute(Routes me) {
        me.add("/", IndexController.class);
//        AutoBindRoutes routes = new AutoBindRoutes();
//        me.add(routes);
    }

    public void configPlugin(Plugins me) {
        /*
        DruidPlugin druidPlugin = new DruidPlugin(
                getProperty("jdbcUrl"),
                getProperty("username"),
                getProperty("password"),
                getProperty("driverClass"));
        druidPlugin.setInitialSize(3).setMaxActive(10);
        me.add(druidPlugin);
        */
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcurl"), getProperty("username"), getProperty("password").trim());
        me.add(c3p0Plugin);


        // 配置ActiveRecord插件
        /*
        AutoTableBindPlugin atbp = new AutoTableBindPlugin(c3p0Plugin);
        atbp.setShowSql(true);
        me.add(atbp);
        */
               /*
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);

        arp.addMapping("dic", Dic.class);
        arp.addMapping("menu", Menu.class);
        arp.addMapping("user", User.class);
        arp.addMapping("project", Project.class);
        arp.addMapping("protocal", Protocal.class);
        arp.addMapping("unit", Unit.class);
        arp.addMapping("expert", Expert.class);
          */

        // 缓存插件
        me.add(new EhCachePlugin());
    }

    public void configInterceptor(Interceptors me) {
    }

    public void configHandler(Handlers me) {
    }
}