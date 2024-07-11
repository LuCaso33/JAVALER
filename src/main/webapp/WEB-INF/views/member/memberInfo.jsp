<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h3>[ ${vo.name } ]<fmt:message key="customerInfo" /></h3>
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'><fmt:message key="name" /></th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th><fmt:message key="gender" /></th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th><fmt:message key="birthDate" /></th>
			<td>${vo.birth }</td>
		</tr>
		<tr>
			<th><fmt:message key="email" /></th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th><fmt:message key="phoneNumber" /></th>
			<td>${vo.tel }</td>
		</tr>
		<tr>
			<th><fmt:message key="address" /></th>
			<td>${vo.addr }</td>
		</tr>
	</table>
	<div class='btnSet'>
		<a class='btn-fill' href="#" onclick="memberModify()"><fmt:message key="editMemberInfo" /></a>
		<a class='btn-fill' onclick="if( confirm('本当に削除しますか?') ){ href='delete.cu?id=${vo.id }' }" ><fmt:message key="delete" /></a>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</fmt:bundle>
</body>
</html>

<script>
function memberModify() {
    window.location.href = "memberModify"; // 페이지 이동
}
</script>