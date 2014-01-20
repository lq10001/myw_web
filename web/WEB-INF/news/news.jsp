<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/news/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="news.id" name="news.id" value="${news.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>标题</label>
				<input name="news.title"  type="text" size="30" value="${news.title}" alt=""/>
			</p>

									
			<p>
				<label>作者</label>
				<input name="news.userid"  type="text" size="30" value="${news.userid}" alt=""/>
			</p>

									
			<p>
				<label>添加日期</label>
				<input name="news.adddate"  type="text" size="30" value="${news.adddate}" alt=""/>
			</p>

									
			<p>
				<label>内容</label>
				<input name="news.content"  type="text" size="30" value="${news.content}" alt=""/>
			</p>

									
			<p>
				<label>状态</label>
				<input name="news.state"  type="text" size="30" value="${news.state}" alt=""/>
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