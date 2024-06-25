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
<h3>ID/PW 찾기</h3>
<form action="${pageContext.request.contextPath}/findUser" method="post">
	<table class="w-pct60">
		<tr>
		    <th>이메일</th>
		    <td>
		        <input type="email" id="email" name="email" >
		        <input type="submit" value="Find">
		        <div class="valid">이메일을 입력하세요.</div>
		    </td>
		</tr>
	</table>
</form>
</body>
</html>