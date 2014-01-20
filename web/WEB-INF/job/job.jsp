<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/job/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="job.id" name="job.id" value="${job.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>标题</label>
				<input name="job.title"  type="text" size="30" value="${job.title}" alt=""/>
			</p>

									
			<p>
				<label>作者</label>
				<input name="job.author"  type="text" size="30" value="${job.author}" alt=""/>
			</p>

									
			<p>
				<label>添加日期</label>
				<input name="job.adddate"  type="text" size="30" value="${job.adddate}" alt=""/>
			</p>

									
			<p>
				<label>结束时间</label>
				<input name="job.enddate"  type="text" size="30" value="${job.enddate}" alt=""/>
			</p>

									
			<p>
				<label>email</label>
				<input name="job.email"  type="text" size="30" value="${job.email}" alt=""/>
			</p>

									
			<p>
				<label>内容</label>
				<input name="job.content"  type="text" size="30" value="${job.content}" alt=""/>
			</p>

									
			<p>
				<label>状态</label>
				<input name="job.state"  type="text" size="30" value="${job.state}" alt=""/>
			</p>

									
			<p>
				<label>数量</label>
				<input name="job.number"  type="text" size="30" value="${job.number}" alt=""/>
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