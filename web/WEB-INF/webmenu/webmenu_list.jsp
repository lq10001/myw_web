<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/webmenu">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="20" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/webmenu" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
														
				<td>名称：<input type="text"  id="name" name="name" value="${webmenu.name}"/></td>
																											
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
		<div class="subBar">
		</div>
		
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<l1><a class="add" href="<%=path %>/webmenu/edit" target="dialog" rel="dlg_form" mask="true" title="添加web菜单" width="400" height="460"><span>添加</span></a></l1>
			<li><a class="delete" href="<%=path %>/webmenu/del/{sid_webmenu}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <l1><a class="edit" href="<%=path %>/webmenu/edit/{sid_webmenu}" target="dialog" rel="dlg_form" mask="true" title="修改web菜单" width="320" height="480"><span>修改</span></a></l1>
		
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
						
				<th>编号</th>
									
				<th>名称</th>
									
				<th>url</th>
									
				<th>激活</th>
										
			</tr>
		</thead>
		<tbody>
			<c:forEach var="webmenu" items="${page.list}">
				<tr target="sid_webmenu" rel="${webmenu.id}">
						
				<td>
					 ${webmenu.id} 
				</td>
									
				<td>
					 ${webmenu.name} 
				</td>
									
				<td>
					 ${webmenu.url} 
				</td>
									
				<td>
					 ${webmenu.action} 
				</td>
														
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>
			<span>条，共${page.totalRow}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${page.totalPage}" numPerPage="${page.pageSize}" pageNumShown="5" currentPage="${page.pageNumber}"></div>

	</div>
</div>