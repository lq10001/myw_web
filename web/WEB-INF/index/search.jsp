
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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



        <div class="container">

            <div class="row">

                <div class="col-md-8">
                    <form method="post" id="searchForm2" action="<%=path%>/search2" class="navbar-form" role="form">


                    <div class="row">
                        <div class="col-md-8">
                            <input  id="search2" name="sname2" type="text" class="form-control" placeholder="城市|景点">
                        </div>
                        <div class="col-md-4">
                            <button type="button"  class="btn btn-success" style="margin-left: 10px;" onclick="onSearch()">搜索</button>
                        </div>
                    </div>
                    </form>




                    <div class="row">
                        <div class="col-md-12">
                            <h2>搜索结果</h2>
                        </div>
                    </div>

                    <div class="row">

                        <c:choose>
                        <c:when test="${fn:length(list_trip) > 0}">

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

                        </c:when>
                            <c:otherwise>
                                <div class="thumbnail col-md-12" style="text-align: center;">
                                    <h3>请输入内容进行搜索</h3>
                                </div>
                            </c:otherwise>
                        </c:choose>

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
    function onSearch()
    {
        if($("#search2").val().length < 1)
        {
            alert("请输入搜索内容进行搜索");
            return;
        }
        $("#searchForm2").submit();
    }
</script>


</html>