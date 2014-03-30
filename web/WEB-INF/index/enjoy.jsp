
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




    <div class="container" style="margin-top: -20px;">


        <div class="container">

            <div class="row">

                <!-- right -->
                <div class="col-md-8">

                    <div class="row">
                        <div class="col-md-12">
                            <h2>风景欣赏</h2>
                        </div>
                    </div>

                    <div class="row">
                        <c:forEach var="img" items="${list_img}">
                            <div class="col-md-3">
                                <a href="<%=path%>/trip/show/${img.tripid}">
                                    <div class="image-box-a">
                                           <img src="<%=path%>${img.smallimgpath}"  style=" vertical-align:middle;width: 180px; " alt="">
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div><!--/row-->

                    <div class="row">
                        <div class="col-md-12" style="text-align: center;">
                            <p>加载更多...</p>
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