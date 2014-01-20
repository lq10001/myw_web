package com.ly.tool;


import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.TableInfo;
import com.jfinal.plugin.activerecord.TableInfoMapping;

import java.util.Map;
import java.util.Set;

public class Cnd {
      public static Boolean getSql(Model model,StringBuffer sb)
      {
          Boolean isCnd = false;
          if (model == null)
          {
              return isCnd;
          }
          sb.append(" from ").append(TableInfoMapping.me().getTableInfo(model.getClass()).getTableName()).append(" where 1=1 ");

          final int prime = 31;
          int result = 1;
          TableInfo tableinfo = TableInfoMapping.me().getTableInfo(model.getClass());


          Set<Map.Entry<String, Object>> attrsEntrySet = model.getAttrsEntrySet();
          for (Map.Entry<String, Object> entry : attrsEntrySet) {
              String key = entry.getKey();
              Object value = entry.getValue();

              System.out.println(key + " -------- " + value);

              if (value == null || value.equals(""))
              {
                  continue;
              }else{
                  Class<?> clazz = tableinfo.getColType(key);
                  if (clazz == Integer.class
                      || clazz == Short.class
                      || clazz == Long.class
                      || clazz == Float.class
                      || clazz == Double.class
                  ) {
                      sb.append(" and ").append(key).append(" = ").append(value);
                  }else if(clazz == String.class)
                  {
                      sb.append(" and ").append(key).append(" like '%").append(value).append("%'");
                  }
                  isCnd = true;
              }

          }
          return isCnd;
      }
}
