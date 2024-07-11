<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3>[ ${vo.writer } ]<fmt:message key="applicationInfo" /></h3>
	<table class='w-pct60'>
		<tr>
			<th><fmt:message key="productDetails" /></th>
			<td>${vo.product }</td>
		</tr>
		<tr>
			<th class='w-px160'><fmt:message key="period" /></th>
			<td>${vo.usagePeriod }</td>
		</tr>
		<tr>
			<th><fmt:message key="hostingType" /></th>
			<td>${vo.hostingType }</td>
		</tr>
		<tr>
			<th><fmt:message key="serverSize" /></th>
			<td>${vo.serverScale }</td>
		</tr>
		<tr>
			<th><fmt:message key="additionalStorage" /></th>
			<td>${vo.webStorage }</td>
		</tr>
	</table>
	<div class='btnSet'>
		<!-- <a class='btn-fill' href="list.cu">고객 목록</a>-->
		<core:if test="${login_info.admin eq 'Y'}">
        <a class='btn-fill' href="modify.cu?id=${vo.id}"><fmt:message key="modify" /></a>
        <a class='btn-fill' onclick="if(confirm('정말 삭제하시겠습니까?')) { window.location.href='delete.cu?id=${vo.id}' }"><fmt:message key="delete" /></a>
    </core:if>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</fmt:bundle>
</body>
</html>