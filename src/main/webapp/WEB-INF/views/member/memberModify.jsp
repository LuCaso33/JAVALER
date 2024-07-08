<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객 정보 수정</title>
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
<h3>[ ${vo.name } ]나의 정보</h3>
<form action="memberUpdate" method="post">
	<table class='w-pct60'>
		<tr>
			<th class='w-px160'>이름</th>
			<td><input type="text" name="name" value="${vo.name }" /></td>
		</tr>
		<tr>
			<th> 성별</th>
			<td>
				<label><input type="radio" name="gender" value="남" checked/>남</label>
				<label><input type="radio" name="gender" value="여" />여</label>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="birth" readonly />
				<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${vo.email }" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" /> - 
				<input type="text" name="tel" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<a class='btn-fill-s' onclick="daum_post()">우편번호 찾기</a>
				<input type="text" name="post"  class="w-px60" readonly />
				<input type="text" name="addr" readonly/>
				<input type="text" name="addr" />
			</td>
		</tr>
	</table>
</form>
<div class='btnSet'>
	<a class="btn-fill" onclick="$('form').submit()">저장</a>
	<a class='btn-empty' href="#" onclick="memberInfo()">취소</a>
</div>

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
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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