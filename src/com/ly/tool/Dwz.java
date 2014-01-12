package com.ly.tool;

import com.alibaba.fastjson.JSONObject;

/**
 * Created with IntelliJ IDEA.
 * Menu: zhongwei
 * Date: 8/22/13
 * Time: 5:49 PM
 * To change this template use File | Settings | File Templates.
 */
public class Dwz {
    public static String jsonRtn(boolean isOk,String tabId,String callBack)
    {
        JSONObject json = new JSONObject();
        json.put("statusCode", isOk ? "200":"300");
        json.put("message", isOk ? "操作成功":"操作失败");
        json.put("navTabId", tabId);
        json.put("forwardUrl", "");
        json.put("callbackType", callBack);
        return json.toJSONString();
    }
}
