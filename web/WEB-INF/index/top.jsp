
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">募游网</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <c:forEach var="menu" items="${webmenu_list}">
                        <li  <c:if test='${menu.name eq selmenu}'> class="active" </c:if>><a href="<%=path%>${menu.url}">${menu.cnname}</a></li>
                    </c:forEach>

                </ul>

                <form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input type="text" placeholder="搜索" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-success">注册</button>
                    <button type="submit" class="btn btn-success">登录</button>
                </form>
            </div><!-- /.nav-collapse -->

        </div><!-- /.container -->
    </div><!-- /.navbar -->

