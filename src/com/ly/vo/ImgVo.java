package com.ly.vo;

/**
 * Created by zw on 14-3-31.
 */
public class ImgVo {

    private Integer imgid;

    private Integer userid;

    private Integer tripid;

    private String smallimgPath;

    private String imgPath800;


    public Integer getImgid() {
        return imgid;
    }

    public void setImgid(Integer imgid) {
        this.imgid = imgid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getTripid() {
        return tripid;
    }

    public void setTripid(Integer tripid) {
        this.tripid = tripid;
    }

    public String getSmallimgPath() {
        return smallimgPath;
    }

    public void setSmallimgPath(String smallimgPath) {
        this.smallimgPath = smallimgPath;
    }

    public String getImgPath800() {
        return imgPath800;
    }

    public void setImgPath800(String imgPath800) {
        this.imgPath800 = imgPath800;
    }
}
