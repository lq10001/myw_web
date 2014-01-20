<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/info/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="info.id" name="info.id" value="${info.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>作者</label>
				<input name="info.author"  type="text" size="30" value="${info.author}" alt=""/>
			</p>

									
			<p>
				<label>添加日期</label>
				<input name="info.adddate"  type="text" size="30" value="${info.adddate}" alt=""/>
			</p>

									
			<p>
				<label>内容</label>
				<input name="info.content"  type="text" size="30" value="${info.content}" alt=""/>
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