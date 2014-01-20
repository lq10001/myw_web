<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/link">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="20" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/link" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
														
				<td>名称：<input type="text"  id="name" name="name" value="${link.name}"/></td>
																		
				<td>联系人：<input type="text"  id="contact" name="contact" value="${link.contact}"/></td>
											
				<td>联系电话：<input type="text"  id="phone" name="phone" value="${link.phone}"/></td>
																											
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
			<l1><a class="add" href="<%=path %>/link/edit" target="dialog" rel="dlg_form" mask="true" title="添加友情连接" width="400" height="460"><span>添加</span></a></l1>
			<li><a class="delete" href="<%=path %>/link/del/{sid_link}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <l1><a class="edit" href="<%=path %>/link/edit/{sid_link}" target="dialog" rel="dlg_form" mask="true" title="修改友情连接" width="320" height="480"><span>修改</span></a></l1>
		
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
						
				<th>编号</th>
									
				<th>名称</th>
									
				<th>url</th>
									
				<th>联系人</th>
									
				<th>联系电话</th>
									
				<th>email</th>
									
				<th>图片</th>
										
			</tr>
		</thead>
		<tbody>
			<c:forEach var="link" items="${page.list}">
				<tr target="sid_link" rel="${link.id}">
						
				<td>
					 ${link.id} 
				</td>
									
				<td>
					 ${link.name} 
				</td>
									
				<td>
					 ${link.url} 
				</td>
									
				<td>
					 ${link.contact} 
				</td>
									
				<td>
					 ${link.phone} 
				</td>
									
				<td>
					 ${link.email} 
				</td>
									
				<td>
					 ${link.imageurl} 
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