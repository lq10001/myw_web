
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>CMS</title>

    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>


<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-xs-12 col-md-12">

            <div class="col-md-8">

                <div class="row">
                    <!--icon-->
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <c:choose>
                                <c:when test="${user.imgpath == ''}">
                                    <img src="<%=path%>/img/1.jpg" style="width: 160px;height: 160px;" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img src="<%=path%>${user.imgpath}" style="width: 160px;height: 160px;" alt="">
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </div>
                    <!--name-->
                    <div class="col-md-2">
                        <br/>
                        <br/>
                        <span style="font-size: 21px;">
                            <c:out  value="${user.name}"/>
                        </span>
                        <br/>
                        <span>
                            访问 ${myVisit} | 喜欢 <c:out value="${loveCount}"></c:out>
                        </span>
                        <button class="btn btn-primary btn-xs" data-toggle="modal" onclick="onEditUser('${user.id}','${user.info}')">
                            编辑
                        </button>


                    </div>
                    <!--留言-->
                    <div class="col-md-6">
                        <br/>
                        <br/>
                        <blockquote>
                            <c:choose>
                                <c:when test="${user.info == ''}">
                                    <p>爱生活，爱旅游</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${user.info}</p>
                                </c:otherwise>
                            </c:choose>
                        </blockquote>
                    </div>

                    <div class="col-md-1">
                        <br/>
                        <br/>

                        <button class="btn btn-primary btn-lg" data-toggle="modal" onclick="onAddTrip()">
                            +创建我的行程
                        </button>
                         <!--
                        <button type="button" class="btn btn-success" onclick="onCreate()"> +创建我的行程</button>
                        -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-justified nav-stacked nav-tabs">
                            <li class="col-md-2">
                                <a href="#">Follow<c:out value="${fn:length(list_follow)}"></c:out></a>
                            </li>
                            <li class="col-md-2">
                                <a href="#">行程<c:out value="${fn:length(list_trip)}"></c:out></a>
                            </li>
                            <li class="col-md-2">
                                <a href="#">喜欢<c:out value="${fn:length(list_img)}"></c:out></a>
                            </li>
                        </ul>
                    </div>

                </div>


            <div class="col-md-4">

            </div>
        </div>

    </div>
              <br/>

        <div class="row">
            <div class="col col-md-12">
                <hr>
            </div>
        </div>

            <h2>我follow的行程</h2>

            <div class="row">

                <c:choose>
                    <c:when test="${fn:length(list_follow) > 0}">

                        <c:forEach var="trip" items="${list_follow}">
                            <div class="col-xs-6 col-md-3">
                                <div class="image-box">
                                    <a href="<%=path%>/trip/show/${trip.id}">

                                        <c:choose>
                                            <c:when test="${trip.defaultimg == ''}">
                                                <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 260px; " alt="">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 260px; " alt="">
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <a href="<%=path%>/trip/show/${trip.id}">
                                            <label>${trip.name}</label>
                                        </a>
                                    </div>
                                    <div class="col-md-5" style="text-align: right;">
                                        <button type="button" class="btn btn-success btn-xs" onclick="onEditTrip(${trip.id},'${trip.name}','${trip.type}')">
                                            编辑
                                        </button>
                                        <button type="button" class="btn btn-success btn-xs"  onclick="onDelTrip(${trip.id})">
                                            删除
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </c:when>
                    <c:otherwise>
                        <div class="thumbnail col-md-12" style="text-align: center;">
                            <h3>没有Follow行程</h3>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div><!--/row-->

        <h2>我创建的行程</h2>

        <div class="row">

            <c:choose>
                <c:when test="${fn:length(list_trip) > 0}">

                    <c:forEach var="trip" items="${list_trip}">
                        <div class="col-xs-6 col-md-3">
                                <div class="image-box">
                                    <a href="<%=path%>/trip/show/${trip.id}">

                                    <c:choose>
                                        <c:when test="${trip.defaultimg == ''}">
                                            <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 260px; " alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 260px; " alt="">
                                        </c:otherwise>
                                    </c:choose>
                                     </a>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <a href="<%=path%>/trip/show/${trip.id}">
                                            <label>${trip.name}</label>
                                        </a>

                                    </div>
                                    <div class="col-md-5" style="text-align: right;">
                                        <button type="button" class="btn btn-success btn-xs" onclick="onEditTrip(${trip.id},'${trip.name}','${trip.type}')">
                                            编辑
                                        </button>
                                        <button type="button" class="btn btn-success btn-xs"  onclick="onDelTrip(${trip.id})">
                                            删除
                                        </button>
                                    </div>

                                </div>

                        </div>
                    </c:forEach>

                </c:when>
                <c:otherwise>
                    <div class="thumbnail col-md-12" style="text-align: center;">
                        <h3>没有创建行程</h3>
                    </div>
                </c:otherwise>
            </c:choose>

        </div><!--/row-->

        <h2>喜欢的照片</h2>


        <div class="row">

            <c:choose>
                <c:when test="${fn:length(list_img) > 0}">

                    <c:forEach var="img" items="${list_img}">
                        <div class="col-xs-6 col-md-3">
                            <a href="<%=path%>/trip/show/${img.tripid}">
                                <div class="image-box">
                                    <c:choose>
                                        <c:when test="${img.imgpath == ''}">
                                            <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 260px; " alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="<%=path%>${img.imgpath}"  style=" vertical-align:middle;width: 260px; " alt="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </c:when>
                <c:otherwise>
                    <div class="thumbnail col-md-12" style="text-align: center;">
                        <h3>还没有喜欢的照片</h3>
                    </div>
                </c:otherwise>
            </c:choose>
        </div><!--/row-->

        <br/>

        </div><!--/span-->

    </div><!--/row-->

