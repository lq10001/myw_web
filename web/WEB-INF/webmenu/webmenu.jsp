<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/webmenu/save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input type="hidden" id="webmenu.id" name="webmenu.id" value="${webmenu.id}">

		<div class="pageFormContent" layoutH="56">


												
			<p>
				<label>名称</label>
				<input name="webmenu.name"  type="text" size="30" value="${webmenu.name}" alt=""/>
			</p>

									
			<p>
				<label>url</label>
				<input name="webmenu.url"  type="text" size="30" value="${webmenu.url}" alt=""/>
			</p>

									
			<p>
				<label>激活</label>
                <select name="webmenu.action" class="required combox">
                    <option value="0" selected>不激活</option>
                    <option value="1" >激活</option>
                </select>
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