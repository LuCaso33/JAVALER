<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new JSP</title>

</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3>유지보수 서비스 신청</h3>
	<form action="insert.cu" method="post">
			<table>
		<tr>
			<th class="w-px160">제목</th>
			<td>서비스 신청에 필요한 정보를 입력해주세요</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th>상품</th>
		<td>
		<%
		    String[] options = {"베이직", "스탠다드", "프리미엄"};
		    for (int i = 0; i < options.length; i++) {
		        String product = options[i];
		        out.println("<input type='radio' id='radio" + (i+1) + "' name='product' value='" + product + "'>");
		        out.println("<label for='radio" + (i+1) + "'>" + product + "</label>");
		    }
		%>
		</td>
		</tr>
		<tr>
			<th>이용 기간</th>
				<td>
					<select name="usagePeriod" id="period">
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
                    <input type="checkbox" id="webHostingCheckbox" name="webHosting" value="YES" onchange="toggleInputs()">
                    <label for="webHostingCheckbox">신청</label>
                    <!-- hidden input to send 'NO' if checkbox is unchecked -->
                    <input type="hidden" id="webHostingHidden" name="webHosting" value="NO">
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
		                String serverScale = serverSizeOptions[i];
		                out.println("<input type='radio' id='serverRadio" + (i+1) + "' name='serverScale' value='" + serverScale + "' disabled>");
		                out.println("<label for='serverRadio" + (i+1) + "'>" + serverScale + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th>웹용량 추가(1GB당 2만원)</th>
		    <td>
		        <select name="webStorage" id="additionalCapacity" disabled>
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
		<a class="btn-fill" onclick="$('form').submit()">저장</a>
		<a class="btn-empty" href="list.cu">취소</a>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script>
function toggleInputs() {
    var checkbox = document.getElementById('webHostingCheckbox');
    var hiddenInput = document.getElementById('webHostingHidden');
    var hostingRadios = document.getElementsByName('hostingType');
    var serverRadios = document.getElementsByName('serverScale');
    var selectBox = document.getElementById('additionalCapacity');

    if (checkbox.checked) {
        hiddenInput.value = "YES";

        for (var i = 0; i < hostingRadios.length; i++) {
            hostingRadios[i].disabled = false;
        }

        for (var j = 0; j < serverRadios.length; j++) {
            serverRadios[j].disabled = false;
        }

        selectBox.disabled = false;
    } else {
        hiddenInput.value = "NO";

        for (var i = 0; i < hostingRadios.length; i++) {
            hostingRadios[i].disabled = true;
        }

        for (var j = 0; j < serverRadios.length; j++) {
            serverRadios[j].disabled = true;
        }

        selectBox.disabled = true;
    }
}

</script>
</body>
</html>