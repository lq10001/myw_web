
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

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>

<body>



<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

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
        <c:choose>
            <c:when test="${fn:length(list_trip) > 0}">

                <c:forEach var="trip" items="${list_trip}">
                    <div class="col-md-3">
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
                            <div class="col-md-12" style="text-align: center;">
                                <a href="<%=path%>/trip/show/${trip.id}">
                                    <label>${trip.name}</label>
                                </a>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </c:when>
            <c:otherwise>
                <div class="thumbnail col-md-12" style="text-align: center;">
                    <h3>没有分享的照片</h3>
                </div>
            </c:otherwise>
        </c:choose>
    </div><!--/row-->



</div>

<jsp:include page="foot.jsp"></jsp:include>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>