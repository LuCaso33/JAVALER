<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list JSP</title>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3>유지보수 신청</h3>
	<!-- CSS 파일을 변경 후에 바로 Refresh가 안된다면 common.css 파일로 들어가서 바로 Refresh 해주면 적용 된다. -->
	<table class='w-pct60'>
		<tr>
			<th class='w-px60'>번호</th>
			<th class='w-px200'>작성자</th>
			<th>상품내용</th>
		</tr>
		<!-- for(꺼낸 배열 변수를 담을 새로운 변수 (String x) : 배열 변수(list)) -->
		<!-- items : 배열 변수 -->
		<!-- var : 꺼낸 배열 변수를 담을 새로운 변수 -->
		<core:if test="${login_info.admin eq 'Y' }">
		<core:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td><a href='detail.cu?id=${vo.id}'>${vo.writer }</a></td>
				<td>${vo.product }</td>
			</tr>
		</core:forEach>
		</core:if>
	</table>
	
	<div class="btnSet">
		<core:if test="${!empty login_info }">
			<a class='btn-fill' href="new.cu">신청하기</a>
		</core:if>
		<core:if test="${!empty login_info }">
			<a class='btn-fill' href="order.cu">신청하기(가제_)</a>
		</core:if>			
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>