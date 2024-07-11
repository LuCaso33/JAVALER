<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><fmt:message key="editCustomerInfo" /></title>
<style type="text/css">
table tr td {
	text-align: left;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
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
<h3>[ ${vo.name } ]<fmt:message key="myInfo" /></h3>
<form action="memberUpdate" method="post">
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'><fmt:message key="name" /></th>
			<td><input type="text" name="name" value="${vo.name }" /></td>
		</tr>
		<tr>
			<th> <fmt:message key="gender" /></th>
			<td>
				<label><input type="radio" name="gender" value="male" checked/><fmt:message key="male" /></label>
				<label><input type="radio" name="gender" value="female" /><fmt:message key="female" /></label>
			</td>
		</tr>
		<tr>
			<th><fmt:message key="birthDate" /></th>
			<td>
				<input type="text" name="birth" readonly />
				<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
		<tr>
			<th><fmt:message key="email" /></th>
			<td><input type="text" name="email" value="${vo.email }" /></td>
		</tr>
		<tr>
			<th><fmt:message key="phoneNumber" /></th>
			<td>
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" />
			</td>
		</tr>
		<tr>
			<th><fmt:message key="address" /></th>
			<td>
				<a class='btn-fill-s' onclick="daum_post()"><fmt:message key="findPostalCode" /></a>
				<input type="text" name="post"  class="w-px60" readonly />
				<input type="text" name="addr" readonly/>
				<input type="text" name="addr" />
			</td>
		</tr>
	</table>
</form>
<div class='btnSet'>
	<a class="btn-fill" onclick="$('form').submit()"><fmt:message key="save" /></a>
	<a class='btn-empty' href="#" onclick="memberInfo()"><fmt:message key="cancel" /></a>
</div>
</fmt:bundle>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	var today = new Date();
	var endDay = new Date(today.getFullYear(), today.getMonth(), today.getDate());

	$('[name=birth]').datepicker({
		dateFormat: 'yy-mm-dd',
		changeYear: true,
		changeMonth: true,
		showMonthAfterYear: true,
		dayNamesMin: ['日', '月', '火', '水', '木', '金', '土'],
		monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
		maxDate: endDay
	});

	$('[name=birth]').change(function() {
		$('#delete').css('display', 'inline-block');
	});

	$('#delete').click(function() {
		$('[name=birth]').val('');
		$('#delete').css('display', 'none');
	});
});

function daum_post() {
    new daum.Postcode({
        oncomplete: function(data) {
            $('[name=post]').val(data.zonecode);
            var address = data.userSelectedType == 'J' ? data.jibunAddress : data.roadAddress;
            if(data.buildingName != '') {
                address += ' (' + data.buildingName + ')';
            }
            $('[name=addr]').eq(0).val(address);
        }
    }).open();
}
</script>
</body>
</html>