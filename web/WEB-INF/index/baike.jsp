
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

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>


    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>

<body>


<jsp:include page="top.jsp"></jsp:include>
<input type="hidden" id="userid" value="${userid}">

        <div class="container">

            <div class="row">

                <!-- right -->
                <div class="col-md-8">

                    <div class="row">
                            <button id="addBaike" type="button"  class="btn btn-success" style="margin-left: 10px;">添加百科</button>
                            <button id="myBaike" type="button"  class="btn btn-success" style="margin-left: 10px;">我的百科</button>
                            <button id="allBaike" type="button"  class="btn btn-success" style="margin-left: 10px;">所有百科</button>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h2>慕友百科</h2>
                        </div>
                    </div>


                    <c:choose>
                        <c:when test="${fn:length(listBaike) > 0}">
                            <table class="table col-md-12">
                                <tr style="font-size: 16px;">
                                    <th class="col-md-6">标题</th>
                                    <th class="col-md-2">作者</th>
                                    <th class="col-md-4">添加时间</th>

                                </tr>
                                    <c:forEach var="baike" items="${listBaike}">
                                        <tr style="font-size: 16px;">
                                            <td><a href="<%=path%>/baikeInfo/${baike.id}"> ${baike.title}</a></td>
                                            <td>${baike.name}</td>
                                            <td>${baike.adddate}</td>
                                        </tr>
                                    </c:forEach>
                            </table>


                        </c:when>
                        <c:otherwise>
                            <div class="thumbnail col-md-12" style="text-align: center;">
                                <h3>还没有创建行程</h3>
                            </div>
                        </c:otherwise>
                    </c:choose>
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

    <!-- BaikeModal -->
    <div class="modal fade" id="baikeModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 600px;height: 400px;">
            <div class="modal-content">
                <form class="form-horizontal" method="post" id="baikeForm" action="<%=path%>/baike/save" role="form" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加百科信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label for="title" class="col-md-2 control-label">名称</label>
                                    <div class="col-md-6">
                                        <input type="text" name="baike.title" class="form-control" id="title" placeholder="" check-type="required">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="baikePhone" class="col-md-2 control-label">百科图片</label>
                                    <div class="col-md-6">
                                        <input type="file" name="baike.imgurl" class="form-control" id="baikePhone" placeholder="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="info" class="col-md-2 control-label">百科内容</label>
                                    <div class="col-md-10">
                                        <textarea id="info" name="baike.info" rows="6" class="col-md-12"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="baikeSubmit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</body>

<script src="<%=path%>/js/offcanvas.js"></script>

<script>

    $(function(){

        $("#addBaike").on('click',function(event){
            if($("#userid").val().length == 0)
            {
                location.href='<%=path%>/login';
                return;
            }
            $("#title").val("");
            $("#info").val("");
            $("#baikeForm").validation();
            $('#baikeModel').modal('show');
        });

        $("#myBaike").on('click',function(event){
            if($("#userid").val().length == 0)
            {
                location.href='<%=path%>/login';
                return;
            }
            location.href = '<%=path%>/myBaike';
        });

        $("#allBaike").on('click',function(event){
            location.href = '<%=path%>/showBaike';
        });

        //Guide
        $("#baikeForm").validation();
        $("#baikeSubmit").on('click',function(event){
            if ($("#baikeForm").valid()==false){
                $("#error-text").text("填写信息不完整。")
                return false;
            }else{
                $("#baikeForm").submit();
            }
        });


    });
</script>



</html>