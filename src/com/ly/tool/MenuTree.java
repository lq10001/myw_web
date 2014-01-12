package com.ly.tool;

import com.alibaba.fastjson.JSONObject;
import com.ly.sys.model.Menu;

import java.util.List;

public class MenuTree {
    public static String getMenuTree()
    {
        StringBuffer sb = new StringBuffer();
        List<Menu> pmenu = Menu.menuDao.getListPMenu();
        List<Menu> subMenu = null;

        for (Menu pm : pmenu)
        {
            sb.append("<div class=\"accordionHeader\"> \n");
            sb.append("<h2><span>Folder</span>"+pm.getStr("cnname")+"</h2> \n");
            sb.append("</div>\n");

            sb.append("<div class=\"accordionContent\"> \n");
            sb.append("<ul class=\"tree treeFolder\"> \n");


            subMenu = Menu.menuDao.getListMenu(pm.getStr("name"));

            for (Menu sm : subMenu)
            {
                sb.append("<li><a href=\"/hjpg"+sm.getStr("url")+"\" target=\"navTab\" rel=\""+sm.getStr("name")+"\">"+sm.getStr("cnname")+"</a></li>\n");
            }
            sb.append("</ul>\n</div>\n");
        }

//         Menu.menuDao.getListMenu(getParaToInt("pageNum", 1), getParaToInt("numPerPage",20),menu);

        return sb.toString();

    }
}
