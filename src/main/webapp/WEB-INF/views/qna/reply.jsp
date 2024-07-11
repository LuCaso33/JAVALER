<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna reply jsp</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="reply" /></h3>

<!--
파일 첨부 시 form 태그가 반드시 가져야 할 속성
method="post"
enctype="multipart/form-data"
  -->
<form action="reply_insert.qna" method="post" enctype="multipart/form-data">
	<input type="hidden" name="root" value="${vo.root }" />
	<input type="hidden" name="step" value="${vo.step }" />
	<input type="hidden" name="indent" value="${vo.indent }" />
	
	<table>
		<tr>
			<th class="w-px160"><fmt:message key="title" /></th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th><fmt:message key="writer" /></th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th><fmt:message key="content" /></th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th><fmt:message key="attachments" /></th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-left: 20px;"><i class="fas fa-times font-img"/></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick=" $('form').submit()"><fmt:message key="save" /></a>
	<a class="btn-empty" href="list.qna"><fmt:message key="cancel" /></a>
</div>

<!-- 실시간 갱신을 위해 getTime을 붙여준다 -->
<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</fmt:bundle>
</body>
</html>