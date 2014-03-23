
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

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>


    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">
</head>

<body class="">

<input type="hidden" id="userid" value="${userid}">
<jsp:include page="top.jsp"></jsp:include>

        <div class="container">

            <div class="row">

                <!-- right -->
                <div class="col-md-8">

                    <div class="row">
                        <button id="rtnBaike" type="button"  class="btn btn-success" style="margin-left: 10px;">返回百科列表</button>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="col-md-12">
                            <h3>标题: ${baike.title}</h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>作者: ${authorname}</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>添加时间: ${baike.adddate}</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <img src="<%=path%>${baike.imgurl}" alt="" style="width: 600px;height: 300px;">
                        </div>
                    </div>



                    <div class="row" style="font-size: 21px;">
                        <div class="col-md-12">
                            <p>${baike.info} </p>
                        </div>
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



    <br/>

    <jsp:include page="foot.jsp"></jsp:include>


</body>

<script src="<%=path%>/js/offcanvas.js"></script>

<script>

    $(function(){
        $("#rtnBaike").on('click',function(event){
           location.href = '<%=path%>/showBaike';
        });



    });
</script>



</html>