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
	<h3>[ ${vo.name } ]고객 정보</h3>
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${vo.birth }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${vo.tel }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${vo.addr }</td>
		</tr>
	</table>
	<div class='btnSet'>
		<a class='btn-fill' href="list.cu">고객 목록</a>
		<a class='btn-fill' href="new.cu">신규 고객</a>
		<a class='btn-fill' href="#" onclick="memberModify()">회원정보 수정</a>
		<a class='btn-fill' onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.cu?id=${vo.id }' }" >삭제</a>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>

<script>
function memberModify() {
    window.location.href = "memberModify"; // 페이지 이동
}
</script>