<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="findIdPassword" /></h3>
<form action="${pageContext.request.contextPath}/findUser" method="post">
	<table class="w-pct60">
		<tr>
		    <th><fmt:message key="email" /></th>
		    <td>
		        <input type="email" id="email" name="email" >
		        <input type="submit" value="Find">
		        <div class="valid"><fmt:message key="enterEmail" /></div>
		    </td>
		</tr>
	</table>
</form>
</fmt:bundle>
</body>
</html>