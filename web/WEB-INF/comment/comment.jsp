<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/comment/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="comment.id" name="comment.id" value="${comment.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>用户id</label>
				<input name="comment.userid"  type="text" size="30" value="${comment.userid}" alt=""/>
			</p>

									
			<p>
				<label>内容</label>
				<input name="comment.content"  type="text" size="30" value="${comment.content}" alt=""/>
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