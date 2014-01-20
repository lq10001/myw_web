<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/job">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="20" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/job" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
														
				<td>标题：<input type="text"  id="title" name="title" value="${job.title}"/></td>
											
				<td>作者：<input type="text"  id="author" name="author" value="${job.author}"/></td>
																																																							
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
			<l1><a class="add" href="<%=path %>/job/edit" target="dialog" rel="dlg_form" mask="true" title="添加工作" width="400" height="460"><span>添加</span></a></l1>
			<li><a class="delete" href="<%=path %>/job/del/{sid_job}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <l1><a class="edit" href="<%=path %>/job/edit/{sid_job}" target="dialog" rel="dlg_form" mask="true" title="修改工作" width="320" height="480"><span>修改</span></a></l1>
		
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
						
				<th>编号</th>
									
				<th>标题</th>
									
				<th>作者</th>
									
				<th>添加日期</th>
									
				<th>结束时间</th>
									
				<th>email</th>
									
				<th>内容</th>
									
				<th>状态</th>
									
				<th>数量</th>
										
			</tr>
		</thead>
		<tbody>
			<c:forEach var="job" items="${page.list}">
				<tr target="sid_job" rel="${job.id}">
						
				<td>
					 ${job.id} 
				</td>
									
				<td>
					 ${job.title} 
				</td>
									
				<td>
					 ${job.author} 
				</td>
									
				<td>
					 ${job.adddate} 
				</td>
									
				<td>
					 ${job.enddate} 
				</td>
									
				<td>
					 ${job.email} 
				</td>
									
				<td>
					 ${job.content} 
				</td>
									
				<td>
					 ${job.state} 
				</td>
									
				<td>
					 ${job.number} 
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