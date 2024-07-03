<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail JSP</title>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3>[ ${vo.writer } ]신청 정보</h3>
	<table class='w-pct60'>
		<tr>
			<th>상품 내용</th>
			<td>${vo.product }</td>
		</tr>
		<tr>
			<th class='w-px160'>기간</th>
			<td>${vo.usagePeriod }</td>
		</tr>
		<tr>
			<th>호스팅 타입</th>
			<td>${vo.hostingType }</td>
		</tr>
		<tr>
			<th>서버규모</th>
			<td>${vo.serverScale }</td>
		</tr>
		<tr>
			<th>추가저장공간</th>
			<td>${vo.webStorage }</td>
		</tr>
	</table>
		<div class='btnSet'>
		<a class='btn-fill' href="#" onclick="myServiceModify()">신청 정보 수정</a>
		<a class='btn-fill' onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.cu?id=${vo.id }' }" >삭제</a>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>

<script>
function myServiceModify() {
    window.location.href = "myServiceModify"; // 페이지 이동
}
</script>