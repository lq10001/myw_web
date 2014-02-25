
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
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

        <div class="col-xs-12 col-md-12">

            <h3>行程名称：</h3>
            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-success" data-toggle="modal" data-target="#myModal">
                        +添加地点
                    </button>

                </div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <form class="form-horizontal" method="post" id="form1" action="<%=path%>/place/save" role="form">


                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">添加旅程地点</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">

                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-8">

                                            <div class="form-group">
                                                <label for="name">地点名称</label>
                                                <input type="text" name="place.name" class="form-control" id="name" placeholder="" check-type="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="name">GPS</label>
                                                <input type="text" name="place.gps" class="form-control" id="gps" placeholder="" check-type="required">
                                            </div>

                                        </div>

                                        <div class="col-md-2">
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">保存</button>
                                </div>

                            </form>

                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

            </div>
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>GPS信息</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="place" items="${list_place}">

                            <tr>
                                <td>${place.id}</td>
                                <td>${place.name}</td>
                                <td>${place.gps}</td>
                                <td>${place.adddate}</td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="addImg(${place.id})">照片管理</button>
                                    <button type="button" class="btn btn-primary">编辑</button>
                                    <button type="button" class="btn btn-primary">删除</button>
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-md-4">


                </div>

            </div>



        </div>

    </div>

</div>


    <jsp:include page="foot.jsp"></jsp:include>

    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>


<script type="text/javascript">
    function onCreate()
    {
        location.href = '<%=path%>/';
    }
    function addImg(placeid)
    {
        location.href='<%=path%>/upload/'+placeid;
    }
</script>
