<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join JSP</title>
<style type="text/css">
table tr td {
	text-align: left;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>	
<body>
<h3>회원 탈퇴</h3>
<form action="${pageContext.request.contextPath}/memberDelete" method="post">
	<table class="w-pct60">
		<tr>
		    <th>ID/PW</th>
		    <td>
		        <input type="text" id="id" name="id" >
		        <input type="password" id="pw" name="pw" >
		        <input type="submit" value="탈퇴">
		        <div class="valid">아이디와 비밀번호를 입력하세요.</div>
		    </td>
		</tr>
	</table>
</form>
</body>
</html>