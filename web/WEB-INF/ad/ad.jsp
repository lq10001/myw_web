<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/ad/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="ad.id" name="ad.id" value="${ad.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>名称</label>
				<input name="ad.name"  type="text" size="30" value="${ad.name}" alt=""/>
			</p>

									
			<p>
				<label>广告图片</label>
				<input name="ad.imageurl"  type="text" size="30" value="${ad.imageurl}" alt=""/>
			</p>

									
			<p>
				<label>联系人</label>
				<input name="ad.contact"  type="text" size="30" value="${ad.contact}" alt=""/>
			</p>

									
			<p>
				<label>联系电话</label>
				<input name="ad.phone"  type="text" size="30" value="${ad.phone}" alt=""/>
			</p>

									
			<p>
				<label>email</label>
				<input name="ad.email"  type="text" size="30" value="${ad.email}" alt=""/>
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