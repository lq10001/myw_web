
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>


    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>
    <script src="http://ditu.google.cn/maps/api/js?sensor=false&libraries=geometry&v=3.7"></script>
    <script type="text/javascript" src="<%=path%>/js/maplace.min.js"></script>

    <script src="<%=path%>/datepicker/js/bootstrap-datepicker-zh_CN.js"></script>
    <link href="<%=path%>/datepicker/css/datepicker.css" rel="stylesheet">


    <style>
        #gmap {
            display: block;
            width: 600px;
            height: 350px;

        }
    </style>



</head>
<body>


<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-xs-12 col-md-12">

            <h3>行程名称：</h3>
            <div class="row">
                <div class="col-md-12">
                    <button id="addPlace" class="btn btn-success" data-toggle="modal">
                        +添加地点
                    </button>

                    <button id="showTrip" type="button" class="btn btn-primary">
                        查看行程
                    </button>

                </div>



            </div>
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="place" items="${list_place}">

                            <tr>
                                <td>${place.id}</td>
                                <td>${place.name}</td>
                                <td>${place.adddate}</td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="addImg(${place.id})">照片管理</button>
                                    <button type="button" class="btn btn-primary" onclick="editPlace(${place.id},'${place.name}','${place.gps}',${place.lat},${place.lon})">编辑</button>
                                    <!--
                                    <button type="button" class="btn btn-primary">删除</button>
                                    -->
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

<!-- Modal -->
<div class="modal fade" id="placeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;height: 600px;">
        <div class="modal-content">

            <form class="form-horizontal" method="post" id="placeForm" action="<%=path%>/place/save" role="form">

                <input id="lat" type="hidden" name="place.lat" value="">
                <input id="lon" type="hidden" name="place.lon" value="">
                <input id="placeid" type="hidden" name="place.id" value="">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加旅程地点</h4>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="name" class="col-md-2 control-label">地点名称</label>
                                <div class="col-md-6">
                                    <input type="text" name="place.name" class="form-control" id="name" placeholder="" check-type="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="tripdate" class="col-md-2 control-label">旅游时间</label>
                                <div class="col-md-6">
                                    <input type="text" name="place.tripdate" class="form-control span2" id="tripdate" placeholder=""  data-date-format="yyyy-mm-dd" check-type="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-md-2 control-label">地点类型</label>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <input type="radio" id="type2" name="place.type" value="1" checked>景点
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" id="type3" name="place.type" value="2">酒店
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" id="type4" name="place.type" value="3">餐厅
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="gps" class="col-md-2 control-label">GPS</label>
                                <div class="col-md-6">
                                    <input type="text" readonly="readonly" name="place.gps" class="form-control" id="gps" placeholder="" check-type="required">
                                    <label>请点击地图确定GPS位置</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                    <div id="mapdiv" class="container" style="margin-left: 50px;">
                        <div id="gmap" style=""></div>
                    </div>
                </div>
                <div class="modal-footer" style="margin-top: -20px;height: 40px;">
                    <button type="button" class="btn btn-default" style="margin-top: -10px;" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" style="margin-top: -10px;" id="savePlace">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>


<script type="text/javascript">


    var map;
    var myCenter=new google.maps.LatLng(39.92, 116.46);
    var marker=new google.maps.Marker({
        position:myCenter
    });

    function initialize() {
        var mapProp = {
            center:myCenter,
            zoom: 14,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        map=new google.maps.Map(document.getElementById("gmap"),mapProp);
        marker.setMap(map);

        google.maps.event.addListener(map, 'click', function(e) {
            var point = e.latLng;
            $("#gps").val(e.latLng);
            $("#lat").val(e.latLng.lat());
            $("#lon").val(e.latLng.lng());


            if (marker) {
                marker.setAnimation(google.maps.Animation.DROP);
                marker.setPosition(e.latLng);
            } else {
                marker = new google.maps.Marker({
                    position: e.latLng,
                    animation: google.maps.Animation.DROP,
                    map: map});
            }
        });
    };

    $(function(){
        window.prettyPrint && prettyPrint();
        $('#tripdate').val('${nowDate}');
        $('#tripdate').datepicker({
            format: 'yyyy-mm-dd'
        });


        $("#addPlace").on('click',function(event){
            $('#placeid').val();
            $('#name').val();
            $('#gps').val();
            $('#placeModal').modal('show');
        });

        $("#showTrip").on('click',function(event){
            location.href = '<%=path%>/trip/show/${tripid}';
        });

        $("#placeModal").on("shown.bs.modal", function () {
            initialize();
            google.maps.event.trigger(map, "resize");
        });

        //flight
        $("#placeForm").validation();
        $("#savePlace").on('click',function(event){
            if ($("#placeForm").valid()==false){
                $("#error-text").text("填写信息不完整。")
                return false;
            }else{
                $("#placeForm").submit();
            }
        });
    });


    function onCreate()
    {
        location.href = '<%=path%>/';
    }
    function addImg(placeid)
    {
        location.href='<%=path%>/upload/'+placeid;
    }
    function editPlace(placeid,name,gps,lat,lon)
    {
        $('#placeid').val(placeid);
        $('#name').val(name);
        $('#gps').val(gps);
        $('#lat').val(lat);
        $('#lon').val(lon);
        $('#placeModal').modal('show');
    }
</script>
