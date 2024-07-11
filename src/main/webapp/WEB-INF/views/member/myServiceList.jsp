<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3><fmt:message key="maintenanceRequest" /></h3>
	<!-- CSS 파일을 변경 후에 바로 Refresh가 안된다면 common.css 파일로 들어가서 바로 Refresh 해주면 적용 된다. -->
	<table class='w-pct60'>
		<tr>
			<th class='w-px200'><fmt:message key="writer" /></th>
			<th><fmt:message key="productDetails" /></th>
		</tr>
		<!-- for(꺼낸 배열 변수를 담을 새로운 변수 (String x) : 배열 변수(list)) -->
		<!-- items : 배열 변수 -->
		<!-- var : 꺼낸 배열 변수를 담을 새로운 변수 -->
		<core:if test="${!empty login_info }">
    <core:forEach items="${list }" var="vo">
        <core:if test="${vo.writer == login_info.id}">
            <tr>
                <td><a href='detail.cu?id=${vo.id}'>${vo.writer }</a></td>
                <td>${vo.product }</td>
            </tr>
        </core:if>
    </core:forEach>
</core:if>

	</table>
	
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</fmt:bundle>
</body>
</html>