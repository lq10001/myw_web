
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<%=path%>/fileupload/css/jquery.fileupload.css">
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<div class="container">

    <h3>行程名称：</h3>
    <h3>拍摄地点：</h3>

    <!-- The fileinput-button span is used to style the file input field as button -->
    <span class="btn btn-success fileinput-button">
        <i class="glyphicon glyphicon-plus"></i>
        <span>上传照片...</span>
        <!-- The file input field used as target for the file upload widget -->
        <input id="fileupload" type="file" name="files[]" multiple>
    </span>

    <button type="button" class="btn btn-primary" onclick="onNext()">
        预览效果
    </button>

    <button type="button" class="btn btn-primary" onclick="onEditPlace()">
        编辑行程
    </button>


    <br>
    <br>

    <div id="listfile" class="row">
        <c:forEach var="img" items="${list_img}">
            <div class="col-md-2">
                <div class="thumbnail" style="text-align: center;width: 200px;height: 220px;">
                    <img style="margin-left: 5px;margin-top: 5px; width: 180px;height: 180px;" src="<%=path%>${img.imgpath}" alt="">

                    <button type="button" class="btn btn-primary btn-xs" style="margin-top: 3px;" onclick="onEditPlace()">
                        删除
                    </button>
                </div>
            </div>
        </c:forEach>
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
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="<%=path%>/fileupload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="<%=path%>/fileupload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="<%=path%>/fileupload/js/jquery.fileupload.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>



<script>
    function onNext()
    {
        location.href = '<%=path%>/trip/show/${tripid}';
    }

    function onEditPlace()
    {
        location.href = '<%=path%>/showPlace';
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
                    var content = '<div class="col-md-2">'
                            + '<div class="thumbnail" style="text-align: center;width: 200px;height: 220px;">'
                            +  '<img style="margin-left: 5px;margin-top: 5px; width: 180px;height: 180px;" src="<%=path%>'+file.url+'" alt="">'
                            + '<button type="button" class="btn btn-primary btn-xs" style="margin-top: 3px;" onclick="">删除 </button>'
                            + '</div>'
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
