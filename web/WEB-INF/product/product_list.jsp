<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/product">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="20" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/product" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
														
				<td>名称：<input type="text"  id="name" name="name" value="${product.name}"/></td>
																																									
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
			<l1><a class="add" href="<%=path %>/product/edit" target="dialog" rel="dlg_form" mask="true" title="添加产品" width="400" height="460"><span>添加</span></a></l1>
			<li><a class="delete" href="<%=path %>/product/del/{sid_product}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <l1><a class="edit" href="<%=path %>/product/edit/{sid_product}" target="dialog" rel="dlg_form" mask="true" title="修改产品" width="400" height="460"><span>修改</span></a></l1>
		
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
						
				<th style="width:5%">编号</th>

                <th style="width:20%">名称</th>

                <th style="width:20%">产品小图</th>

                <th style="width:20%">产品大图</th>
									
				<th>描述</th>

                <th style="width:20%">资料地址</th>
										
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${page.list}">
				<tr target="sid_product" rel="${product.id}">
						
				<td>
					 ${product.id} 
				</td>
									
				<td>
					 ${product.name} 
				</td>
									
				<td>
					 ${product.smallimage} 
				</td>
									
				<td>
					 ${product.maximage} 
				</td>
									
				<td>
					 ${product.descript}
				</td>
									
				<td>
					 ${product.dataurl} 
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