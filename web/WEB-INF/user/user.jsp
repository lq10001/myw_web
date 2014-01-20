<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/user/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="user.id" name="user.id" value="${user.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>名称</label>
				<input name="user.name"  type="text" size="30" value="${user.name}" alt=""/>
			</p>

									
			<p>
				<label>密码</label>
				<input name="user.password"  type="text" size="30" value="${user.password}" alt=""/>
			</p>

									
			<p>
				<label>邮箱</label>
				<input name="user.email"  type="text" size="30" value="${user.email}" alt=""/>
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