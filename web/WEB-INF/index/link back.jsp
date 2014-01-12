
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

    <link href="<%=path%>/bootstrap302/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/css/starter-template.css" rel="stylesheet">

</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

    <div class="container" style="margin-top: 20;">

        <div class="row row-offcanvas row-offcanvas-right">

            <div class="col-xs-12 col-sm-9">
                <p class="pull-right visible-xs">
                    <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
                </p>
                <div class="jumbotron">
                    <h1>六亿科技</h1>
                    <p>专注行业信息解决方案</p>
                </div>
                <div class="row">
                    <c:forEach var="product" items="${product_list}">

                            <div class="col-6 col-sm-6 col-lg-4">
                                <h2>${product.name}</h2>
                                <p>${product.descript}</p>
                                <p><a class="btn btn-primary" href="#" role="button">详细 &nbsp;&nbsp;&raquo;</a></p>
                            </div>
                    </c:forEach>
                </div><!--/row-->
            </div><!--/span-->

            <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
                <div class="list-group">
                    <a href="#" class="list-group-item active">联系方式</a>
                    <a href="#" class="list-group-item">联系地址：成都红牌楼佳灵路10号</a>
                    <a href="#" class="list-group-item">联系电话：18982280521</a>
                    <a href="#" class="list-group-item">联系QQ：239976281</a>
                    <a href="#" class="list-group-item">联系Email：dongfang.x@qq.com</a>
                </div>
            </div><!--/span-->
        </div><!--/row-->

        <hr/>
        <footer >
            <p>&copy; 六亿科技 2013</p>
        </footer>

    </div><!--/.container-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap302/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>