<!-- Modal -->
<div class="modal fade" id="tripModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <form class="form-horizontal" method="post" id="form1" action="<%=path%>/trip/save" role="form">

                <input id="tripid" type="hidden" name="trip.id" value="">
                <input id="triptype" type="hidden" name="trip.type" value="">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">创建新的旅程</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name" class="col-md-2 control-label">旅程名称</label>
                                <div class="col-md-6">
                                    <input type="text" name="trip.name" class="form-control" id="name" placeholder="" check-type="required">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="onSaveTrip()">保存</button>
                </div>

            </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- UserModal -->
<div class="modal fade" id="userModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;height: 400px;">
        <div class="modal-content">
            <form class="form-horizontal" method="post" id="userForm" action="<%=path%>/user/save" role="form" enctype="multipart/form-data">
                <input type="hidden" id="userid" name="user.id"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="info" class="col-md-2 control-label">签名</label>
                                <div class="col-md-6">
                                    <input type="text" name="user.info" class="form-control" id="info" placeholder="" check-type="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="imgpath" class="col-md-2 control-label">头像图片</label>
                                <div class="col-md-6">
                                    <input type="file" name="user.imgpath" class="form-control" id="imgpath" placeholder="">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="onSaveUser()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<jsp:include page="foot.jsp"></jsp:include>

    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>


<script type="text/javascript">

    function onAddTrip()
    {
        $('#tripid').val('');
        $('#name').val('');
        $('#triptype').val(1);
        $("#form1").validation();
        $('#tripModal').modal('show');
    }

    function onEditTrip(tripid,tripname,type)
    {
        $('#tripid').val(tripid);
        $('#name').val(tripname);
        $('#triptype').val(type);
        $("#form1").validation();
        $('#tripModal').modal('show');
    }

    function onSaveTrip()
    {
        if ($("#form1").valid()==false){
            $("#error-text").text("填写信息不完整。")
            return false;
        }else{
            $("#form1").submit();
        }
    }

    function onDelTrip(tripid)
    {
        location.href= '<%=path%>/trip/del/'+tripid;
    }

    function onEditUser(userid,memo)
    {
        $('#userid').val(userid);
        $('#imgpath').val('');
        $('#info').val(memo);
        $("#userForm").validation();
        $('#userModel').modal('show');
    }

    function onSaveUser()
    {
        if ($("#userForm").valid()==false){
            $("#error-text").text("填写信息不完整。")
            return false;
        }else{
            $("#userForm").submit();
        }
    }

</script>
