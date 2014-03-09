
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html style="" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta charset="utf-8">
    <title>myw</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">
</head>

<body class="">


<jsp:include page="top.jsp"></jsp:include>



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
                <img src="<%=path%>/img/slider_1.jpg" alt="First slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>客户端下载</h1>
                        <p>iOS android 客户端下载，随时随地都能更新旅游信息。</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">下载</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img src="<%=path%>/img/slider_2.jpg" alt="Second slide">
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
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>



    </div><!-- /.carousel -->

    <div class="container">

        <div class="container">

            <div class="row">

                <!-- right -->
                <div class="col-md-8">

                    <div class="row">
                        <div class="col-md-12">
                            <h2>慕友百科</h2>
                        </div>
                    </div>

                    <div class="row" style="font-size: 18px;">
                            <ol>
                                <li>Lorem ipsum dolor sit amet</li>
                                <li>Consectetur adipiscing elit</li>
                                <li>Integer molestie lorem at massa</li>
                                <li>Facilisis in pretium nisl aliquet</li>
                                <li>Nulla volutpat aliquam velit</li>
                                <li>Faucibus porta lacus fringilla vel</li>
                                <li>Aenean sit amet erat nunc</li>
                                <li>Eget porttitor lorem</li>
                                <li>Nulla volutpat aliquam velit</li>
                                <li>Faucibus porta lacus fringilla vel</li>
                                <li>Aenean sit amet erat nunc</li>
                                <li>Eget porttitor lorem</li>

                                <li>Nulla volutpat aliquam velit</li>
                                <li>Faucibus porta lacus fringilla vel</li>
                                <li>Aenean sit amet erat nunc</li>
                                <li>Eget porttitor lorem</li>

                            </ol>
                    </div><!--/row-->



                </div>

                <!--left-->
                <div class="col-md-4">

                    <div class="panel panel-default">

                        <div class="panel-heading">精品路线</div>

                        <div class="panel-body">
                            <img src="<%=path%>/img/21.jpg" alt="">
                        </div>
                    </div>




                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">广告2</h3>
                        </div>
                        <div class="panel-body">
                            <img src="<%=path%>/img/21.jpg" alt="">
                        </div>
                    </div>


                </div>

            </div>
        </div>


    </div>

    <br/>

    <jsp:include page="foot.jsp"></jsp:include>


</body>

<script src="<%=path%>/js/offcanvas.js"></script>


<script type="text/javascript">
    function onLogin()
    {
        location.href='<%=path%>/login';
    }

    function onRigister()
    {
        location.href='<%=path%>/register';
    }
</script>


</html>