
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

            <form class="navbar-form navbar-right" method="post" id="searchForm" action="<%=path%>/search" role="form">

                <input  id="search" name="sname" type="text" class="form-control" placeholder="城市|景点" style="width:150px;">

                <button type="button"  class="btn btn-success" onclick="onSearch()">搜索</button>
                <button type="button" class="btn btn-success" onclick="onDown()">客户端下载</button>

                <c:choose>
                    <c:when test="${userid == null}">
                        <button type="button" class="btn btn-success" onclick="onRigister()">注册</button>
                        <button type="button" class="btn btn-success" onclick="onLogin()">登录</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-success" onclick="onLoginOut()">注销</button>
                    </c:otherwise>
                </c:choose>


            </form>
        </div><!-- /.nav-collapse -->

    </div><!-- /.container -->
</div>



    <script type="text/javascript">

        function onSearch()
        {
            $("#searchForm").submit();
        }

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
        function onLoginOut()
        {
            location.href='<%=path%>/loginOut';
        }
    </script>
