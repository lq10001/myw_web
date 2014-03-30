
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

    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>


<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-xs-12 col-md-12">

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
                                    <h1>热门线路</h1>
                                    <p>热门线路，跟随旅游达人...。</p>
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

            <h2>随我行</h2>
        <div class="row">

            <c:forEach var="trip" items="${list_tripend}">
                <div class="col-xs-6 col-md-3">
                    <a href="<%=path%>/trip/show/${trip.id}">
                        <div class="image-box">
                            <c:choose>
                                <c:when test="${trip.defaultimg == ''}">
                                    <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 260px; " alt="">
                                </c:when>
                                <c:otherwise>
                                    <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 260px; " alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <p style="text-align: center;">${trip.name}</p>
                    </a>
                </div>
            </c:forEach>
        </div><!--/row-->


        <h2>在路上</h2>

        <div class="row">

            <c:forEach var="trip" items="${list_tripnow}">
                <div class="col-xs-6 col-md-3">
                    <a href="<%=path%>/trip/show/${trip.id}">
                        <div class="image-box">
                            <c:choose>
                                <c:when test="${trip.defaultimg == ''}">
                                    <img src="<%=path%>/upload/default.jpg"  style=" vertical-align:middle;width: 260px; " alt="">
                                </c:when>
                                <c:otherwise>
                                    <img src="<%=path%>${trip.defaultimg}"  style=" vertical-align:middle;width: 260px; " alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <p style="text-align: center;">${trip.name}</p>
                    </a>
                </div>
            </c:forEach>
        </div><!--/row-->


        <div class="row">
             <div style="text-align: center"> 加载更多.... </div>
        </div>
        <br/>

        </div><!--/span-->

    </div><!--/row-->


    <div class="container">
        <div class="row">
            <div class="col-md-12">
                合作伙伴:
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
            </div>

            <div class="col-md-12">
                <p>友情链接
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>

            </div>

            <div class="col-md-12">
                <p>&copy; 募游网 2013</p>
            </div>
        </div>
    </div>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>