<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>[ ${vo.name } ]고객 정보</h3>
<form action="memberUpdate" method="post">
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>이름</th>
			<td><input type="text" name="name" value="${vo.name }" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="text" name="gender" value="${vo.gender }" /></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth" value="${vo.birth }" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${vo.email }" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" value="${vo.tel }" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" value="${vo.addr }" /></td>
		</tr>
	</table>
</form>
	<div class='btnSet'>
		<a class="btn-fill" onclick="$('form').submit()">저장</a>
		<a class='btn-empty' href="#" onclick="memberInfo()">취소</a>
	</div>
</body>
</html>