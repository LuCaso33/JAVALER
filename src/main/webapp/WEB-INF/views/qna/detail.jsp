<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="projectInquiries" /></h3>
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
	<c:if test="${vo.sortation ne 'default' or vo.method ne 'default' or vo.cname ne 'default' or vo.budget ne 'default' or vo.limitDate ne 'default' or vo.url ne 'default'}">
    <tr>
        <th><fmt:message key="categoryProjects" /></th>
        <td colspan="5" class="left">${vo.sortation }</td>
    </tr>
    <tr>
        <th><fmt:message key="howToContact" /></th>
        <td colspan="5" class="left">${vo.method }</td>
    </tr>
    <tr>
        <th><fmt:message key="companyName" /></th>
        <td colspan="5" class="left">${vo.cname }</td>
    </tr>
    <tr>
        <th><fmt:message key="projectBudget" /></th>
        <td colspan="5" class="left">${vo.budget }</td>
    </tr>
    <tr>
        <th><fmt:message key="projectDueDate" /></th>
        <td colspan="5" class="left">${vo.limitDate }</td>
    </tr>
    <tr>
        <th><fmt:message key="projectInquiries" />referenceSites</th>
        <td colspan="5" class="left">${vo.url }</td>
    </tr>
	</c:if>
	<tr>
		<th><fmt:message key="content" /></th>
		<td colspan="5" class="left">${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th><fmt:message key="attachments" /></th>
		<td colspan="5" class="left">
			${vo.filename }
			<core:if test="${!empty vo.filename }">
				<a href="download.qna?id=${vo.id }" style="margin-left: 15px"><i class="fas fa-download font-img"></i></a>
			</core:if>
		</td>
	</tr>
</table>

<div class="btnSet">
	<core:choose>
    <core:when test="${sessionScope.category == 'myPost'}">
        <a class="btn-fill" href="myPost"><fmt:message key="goList" /></a>
    </core:when>
    <core:otherwise>
        <a class="btn-fill" href="list.qna"><fmt:message key="goList" /></a>
    </core:otherwise>
	</core:choose>
	<!-- 회원인 경우 수정, 관리자는 수정, 삭제 가능 -->
	<core:if test="${login_info.id eq vo.writer}"> 
		<a class="btn-fill" href="modify.qna?id=${vo.id }"><fmt:message key="modify" /></a>
	</core:if>
	<core:if test="${login_info.id eq vo.writer or login_info.admin eq 'Y' }"> 
		<a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')) { href='delete.qna?id=${vo.id }' }"><fmt:message key="delete" /></a>
	</core:if>
	<!-- 관리자의 경우 답글 쓰기 가능 -->
	<core:if test="${login_info.admin eq 'Y' }">
		<a class="btn-fill" href="reply.qna?id=${vo.id }"><fmt:message key="reply" /></a>
	</core:if>
</div>
</fmt:bundle>
</body>
</html>