
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=path%>/">募游网</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">

                <c:forEach var="menu" items="${webmenu_list}">
                    <li  <c:if test='${menu.name eq selmenu}'> class="active" </c:if>><a href="<%=path%>${menu.url}">${menu.cnname}</a></li>
                </c:forEach>

            </ul>

            <form class="navbar-form navbar-right">

                <button type="button" class="btn btn-success" onclick="onRigister()">搜索</button>
                <button type="button" class="btn btn-success" onclick="onDown()">客户端下载</button>

                <button type="button" class="btn btn-success" onclick="onRigister()">注册</button>
                <button type="button" class="btn btn-success" onclick="onLogin()">登录</button>
            </form>
        </div><!-- /.nav-collapse -->

    </div><!-- /.container -->
</div>



    <script type="text/javascript">



        function onDown()
        {
            location.href = '<%=path%>/down';
        }

        function onLogin()
        {
            location.href='<%=path%>/login';
        }

        function onRigister()
        {
            location.href='<%=path%>/register';
        }
    </script>
