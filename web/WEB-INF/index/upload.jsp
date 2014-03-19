
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <!-- Force latest IE rendering engine or ChromeFrame if installed -->
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <meta charset="utf-8">
    <title>MYW</title>
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support and progress bar for jQuery. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >

    <link rel="stylesheet" href="<%=path%>/fileupload/css/jquery.fileupload.css">

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<div class="container">

    <h3>行程名称：${trip.name}</h3>

    <!-- The fileinput-button span is used to style the file input field as button -->
    <span class="btn btn-success fileinput-button">
        <i class="glyphicon glyphicon-plus"></i>
        <span>上传照片...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="fileupload" type="file" name="files[]" multiple>
    </span>

    <button type="button" class="btn btn-primary" onclick="onNext()">
        查看行程
    </button>

    <br>
    <br>

    <div id="listfile" class="row thumbnail">
        <c:choose>
            <c:when test="${fn:length(list_img) > 0}">
                <c:forEach var="img" items="${list_img}">
                    <div id="img_${img.id}" class="col-md-3" style="text-align: center;height: 260px;">
                        <div class="image-box">
                            <img style=" vertical-align:middle;width: 260px; " alt="" src="<%=path%>${img.imgpath}" alt="">
                        </div>
                        <button type="button" class="btn btn-primary btn-xs" style="margin-top: 3px;" onclick="onDelImg(${img.id})">
                            删除
                        </button>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div id="noImgDiv" class="col-md-12" style="text-align: center;">
                    <h3>还没有上传照片</h3>
                </div>
            </c:otherwise>
        </c:choose>
    </div><!--/row-->

    <!-- The global progress bar -->
    <!--
    <div id="progress" class="progress">
        <div class="progress-bar progress-bar-success"></div>
    </div>
    -->
    <!-- The container for the uploaded files -->
    <div id="files" class="files"></div>
    <br>


</div>


<jsp:include page="foot.jsp"></jsp:include>


<script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="<%=path%>/fileupload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="<%=path%>/fileupload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="<%=path%>/fileupload/js/jquery.fileupload.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>


<script>
    function onNext()
    {
        location.href = '<%=path%>/trip/show/${tripid}';
    }

    function onDelImg(imgId)
    {
        $.post("<%=path%>/img/del", { id: imgId },
                function(data){
                    if(data > -1)
                    {
                        var divName = "#img_"+imgId;
                        $(divName).remove();
                        if(data == 0)
                        {
                            var content = '<div id="noImgDiv" class="col-md-12" style="text-align: center;">'
                                    + ' <h3>还没有上传照片</h3>'
                                    + '</div>';
                            $(content).appendTo('#listfile');
                        }
                    }
                },"json");
    }

    /*jslint unparam: true */
    /*global window, $ */
    $(function () {
        'use strict';
        $('#fileupload').fileupload({
            url: '<%=path%>/img/save',
            dataType: 'json',
            done: function (e, data) {

                $.each(data.result.files, function (index, file) {
                    $('#noImgDiv').remove();
                    var content = '<div id="img_'+file.deleteUrl+'" class="col-md-3" style="text-align: center;height: 260px;">'
                            + '<div class="image-box">'
                            +  '<img style="vertical-align:middle;width: 260px;" src="<%=path%>'+file.url+'" alt="">'
                            + '</div>'
                            + '<button type="button" class="btn btn-primary btn-xs" style="margin-top: 3px;" onclick="onDelImg('+file.deleteUrl+')">删除 </button>'
                            + '</div>';
                    $(content).appendTo('#listfile');
                });
            },
            progressall: function (e, data) {
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });
</script>
</body>
</html>
