<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna new jsp</title>
</head>
<body>
<h3>유지보수 서비스 신청</h3>

<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form action="insert.qna" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td>서비스 신청에 필요한 정보를 입력해주세요</td>
		</tr>
		<tr>
			<th>신청자</th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th>상품</th>
		<td>
		<%
		    String[] options = {"베이직", "스탠다드", "프리미엄"};
		    for (int i = 0; i < options.length; i++) {
		        String service = options[i];
		        out.println("<input type='radio' id='radio" + (i+1) + "' name='sortation' value='" + service + "'>");
		        out.println("<label for='radio" + (i+1) + "'>" + service + "</label>");
		    }
		%>
		</td>
		</tr>
		<tr>
			<th>이용 기간</th>
				<td>
					<select name="period" id="period">
		            <option value="1개월">1개월</option>
		            <option value="3개월">3개월</option>
		            <option value="6개월">6개월</option>
		            <option value="12개월">12개월</option>
        			</select>
				</td>
		</tr>
		<tr>
		    <th>웹호스팅 서비스 신청</th>
		    <td>
		        <input type='checkbox' id='webHostingCheckbox' name='application' value='신청' onchange="toggleInputs()">
		        <label for='webHostingCheckbox'>신청</label>
		    </td>
		</tr>
		<tr>
		    <th>호스팅 방식</th>
		    <td>
		        <%
		            String[] hostingOptions = {"윈도우", "리눅스", "기타"};
		            for (int i = 0; i < hostingOptions.length; i++) {
		                String hostingType = hostingOptions[i];
		                out.println("<input type='radio' id='hostingRadio" + (i+1) + "' name='hostingType' value='" + hostingType + "' disabled>");
		                out.println("<label for='hostingRadio" + (i+1) + "'>" + hostingType + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th>서버 규모</th>
		    <td>
		        <%
		            String[] serverSizeOptions = {"대", "중", "소"};
		            for (int i = 0; i < serverSizeOptions.length; i++) {
		                String serverSize = serverSizeOptions[i];
		                out.println("<input type='radio' id='serverRadio" + (i+1) + "' name='serverSize' value='" + serverSize + "' disabled>");
		                out.println("<label for='serverRadio" + (i+1) + "'>" + serverSize + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th>웹용량 추가(1GB당 2만원)</th>
		    <td>
		        <select name="additionalCapacity" id="additionalCapacity" disabled>
		            <option value="2GB">2GB</option>
		            <option value="4GB">4GB</option>
		            <option value="6GB">6GB</option>
		            <option value="8GB">8GB</option>
		        </select>
		    </td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" href="confirm.cu">저장</a>
	<a class="btn-empty" href="list.qna">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script>
    function toggleInputs() {
        var checkbox = document.getElementById('webHostingCheckbox');
        var hostingRadios = document.getElementsByName('hostingType');
        var serverRadios = document.getElementsByName('serverSize');
        var selectBox = document.getElementById('additionalCapacity');

        for (var i = 0; i < hostingRadios.length; i++) {
            hostingRadios[i].disabled = !checkbox.checked;
        }

        for (var j = 0; j < serverRadios.length; j++) {
            serverRadios[j].disabled = !checkbox.checked;
        }

        selectBox.disabled = !checkbox.checked;
    }
</script>
</body>
</html>