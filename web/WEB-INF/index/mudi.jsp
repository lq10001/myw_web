
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>

<body>



<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <div class="row">
                <div class="col-xs-4 col-md-4">
                    <h4>国际</h4>
                    <a href="#" class="thumbnail" onclick="onGuowai()">
                        <img src="<%=path%>/img/1.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-4 col-md-4">
                    <h4>国内</h4>
                    <a href="#" class="thumbnail" onclick="onGuonei()">
                        <img src="<%=path%>/img/2.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-4 col-md-4">
                    <h4>周边</h4>
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/3.jpg" alt="">
                    </a>
                </div>
            </div><!--/row-->

            <div class="row">

                <!-- Carousel
================================================== -->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="<%=path%>/img/12.jpg" alt="First slide">
                            <div class="container">
                                <div class="carousel-caption">
                                    <h1>客户端下载</h1>
                                    <p>iOS android 客户端下载，随时随地都能更新旅游信息。</p>
                                    <p><a class="btn btn-lg btn-primary" href="#" role="button">下载</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<%=path%>/img/12.jpg" alt="Second slide">
                            <div class="container">
                                <div class="carousel-caption">
                                    <h1>推荐路线</h1>
                                    <p>加入旅游达人制定的路线，跟随旅游达人一起旅行。</p>
                                    <p><a class="btn btn-lg btn-primary" href="#" role="button">点击进入</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<%=path%>/img/slider_3.jpg" alt="Third slide">
                            <div class="container">
                                <div class="carousel-caption">
                                    <h1>客户端下载</h1>
                                    <p>iOS android 客户端下载，随时随地都能更新旅游信息。</p>
                                    <p><a class="btn btn-lg btn-primary" href="#" role="button">下载</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.carousel -->

            </div>

            <div class="row">
                <div class="col-md-12">
                    <h2>热门线路</h2>
                </div>
            </div>


            <div class="row">
                <c:forEach var="trip" items="${list_trip}">
                    <div class="col-xs-6 col-md-3">
                        <a href="<%=path%>/trip/show/${trip.id}">
                            <div class="image-box-a">
                                <c:choose>
                                    <c:when test="${trip.defaultimg == ''}">
                                        <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 180px; " alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 180px; " alt="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <p style="text-align: center;">${trip.name}</p>
                        </a>
                    </div>
                </c:forEach>
            </div><!--/row-->

            <div class="row">
                <div class="col-md-12">
                    <h2>推荐线路</h2>
                </div>
            </div>


            <div class="row">
                <c:forEach var="trip" items="${list_trip}">
                    <div class="col-xs-6 col-md-3">
                        <a href="<%=path%>/trip/show/${trip.id}">
                            <div class="image-box-a">
                                <c:choose>
                                    <c:when test="${trip.defaultimg == ''}">
                                        <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 180px; " alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 180px; " alt="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <p style="text-align: center;">${trip.name}</p>
                        </a>
                    </div>
                </c:forEach>
            </div><!--/row-->

        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">



            <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">热门国家动态</div>

            <!-- Table -->
            <table class="table">

                <c:forEach var="hot" items="${listHot1}">
                    <tr>
                        <td><a href="<%=path%>/mudiInfo/${hot.hotid1}">${hot.name1}</a></td>
                        <td><a href="<%=path%>/mudiInfo/${hot.hotid2}">${hot.name2}</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">热门城市动态</div>

                <!-- Table -->
                <table class="table">
                    <c:forEach var="hot" items="${listHot2}">
                        <tr>
                            <td><a href="<%=path%>/mudiInfo/${hot.hotid1}">${hot.name1}</a></td>
                            <td><a href="<%=path%>/mudiInfo/${hot.hotid2}">${hot.name2}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>


            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">热门景点</div>

                <!-- Table -->
                <table class="table">
                    <c:forEach var="hot" items="${listHot3}">
                        <tr>
                            <td><a href="<%=path%>/mudiInfo/${hot.hotid1}">${hot.name1}</a></td>
                            <td><a href="<%=path%>/mudiInfo/${hot.hotid2}">${hot.name2}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>




        </div><!--/span-->
    </div><!--/row-->


    <!-- RestaurantModal -->
    <div class="modal fade" id="guowaiModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">请选择地点</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Table -->
                            <table class="table">
                                <tr>
                                    <td colspan="4">亚洲</td>
                                </tr>
                                <tr>
                                    <td><a href="<%=path%>/mudiInfo2/中国">中国</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/香港">香港</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/日本">日本</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/泰国">泰国</a></td>
                                </tr>

                                <tr>
                                    <td colspan="4">欧洲</td>
                                </tr>
                                <tr>
                                    <td><a href="<%=path%>/mudiInfo2/德国">德国</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/英国">英国</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/西班牙">西班牙</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/希腊">希腊</a></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="height: 50px;">
                    <button type="button" class="btn btn-default" style="margin-top: -10px;" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- RestaurantModal -->
    <div class="modal fade" id="guoneiModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">请选择地点</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Table -->
                            <table class="table">
                                <tr>
                                    <td colspan="4">直辖市</td>
                                </tr>
                                <tr>
                                    <td><a href="<%=path%>/mudiInfo2/北京市">北京市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/天津市">天津市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/上海市">上海市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/重庆市">重庆市</a></td>
                                </tr>

                                <tr>
                                    <td colspan="4">四川省</td>
                                </tr>
                                <tr>
                                    <td><a href="<%=path%>/mudiInfo2/成都市">成都市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/乐山市">乐山市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/绵阳市">绵阳市</a></td>
                                    <td><a href="<%=path%>/mudiInfo2/泸州市">泸州市</a></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="height: 50px;">
                    <button type="button" class="btn btn-default" style="margin-top: -10px;" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</div>




<jsp:include page="foot.jsp"></jsp:include>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/offcanvas.js"></script>

   <script>
       function onGuowai()
       {
           $('#guowaiModel').modal('show');

       }

       function onGuonei()
       {
           $('#guoneiModel').modal('show');
       }


   </script>


</body>
</html>