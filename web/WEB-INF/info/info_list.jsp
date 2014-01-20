<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/info">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="20" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/info" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
														
				<td>作者：<input type="text"  id="author" name="author" value="${info.author}"/></td>
																											
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
			<l1><a class="add" href="<%=path %>/info/edit" target="dialog" rel="dlg_form" mask="true" title="添加信息" width="400" height="460"><span>添加</span></a></l1>
			<li><a class="delete" href="<%=path %>/info/del/{sid_info}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <l1><a class="edit" href="<%=path %>/info/edit/{sid_info}" target="dialog" rel="dlg_form" mask="true" title="修改信息" width="320" height="480"><span>修改</span></a></l1>
		
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
						
				<th>编号</th>
									
				<th>作者</th>
									
				<th>添加日期</th>
									
				<th>内容</th>
										
			</tr>
		</thead>
		<tbody>
			<c:forEach var="info" items="${page.list}">
				<tr target="sid_info" rel="${info.id}">
						
				<td>
					 ${info.id} 
				</td>
									
				<td>
					 ${info.author} 
				</td>
									
				<td>
					 ${info.adddate} 
				</td>
									
				<td>
					 ${info.content} 
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