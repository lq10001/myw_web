
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html style="" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

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

        <div class="row">
            <div class="container">
                <div class="col col-md-12">
                    <img src="http://lorempixel.com/1024/100/nightlife/4" class="img-responsive" >
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h2>热门景点</h2>
            </div>
        </div>


        <div class="container">

            <div class="row">

                <!-- right -->
                <div class="col-md-8">


                    <div class="row">
                        <!--big-->
                        <div class="col-md-6">
                            <div style="width:350px;height: 350px; background-image:url(<%=path%>/img/1.jpg);background-repeat:repeat">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>


                    <div class="row">
                        <!--big-->
                        <div class="col-md-6">
                            <div style="width:350px;height: 350px; background-image:url(<%=path%>/img/1.jpg);background-repeat:repeat">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <!--big-->
                        <div class="col-md-6">
                            <div style="width:350px;height: 350px; background-image:url(<%=path%>/img/1.jpg);background-repeat:repeat">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<%=path%>/img/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

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

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">广告3</h3>
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