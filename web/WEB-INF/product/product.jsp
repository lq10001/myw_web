<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/product/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="product.id" name="product.id" value="${product.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>名称</label>
				<input name="product.name"  type="text" size="30" value="${product.name}" alt=""/>
			</p>

									
			<p>
				<label>产品小图</label>
				<input name="product.smallimage"  type="text" size="30" value="${product.smallimage}" alt=""/>
			</p>

									
			<p>
				<label>产品大图</label>
				<input name="product.maximage"  type="text" size="30" value="${product.maximage}" alt=""/>
			</p>

									
			<p>
				<label>描述</label>
				<input name="product.descript"  type="text" size="30" value="${product.descript}" alt=""/>
			</p>

									
			<p>
				<label>资料地址</label>
				<input name="product.dataurl"  type="text" size="30" value="${product.dataurl}" alt=""/>
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