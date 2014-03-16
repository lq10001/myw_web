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

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>

    <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="12341234" data-redirecturi="http://115.28.2.33/myw" charset="utf-8" ></script>


    <link href="<%=path%>/css/carousel.css" rel="stylesheet">




    <script type="text/javascript">
        $(function(){

            $("#form1").validation();

            //.注册
            $("#submit1").on('click',function(event){
                // 2.最后要调用 valid()方法。
                if ($("#form1").valid()==false){
                    $("#error-text").text("填写信息不完整。")
                    return false;
                }
            })
        })
    </script>

</head>

<body>

<jsp:include page="top.jsp"></jsp:include>

<div class="container" style="margin-top: 20;">
    <div class="row">
        <div class="col-md-6">

            <div class="row">
                <div class="col-md-12">

                    <h3>用户登陆</h3>
                    <hr/>

                    <form class="form-horizontal"  id="form1" action="<%=path%>/user/login" role="form">
                        <div class="form-group">
                            <label for="mail" class="col-sm-3 control-label">邮箱或号码</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="mail" name="user.email" placeholder="邮箱或电话号码" check-type="required">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="pw1" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pw1" name="user.password" check-type="required" minlength="6">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">

                                <div class="checkbox">
                                    <label><input type="checkbox"> 自动登陆</label>
                                    &nbsp;&nbsp; <label class="right">忘记密码</label>
                                </div>
                                </div>
                         </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="row">
                                    <div class="col-md-2">
                                        <button type="submit" id="submit1" class="btn btn-primary ">登陆</button>

                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" id="registerBtn"  class="btn btn-default ">注册</button>

                                    </div>

                                    <div class="col-md-8"></div>


                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <span id="error-text" style="color: #FF0000;"></span>
                            </div>
                        </div>
                    </form>
                </div>

            </div>

            <!-- other Login -->
            <hr/>
            <div class="row">
                <div class="col-md-12">
                    <span id="qqLoginBtn" ></span>


                </div>



            </div>

        </div>


        <div class="col-md-6">
            <img src="<%=path%>/img/23.jpg" alt="First slide">
        </div>


    </div>
</div>

<script src="<%=path%>/js/offcanvas.js"></script>

<script>

    QC.Login({
        btnId : "qqLoginBtn",//插入按钮的html标签id
        size : "A_XL",//按钮尺寸
        scope : "get_user_info",//展示授权，全部可用授权可填 all
        display : "pc"//应用场景，可选
    });

    $(function(){
        $("#rigisterBtn").on('click',function(event){
            location.href='<%=path%>/login';
        });
    });
</script>


</body>
</html>