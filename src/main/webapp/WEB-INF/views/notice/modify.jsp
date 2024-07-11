<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify JSP</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="maintenanceRequestModify" /></h3>
<!-- 
 - 파일 첨부 시 form 반드시 갖고 있어야 할 속성 
	1. 반드시 method는 post이어야만 한다.
	2. enctype을 지정한다. ▶ enctype='multipart/form-data'
-->
<form action="update.no" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id }"/>
	<input type="hidden" name="attach" />
	<table>
		<tr>
			<th class="w-px160"><fmt:message key="title" /></th>
			<td><input class="need" type="text" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<th><fmt:message key="content" /></th>
			<td><textarea class="need" name="content">${vo.content }</textarea></td>
		</tr>
		<tr>
			<th><fmt:message key="attachments" /></th>
			<td class="left">
				<label>
					<input id="attach-file" type="file" name="file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name">${vo.filename }</span>
				<span id="delete-file" style='display:${empty vo.filename ? "none" : "inline"}; color:red; margin-left:20px;'><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick=" { $('[name=attach]').val($('#file-name').text()); $('form').submit(); }"><fmt:message key="save" /></a>
	<a class="btn-empty" href="detail.no?id=${vo.id }"><fmt:message key="cancel" /></a>
	<!-- <a class="btn-empty" href="javascript:history.go(-1)">취소</a> -->
</div>

<!-- 실시간 갱신을 위해 getTime을 붙여준다 -->
<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</fmt:bundle>
</body>
</html>