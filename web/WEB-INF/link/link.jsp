<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/link/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="link.id" name="link.id" value="${link.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>名称</label>
				<input name="link.name"  type="text" size="30" value="${link.name}" alt=""/>
			</p>

									
			<p>
				<label>url</label>
				<input name="link.url"  type="text" size="30" value="${link.url}" alt=""/>
			</p>

									
			<p>
				<label>联系人</label>
				<input name="link.contact"  type="text" size="30" value="${link.contact}" alt=""/>
			</p>

									
			<p>
				<label>联系电话</label>
				<input name="link.phone"  type="text" size="30" value="${link.phone}" alt=""/>
			</p>

									
			<p>
				<label>email</label>
				<input name="link.email"  type="text" size="30" value="${link.email}" alt=""/>
			</p>

									
			<p>
				<label>图片</label>
				<input name="link.imageurl"  type="text" size="30" value="${link.imageurl}" alt=""/>
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