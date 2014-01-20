
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

    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/css/starter-template.css" rel="stylesheet">
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>



<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
            <div class="jumbotron">
                <img src="<%=path%>/img/12.jpg" alt="">
            </div>

            <div class="row">
                <h3>热门线路</h3>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/1.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/2.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/3.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/4.jpg" alt="">
                    </a>
                </div>
            </div><!--/row-->

            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/1.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/2.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/3.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/4.jpg" alt="">
                    </a>
                </div>
            </div><!--/row-->

            <h3>推荐线路</h3>
            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/1.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/2.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/3.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/4.jpg" alt="">
                    </a>
                </div>
            </div><!--/row-->
            <div class="row">
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/1.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/2.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/3.jpg" alt="">
                    </a>
                </div>
                <div class="col-xs-6 col-md-3">
                    <a href="#" class="thumbnail">
                        <img src="<%=path%>/img/4.jpg" alt="">
                    </a>
                </div>
            </div><!--/row-->



        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">



            <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">热门国家动态</div>

            <!-- Table -->
            <table class="table">
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>
                <tr>
                    <td>韩国</td>
                    <td>美国</td>
                </tr>

            </table>
        </div>

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">热门城市动态</div>

                <!-- Table -->
                <table class="table">
                    <tr>
                        <td>厦门</td>
                        <td>成都</td>
                    </tr>
                    <tr>
                        <td>韩国</td>
                        <td>美国</td>
                    </tr>
                    <tr>
                        <td>韩国</td>
                        <td>美国</td>
                    </tr>
                    <tr>
                        <td>韩国</td>
                        <td>美国</td>
                    </tr>
                    <tr>
                        <td>韩国</td>
                        <td>美国</td>
                    </tr>
                    <tr>
                        <td>韩国</td>
                        <td>美国</td>
                    </tr>

                </table>
            </div>


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">微博介绍信息</h3>
                </div>
                <div class="panel-body">

                    <div style="height:28px;">
                        <h4 style="font-size: 14px;"><span style="width:160px;">微博地址：</span>********** </h4>
                    </div>

                    <div style="height:28px;">
                        <h4 style="font-size: 14px;"><span style="width:160px;">联系电话：</span>189888888 </h4>
                    </div>

                    <div style="height:28px;">
                        <h4 style="font-size: 14px;"><span style="width:160px;">联系QQ：&nbsp;</span>8888888</h4>
                    </div>

                    <div style="height:28px;">
                        <h4 style="font-size: 14px;"><span style="width:160px;">联系Email：</span>8888888@qq.com </h4>
                    </div>
                </div>
            </div>



        </div><!--/span-->
    </div><!--/row-->

    <div class="footer">
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
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>