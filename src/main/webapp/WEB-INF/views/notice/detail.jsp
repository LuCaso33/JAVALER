<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail JSP</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="maintenanceInquiries" /></h3>
<table>
	<tr>
		<th class="w-px160"><fmt:message key="title" /></th>
		<td colspan="5" class="left">${vo.title }</td>
	</tr>
	<tr>
		<th><fmt:message key="writer" /></th>
		<td>${vo.name }</td>
		<th class="w-px120"><fmt:message key="postDate" /></th>
		<td class="w-px120">${vo.writedate }</td>
		<th class="w-px80"><fmt:message key="views" /></th>
		<td class="w-px80">${vo.readcnt }</td>
	</tr>
	<tr>
		<th><fmt:message key="content" /></th>
		<td colspan="5" class="left">${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th><fmt:message key="attachments" /></th>
		<td colspan="5" class="left">
			${vo.filename }
			<core:if test="${!empty vo.filename }">
				<a href="download.no?id=${vo.id }" style='margin-left: 15px'><i class="fas fa-download font-img"></i></a>
			</core:if>
		</td>
	</tr>
</table>

<div class="btnSet">
	<!-- 마이게시글에서 접속한 경우에는 마이게시글 목록으로 이동 / 아니면 해당 게시판 목록으로 이동 -->
	<core:choose>
    <core:when test="${sessionScope.category == 'myPost'}">
        <a class="btn-fill" href="myPost"><fmt:message key="goList" /></a>
    </core:when>
    <core:otherwise>
        <a class="btn-fill" href="list.no?curPage=${page.curPage }&search=${page.search }&keyword=${page.keyword }"><fmt:message key="goList" /></a>
    </core:otherwise>
	</core:choose>
	<!-- 관리자인 경우 수정/삭제 가능 -->
	<core:if test="${login_info.id eq vo.writer }">
		<a class="btn-fill" href='modify.no?id=${vo.id }'><fmt:message key="modify" /></a>
	</core:if>
	<core:if test="${login_info.id eq vo.writer or login_info.admin eq 'Y' }"> 
		<a class="btn-fill" onclick="if(confirm('本当に削除しますか？')) {href='delete.no?id=${vo.id }' }"><fmt:message key="delete" /></a>
	</core:if>
	<!-- 관리자인 경우 답글 쓰기 가능 -->
	<core:if test="${login_info.admin eq 'Y' }">
		<a class="btn-fill" href="reply.no?id=${vo.id }"><fmt:message key="reply" /></a>
	</core:if>
</div>
</fmt:bundle>
</body>
</html>