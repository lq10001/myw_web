
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>CMS</title>

    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <link type="text/css" rel="stylesheet" href="<%=path%>/bootstrap-select/bootstrap-select.css">

    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>


    <script src="<%=path%>/js/bootstrap3-validation.js"></script>


    <script src="http://ditu.google.cn/maps/api/js?sensor=false&libraries=geometry&v=3.7"></script>
    <script type="text/javascript" src="<%=path%>/js/maplace.min.js"></script>

    <script src="<%=path%>/datepicker/js/bootstrap-datepicker-zh_CN.js"></script>
    <script src="<%=path%>/bootstrap-select/bootstrap-select.min.js"></script>


    <link href="<%=path%>/datepicker/css/datepicker.css" rel="stylesheet">
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>


<jsp:include page="top.jsp"></jsp:include>

<input type="hidden" id="userid" value="${userid}">

<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-md-8">
            <div class="col-md-8">
                <h3>行程名称：${trip.name}</h3>
                <div class="row">
                    <div class="col-md-4">
                        <p>${firstDate}</p>
                    </div>
                    <div class="col-md-4">
                        <p> ${dayCount}天</p>
                    </div>
                    <div class="col-md-4">
                        <p>浏览${trip.visit + 1}次</p>
                    </div>
                </div>

            </div>
            <div class="col-md-4" style="text-align: right">
                <br/>
                <br/>
                <button id="btn_love_trip" class="btn btn-primary btn-lg" onclick="onTripLove(${trip.id})">
                    喜欢[${trip.love}]
                </button>
                <!--
                <button class="btn btn-primary btn-lg" onclick="onTripComment()">
                   评论
                </button>

                <button class="btn btn-primary btn-lg" onclick="onUploadFile()">
                    分享
                </button>
                -->
            </div>
        </div>

        <div class="col-md-4" style="text-align: center;">
            <br/>
            <br/>

            <c:choose>
                <c:when test="${userid == trip.userid}">
                    <button class="btn btn-primary btn-lg" type="button" onclick="onUploadFile()">
                        上传照片
                    </button>
                </c:when>
                <c:when test="${userid > 0}">
                    <button class="btn btn-primary btn-lg" type="button" onclick="onFollowTrip(${trip.id})">
                        Follow行程
                    </button>
                </c:when>
            </c:choose>
        </div>
    </div><!--/row-->

    <hr/>


    <div class="row">
        <div class="col-xs-12 col-md-8">

            <div class="row">
                <div class="col-md-12">
                    <div id="gmap" style="height: 400px;"></div>
                </div>
            </div>
            <br/>

            <c:choose>
                <c:when test="${fn:length(list_img) > 0}">
                    <c:forEach var="img" items="${list_img}">
                        <div id="img_${img.id}" class="row">
                            <div class="col col-md-12">
                                <div class="thumbnail">
                                    <img src="<%=path%>${img.imgpath800}" alt="">

                                    <div class="row" style="margin-left: 15px;">
                                        <div class="col-md-12">
                                            <p  id="mark_${img.id}">${img.mark}</p>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-left: 15px;">
                                        <div class="col-md-4">
                                            <label style="width: 200px;">时间:${img.createdate}</label>
                                        </div>

                                        <div class="col-md-8" style="text-align: right;">
                                            <label>地点:${img.gpsname}</label>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-left: 15px;">

                                        <div class="col-md-6">

                                        </div>

                                        <div class="col-md-6" style="text-align: right;">
                                            <c:if test="${userid == trip.userid}">
                                                <button type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onEditImg(${img.id})">
                                                    编辑信息
                                                </button>
                                                <button id="btnDefault_${img.id}" type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onDefaultImg(${img.id})">
                                                    设为封面
                                                </button>
                                                <button type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onDelImg(${img.id})">
                                                    删除
                                                </button>
                                                <button type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onMark(${img.id})">
                                                    修改描述
                                                </button>
                                            </c:if>

                                            <button id="btn_love_${img.id}" type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onImgLove(${img.id})">
                                                喜欢[${img.love}]
                                            </button>
                                            <button type="button" class="btn btn-success btn-xs" style="margin-top: 3px;" onclick="onComment(${img.id})">
                                                评论
                                            </button>

                                        </div>

                                    </div>


                                    <div id="comment_${img.id}" style="margin-left: 15px;display: none;">
                                        <hr/>
                                        <div class="row" >
                                            <form class="form-horizontal"  id="commentForm_${img.id}" action="<%=path%>/imgcomment/save" role="form">
                                                <input type="hidden" name="imgComment.imgid"  value="${img.id}">
                                                <div class="col-md-10">
                                                     <input type="text" class="col-md-12"  id="comment_content_${img.id}" name="imgComment.content" placeholder="请输入评论信息" check-type="required">
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button" class="btn btn-success btn-xs" onclick="onImgComment(${img.id})">
                                                        评论
                                                    </button>
                                                </div>
                                            </form>
                                        </div>

                                        <div id="commment_row_${img.id}" class="row" style="margin-top:5px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </c:when>
                <c:otherwise>
                    <div class="thumbnail col-md-12" style="text-align: center;">
                        <h3>还没有添加旅游照片</h3>
                    </div>
                </c:otherwise>
            </c:choose>



        </div>

        <!-------------------------------------- 航班旅店信息 -------------------------------------->

        <div class="col-md-4">
            <c:if test="${userid == trip.userid}">
            <h3 style="margin-top:0px;">
                航班&住宿
            </h3>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">航班信息</div>

                <ul id="flightList" class="list-group">

                    <c:forEach var="flight" items="${flight_list}">
                        <li class="list-group-item">
                            <p>${flight.todate} ${flight.start} -> ${flight.arrival}</p>
                            <p>${flight.name}</p>
                            <p>价格：${flight.price}</p>

                        </li>
                    </c:forEach>
                </ul>


                <div class="panel-footer" style="text-align: center">
                    <button id="addFlight" class="btn btn-success btn-xs" data-toggle="modal">
                        +添加航班信息
                    </button>
                </div>
            </div>

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">住宿信息</div>

                <ul id="hotelList" class="list-group">

                    <c:forEach var="hotel" items="${hotel_list}">
                        <li class="list-group-item">
                            <p>${hotel.date1} -> ${hotel.date2}</p>
                            <p>${hotel.name}</p>
                            <p>价格：${hotel.price}</p>
                        </li>
                    </c:forEach>
                </ul>

                <div class="panel-footer" style="text-align: center">
                    <button id="addHotel" class="btn btn-success btn-xs" data-toggle="modal">
                        +添加住宿信息
                    </button>
                </div>
            </div>


            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">餐厅信息</div>

                <ul id="restaurantList" class="list-group">

                    <c:forEach var="restaurant" items="${restaurant_list}">
                        <li class="list-group-item">
                            <p>${restaurant.tripdate} &nbsp;${restaurant.name}</p>
                            <p>消费金额: ${restaurant.price} &nbsp;人民币</p>
                        </li>
                    </c:forEach>
                </ul>

                <div class="panel-footer" style="text-align: center">
                        <button id="addRestaurant" class="btn btn-success btn-xs" data-toggle="modal">
                            +添加餐厅信息
                        </button>
                </div>
            </div>


            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">向导信息</div>

                <ul id="guideList" class="list-group">

                    <c:forEach var="guide" items="${guide_list}">
                        <li class="list-group-item">
                            <p>${guide.tripdate} &nbsp;${guide.content} </p>
                            <p>姓名：${guide.name} </p>
                            <p>电话：${guide.phone}</p>
                            <p>价格：${guide.price}</p>
                        </li>
                    </c:forEach>
                </ul>

                <div class="panel-footer" style="text-align: center">
                        <button id="addGuide" class="btn btn-success btn-xs" data-toggle="modal">
                            +添加向导信息
                        </button>
                </div>
            </div>

            </c:if>
        </div>


        <!----------------------------------------------------------行程信息- --------------------------------------------->
        <div class="col-md-4">
            <h3 style="margin-top:0px;">
             线路日程( ${trip.days + 1}天 )
            </h3>
            <div class="thumbnail">
                <c:forEach items="${list_day}" var="day">
                    <h5>${day.tripDate} 第${day.day}天</h5>
                    <ul id="ul_day_${day.day}" class="list-group">
                        <script>
                            $(function(){
                                getListPlace(${day.day}, '${day.tripDate}');
                            });
                        </script>
                    </ul>
                </c:forEach>
            </div>
        </div>
    </div><!--/row-->

    <!-- ==================================================== Model ==============================================-->
    <!-- flightModel -->
    <div class="modal fade" id="flightModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="flightForm" action="<%=path%>/flight/save" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加航班信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="fname" class="col-md-2 control-label">航班号</label>
                                    <div class="col-md-6">
                                        <input type="text" name="flight.name" class="form-control" id="fname" placeholder="" check-type="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="start" class="col-md-2 control-label">出发地</label>
                                    <div class="col-md-6">
                                        <input type="text" name="flight.start" class="form-control" id="start" placeholder="" check-type="required">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="arrival" class="col-md-2 control-label">到达地</label>
                                    <div class="col-md-6">
                                        <input type="text" name="flight.arrival" class="form-control" id="arrival" placeholder="" check-type="required">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="todate" class="col-md-2 control-label">航班日期</label>
                                    <div class="col-md-6">
                                        <select id="todate" name="flight.todate" class="selectpicker form-control" check-type="required">
                                            <c:forEach items="${list_day}" var="day">
                                                <option value="${day.tripDate}">
                                                        ${day.tripDate} 第${day.day}天
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fprice" class="col-md-2 control-label">价格</label>
                                    <div class="col-md-6">
                                        <input type="text" name="flight.price" class="form-control" id="fprice" placeholder="" check-type="number">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="flightSubmit" type="button" class="btn btn-primary" onclick="onSaveFlight()">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!-- HotelModal -->
    <div class="modal fade" id="hotelModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="hotelForm" action="<%=path%>/hotel/save" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加住宿信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="name" class="col-md-2 control-label">旅店名称</label>
                                    <div class="col-md-6">
                                        <input type="text" name="hotel.name" class="form-control" id="name" placeholder="" check-type="required">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="date1" class="col-md-2 control-label">入住时间</label>
                                    <div class="col-md-6">
                                        <select id="date1" name="hotel.date1" class="selectpicker form-control" check-type="required">
                                            <c:forEach items="${list_day}" var="day">
                                                <option value="${day.tripDate}">
                                                        ${day.tripDate} 第${day.day}天
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="price" class="col-md-2 control-label">价格</label>
                                    <div class="col-md-6">
                                        <input type="text" name="hotel.price" class="form-control" id="price" placeholder="" check-type="number">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="hotelSubmit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->



    <!-- GuideModal -->
    <div class="modal fade" id="guideModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="guideForm" action="<%=path%>/guide/save" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加向导信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="guideName" class="col-md-2 control-label">向导姓名</label>
                                    <div class="col-md-6">
                                        <input type="text" name="guide.name" class="form-control" id="guideName" placeholder="" check-type="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="guideContent" class="col-md-2 control-label">讲解内容</label>
                                    <div class="col-md-6">
                                        <input type="text" name="guide.content" class="form-control" id="guideContent" placeholder="" check-type="required">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="gdate" class="col-md-2 control-label">讲解时间</label>

                                    <div class="col-md-6">
                                        <select id="gdate" name="guide.tripdate" class="selectpicker form-control" check-type="required">
                                            <c:forEach items="${list_day}" var="day">
                                                <option value="${day.tripDate}">
                                                        ${day.tripDate} 第${day.day}天
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="guidePhone" class="col-md-2 control-label">向导电话</label>
                                    <div class="col-md-6">
                                        <input type="text" name="guide.phone" class="form-control" id="guidePhone" placeholder="" check-type="phone">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="gPrice" class="col-md-2 control-label">价格</label>
                                    <div class="col-md-6">
                                        <input type="text" name="guide.price" class="form-control" id="gPrice" placeholder="" check-type="number">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="guideSubmit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!-- RestaurantModal -->
    <div class="modal fade" id="restaurantModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="restaurantForm" action="<%=path%>/restaurant/save" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加餐厅信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="restaurantName" class="col-md-2 control-label">餐厅名称</label>
                                    <div class="col-md-6">
                                        <input type="text" name="restaurant.name" class="form-control" id="restaurantName" placeholder="" check-type="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="rdate" class="col-md-2 control-label">就餐时间</label>
                                    <div class="col-md-6">
                                        <select id="rdate" name="restaurant.tripdate" class="selectpicker form-control" check-type="required">
                                            <c:forEach items="${list_day}" var="day">
                                                <option value="${day.tripDate}">
                                                        ${day.tripDate} 第${day.day}天
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="restaurantPrice" class="col-md-2 control-label">消费金额</label>
                                    <div class="col-md-6">
                                        <input type="text" name="restaurant.price" class="form-control" id="restaurantPrice" placeholder="" check-type="number">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="restaurantSubmit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!-- MarkModal -->
    <div class="modal fade" id="markModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="markForm" action="<%=path%>/img/mark" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">编辑描述信息</h4>
                    </div>
                    <div class="modal-body">
                            <input id="imgid" type="hidden" name="img.id" value="">
                            <textarea class="form-control" name="img.mark" id="mark" rows="3" placeholder="请收入描述信息"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="markSubmit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!-- EditModal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 800px;height: 600px;">
            <div class="modal-content">

                <form class="form-horizontal" method="post" id="editForm" action="<%=path%>/img/save" role="form">

                    <input id="lat" type="hidden" name="img.lat" value="">
                    <input id="lon" type="hidden" name="img.lon" value="">
                    <input id="editImgid" type="hidden" name="img.id" value="">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">编辑图片信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">

                            <div class="col-md-12">
                                <!--
                                <div class="form-group">
                                    <label for="createdate" class="col-md-2 control-label">旅游时间</label>
                                    <div class="col-md-6">
                                        <input type="text" name="img.createdate" class="form-control span2" id="createdate" placeholder=""  data-date-format="yyyy-mm-dd" check-type="required">
                                    </div>
                                </div>
                                -->

                                <div class="form-group">
                                    <label for="gpsname" class="col-md-2 control-label">地点名称</label>
                                    <div class="col-md-6">
                                        <input type="text" readonly="readonly" name="img.gpsname" class="form-control" id="gpsname" placeholder="" check-type="required">
                                        <label>请点击地图获取地点和GPS信息</label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="gps" class="col-md-2 control-label">GPS</label>
                                    <div class="col-md-6">
                                        <input type="text" readonly="readonly" name="img.gps" class="form-control" id="gps" placeholder="" check-type="required">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <div id="mapdiv" class="container" style="margin-left: 50px;">
                            <div id="editmap" style="display: block;width: 600px;height: 350px;"></div>
                        </div>
                    </div>
                    <div class="modal-footer" style="margin-top: -20px;height: 40px;">
                        <button type="button" class="btn btn-default" style="margin-top: -10px;" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" style="margin-top: -10px;" id="editSubmit">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <jsp:include page="foot.jsp"></jsp:include>



    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>

    <script type="text/javascript">

        $(function(){

            $('.selectpicker').selectpicker({
                'selectedText': 'cat'
            });

            window.prettyPrint && prettyPrint();
            $('#createdate').datepicker({
                format: 'yyyy-mm-dd'
            });


            $("#addFlight").on('click',function(event){
                $("#fname").val("");
                $("#start").val("");
                $("#arrival").val("");
                $("#fprice").val("");
                $("#flightForm").validation();
                $('#flightModel').modal('show');
            });

            $("#addHotel").on('click',function(event){
                $("#name").val("");
                $("#price").val("");
                $("#hotelForm").validation();
                $('#hotelModel').modal('show');
            });

            $("#addGuide").on('click',function(event){
                $("#guideName").val("");
                $("#guidePhone").val("");
                $("#gPrice").val("");
                $("#guideContent").val("");
                $("#guideForm").validation();
                $('#guideModel').modal('show');
            });

            $("#addRestaurant").on('click',function(event){
                $("#restaurantName").val("");
                $("#restaurantPrice").val("");
                $("#restaurantForm").validation();
                $('#restaurantModel').modal('show');
            });



            //flight
            $("#flightForm").validation();
            $("#flightSubmit").on('click',function(event){
                if ($("#flightForm").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }else{
                    $.post("<%=path%>/flight/save", $("#flightForm").serialize(),
                            function(data){
                                $('#flightModel').modal('hide');

                                var content = ' <li class="list-group-item">'
                                        + '<p>'+ $("#todate").val()+ "  " + $("#start").val()+' - '+$("#arrival").val()+'</p>'
                                        + '<p>'+$("#fname").val()+'</p>'
                                        + '</li>';
                                $(content).appendTo('#flightList');

                            },"json");
                }
            });

            //hotel
            $("#hotelForm").validation();
            $("#hotelSubmit").on('click',function(event){
                if ($("#hotelForm").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }else{
                    $.post("<%=path%>/hotel/save", $("#hotelForm").serialize(),
                            function(data){
                                $('#hotelModel').modal('hide');

                                var content = ' <li class="list-group-item">'
                                        + '<p>'+$("#date1").val()+' - '+$("#date2").val()+'</p>'
                                        + '<p>'+$("#name").val()+'</p>'
                                        + '</li>';
                                $(content).appendTo('#hotelList');
                            },"json");
                }
            });

            //Guide
            $("#guideForm").validation();
            $("#guideSubmit").on('click',function(event){
                if ($("#guideForm").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }else{
                    $.post("<%=path%>/guide/save", $("#guideForm").serialize(),
                            function(data){
                                $('#guideModel').modal('hide');
                                var content = ' <li class="list-group-item">'
                                        + '<p>姓名： ' + $("#guideName").val() + '</p>'
                                        + '<p>电话： ' + $("#guidePhone").val() +'</p>'
                                        + '</li>';
                                $(content).appendTo('#guideList');
                            },"json");
                }
            });


            //Restaurant
            $("#restaurantForm").validation();
            $("#restaurantSubmit").on('click',function(event){
                if ($("#restaurantForm").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }else{
                    $.post("<%=path%>/restaurant/save", $("#restaurantForm").serialize(),
                            function(data){
                                $('#restaurantModel').modal('hide');

                                var content = ' <li class="list-group-item">'
                                        + '<p>' + $("#restaurantName").val() + '</p>'
                                        + '<p>消费金额:' + $("#restaurantPrice").val() + ' &nbsp;人民币</p>'
                                        + '</li>';
                                $(content).appendTo('#restaurantList');
                            },"json");
                }
            });

            //mark
            $("#markSubmit").on('click',function(event){
                if ($("#mark").val().length > 0 ){
                    $.post("<%=path%>/img/mark", $("#markForm").serialize(),
                            function(data){
                                $('#markModel').modal('hide');
                                var divName = "#mark_"+$('#imgid').val();
                                $(divName).html($('#mark').val());
                            },"json");
                }else{
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }
            });


            $("#editForm").validation();
            $("#editSubmit").on('click',function(event){
                if ($("#editForm").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }else{
                    $('#createdate').val($('#createdate').val()+' 00:00:00');
                    $.post("<%=path%>/img/imgGps", $("#editForm").serialize(),
                            function(data){
                                $('#editModal').modal('hide');
                            },"json");
                }
            });
        });

        function getListPlace(day, tripDate)
        {
            $.post("<%=path%>/trip/listPlace", { tripDate:tripDate},
                    function(data){
                            var uiName = '#ul_day_'+day;
                            $(data).each(function(){
                                var typeName;
                                if(this.type == 1){
                                    typeName = '景点:';
                                }else if(this.type == 2)
                                {
                                    typeName = '酒店:';
                                }else if(this.type == 3)
                                {
                                    typeName = '餐厅:';
                                }else if(this.type == 4)
                                {
                                    typeName = '导游:';
                                }else{
                                    typeName = '航班:';
                                }

                                var content = '<li class="list-group-item">'+typeName + this.name+'</li>';
                                $(content).appendTo(uiName);
                            });

                    },"json");

        }



        function onUploadFile()
        {
            location.href = '<%=path%>/upload';
        }

        function onFollowTrip(tripid)
        {
            location.href = '<%=path%>/trip/follow/'+tripid;
        }




        function onDelImg(imgId)
        {
            $.post("<%=path%>/img/del", { id: imgId },
                    function(data){
                        var divName = "#img_"+imgId;
                        $(divName).remove();
                    },"json");
        }

        function onDefaultImg(imgId)
        {
            $.post("<%=path%>/img/defaultImg", { id: imgId },
                    function(data){
                        var divName = "#btnDefault_"+imgId;
                        $(divName).text("封面图片");
                    },"json");

        }

        function onMark(id)
        {
            var divName = "#mark_"+id;
            $('#imgid').val(id);
            $('#mark').val( $(divName).html());
            $('#markModel').modal('show');
        }

        function onEditImg(id)
        {
            $('#editImgid').val(id);
            $('#createdate').val('');
            $('#gps').val('');
            $('#gpsname').val('');
            $("#editForm").validation();
            $('#editModal').modal('show');
        }

        function onImgLove(imgId)
        {
            if($("#userid").val().length == 0)
            {
                location.href='<%=path%>/login';
                return;
            }

            $.post("<%=path%>/img/love", { id: imgId},
                    function(data){
                        if(data > -1)
                        {
                            var divName = "#btn_love_"+imgId;
                            $(divName).html("喜欢[" + data + "]");
                        }
                    },"json");
        }

        function onTripLove(tripid)
        {
            if($("#userid").val().length == 0)
            {
                location.href='<%=path%>/login';
                return;
            }
            $.post("<%=path%>/trip/love", { id: tripid},
                    function(data){
                        if(data > -1)
                        {
                            $("#btn_love_trip").html("喜欢[" + data + "]");
                        }
                    },"json");
        }

        function onComment(imgid)
        {
            var divname = "#comment_"+imgid;
            if($(divname).css("display") == "none")
            {
                var cname = "#comment_content_"+imgid
                $(cname).val();
                $(divname).show();
                $.post("<%=path%>/imgcomment/list", { id: imgid},
                        function(data){
                            var rowname = "#commment_row_" + imgid;
                            $(rowname).empty();
                            var userid = $("#userid").val();
                            $(data).each(function(){
                                var str = '<div class="col-md-10">'
                                        + '<p class="col-md-10">'+this.name+' :'+this.content+'</p>'
                                        + '</div>'
                                        +  '<div class="col-md-2">';

                                if(userid == this.userId)
                                {
                                    str +=  '<button  type="button" class="btn btn-success btn-xs" onclick="onImgCommentDel('+this.imgId+')">'
                                    +   '删除 </button>';
                                }
                                str +=   '</div>';
                                $(str).appendTo(rowname);
                            });
                        },"json");
            }
            else{
                $(divname).hide();
            }
        }

        function onImgComment(imgid)
        {
            if($("#userid").val().length == 0)
            {
                location.href='<%=path%>/login';
                return;
            }

            var cname = "#comment_content_"+imgid
            if($(cname).val().length < 1)
            {
                alert("请输入评论!")
                return;
            }
            var fname = "#commentForm_"+imgid;
            $.post("<%=path%>/imgcomment/save", $(fname).serialize(),
                    function(data){
                        $(cname).val('')
                        var rowname = "#commment_row_" + imgid;
                        $(rowname).empty();
                        var userid = $("#userid").val();
                        $(data).each(function(){
                            var str = '<div class="col-md-10">'
                                    + '<p class="col-md-10">'+this.name+' :'+this.content+'</p>'
                                    + '</div>'
                                    +  '<div class="col-md-2">';

                            if(userid == this.userId )
                            {
                                str +=  '<button  type="button" class="btn btn-success btn-xs" onclick="onImgCommentDel('+this.imgId+')">'
                                        +   '删除 </button>';
                            }
                            str +=   '</div>';
                            $(str).appendTo(rowname);
                        });
                    },"json");
        }

        function onImgCommentDel(imgid)
        {
            $.post("<%=path%>/imgcomment/del", { id: imgid},
                    function(data){
                        var rowname = "#commment_row_" + imgid;
                        $(rowname).empty();
                        var userid = $("#userid").val();
                        $(data).each(function(){
                            var str = '<div class="col-md-10">'
                                    + '<p class="col-md-10">'+this.name+' :'+this.content+'</p>'
                                    + '</div>'
                                    +  '<div class="col-md-2">';

                            if(userid == this.userId )
                            {
                                str +=  '<button  type="button" class="btn btn-success btn-xs" onclick="onImgCommentDel('+this.imgId+')">'
                                        +   '删除 </button>';
                            }
                            str +=   '</div>';
                            $(str).appendTo(rowname);
                        });
                    },"json");
        }




        var LocsS = [
            <c:forEach var="img" items="${list_img}">
            <c:if test="${img.lat != '' }">
            {
                lat: ${img.lat},
                lon: ${img.lon},
                zoom:8
            },
            </c:if>
            </c:forEach>
        ];

        new Maplace({
            locations: LocsS,
            show_markers: true,
            type: 'polyline',
            controls_on_map: false
        }).Load();


        var map;
        var myCenter=new google.maps.LatLng(39.92, 116.46);
        var marker=new google.maps.Marker({
            position:myCenter
        });

        function initialize() {
            var mapProp = {
                center:myCenter,
                zoom: 4,
                mapTypeId:google.maps.MapTypeId.ROADMAP
            };

            map=new google.maps.Map(document.getElementById("editmap"),mapProp);
            marker.setMap(map);

            google.maps.event.addListener(map, 'click', function(e) {
                var point = e.latLng;
                $("#gps").val(e.latLng);
                $("#lat").val(e.latLng.lat());
                $("#lon").val(e.latLng.lng());

                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({'latLng':point},function(result,status){
                    var pos='';
                    if (status == google.maps.GeocoderStatus.OK) {
                        pos =  result[0].formatted_address.split(' ')[0];
                    }
                    $('#gpsname').val(pos);
                });

                if (marker) {
                    marker.setAnimation(google.maps.Animation.DROP);
                    marker.setPosition(e.latLng);
                } else {
                    marker = new google.maps.Marker({
                        position: e.latLng,
                        animation: google.maps.Animation.DROP,
                        map: map});
                }
            });
        };

        $("#editModal").on("shown.bs.modal", function () {
            initialize();
            google.maps.event.trigger(map, "resize");
        });


    </script>


</body>
</html>