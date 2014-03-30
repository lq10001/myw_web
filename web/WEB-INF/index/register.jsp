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

    <link type="text/css" rel="stylesheet" href="<%=path%>/css/bootstrap.min.css"  >
    <script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>

    <link href="<%=path%>/css/carousel.css" rel="stylesheet">


    <script type="text/javascript">
    $(function(){

        $("#form1").validation();

        // 要从后台数据确定填的邮箱是不是已注册过了，采用回调方法
        // $("form").validation(function(obj,params){
        //   if (obj.id=='mail'){
        //     $.post("/verifymail",{mail :$(obj).val()},function(data){
        //       params.err = !data.success;
        //       params.msg = data.msg;
        //     });
        //   }}
        //   ,{reqmark:true} //这个参数是设必填不要显示有星号，默认是有星号的
        // );


        //.注册
        $("#submit1").on('click',function(event){
            // 2.最后要调用 valid()方法。
            if ($("#form1").valid()==false){
                $("#error-text").text("填写信息不完整。")
                return false;
            }
            if($("#pw1").val() != $("#pw2").val())
            {
                $("#error-text").text("请输入相同的密码。")
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

                    <h3>用户注册</h3>
                    <hr/>

                    <form class="form-horizontal"  id="form1" action="<%=path%>/user/register" role="form">
                        <div class="form-group">
                            <label for="mail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="mail" name="user.email" placeholder="xxxx@qq.com" check-type="mail required">
                            </div>
                            <div class="col-sm-offset-2 col-sm-10">
                                <span class="help-block" style="color: #000000;padding-top: 10px;">请填写真实的邮箱，在注册之前会将验证码发送到你的邮箱内.</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">电话号码</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="phone" name="user.phone" check-type="required number" minlength="6">
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="name" name="user.name" check-type="required" required-message="请填写你的大名。">
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="pw1" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pw1" name="user.password" check-type="required" minlength="6">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="pw2" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pw2" check-type="required" minlength="6">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="row">
                                    <div class="col-md-2">
                                        <button type="submit" id="submit1" class="btn btn-primary ">注册</button>

                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" id="loginBtn"  class="btn btn-default ">登陆</button>

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
        </div>


        <div class="col-md-6">
            <img src="<%=path%>/img/23.jpg" alt="First slide">
        </div>


    </div>
</div>

    <script src="<%=path%>/js/offcanvas.js"></script>

    <script>
        $(function(){
            $("#loginBtn").on('click',function(event){
                location.href='<%=path%>/login';
            });
        });
    </script>


</body>
</html>