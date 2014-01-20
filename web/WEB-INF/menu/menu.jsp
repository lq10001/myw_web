<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/menu/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="menu.id" name="menu.id" value="${menu.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>父编号</label>
				<input name="menu.pid"  type="text" size="30" value="${menu.pid}" alt=""/>
			</p>

									
			<p>
				<label>父菜单名</label>
				<input name="menu.pname"  type="text" size="30" value="${menu.pname}" alt=""/>
			</p>

									
			<p>
				<label>名称</label>
				<input name="menu.name"  type="text" size="30" value="${menu.name}" alt=""/>
			</p>

									
			<p>
				<label>URL</label>
				<input name="menu.url"  type="text" size="30" value="${menu.url}" alt=""/>
			</p>

									
			<p>
				<label>状态</label>
				<input name="menu.state"  type="text" size="30" value="${menu.state}" alt=""/>
			</p>

						
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>