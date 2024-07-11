<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna new jsp</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="maintenanceRequest" /></h3>

<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form action="insert.qna" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160"><fmt:message key="title" /></th>
			<td><fmt:message key="enterRequiredInfo" /></td>
		</tr>
		<tr>
			<th><fmt:message key="applicant" /></th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th><fmt:message key="product" /></th>
		<td>
		<%
		    String[] options = {"Basic", "Standard", "Premium"};
		    for (int i = 0; i < options.length; i++) {
		        String service = options[i];
		        out.println("<input type='radio' id='radio" + (i+1) + "' name='sortation' value='" + service + "'>");
		        out.println("<label for='radio" + (i+1) + "'>" + service + "</label>");
		    }
		%>
		</td>
		</tr>
		<tr>
			<th><fmt:message key="usagePeriod" /></th>
				<td>
					<select name="period" id="period">
		            <option value="1Month">1Month</option>
		            <option value="3Months">3Months</option>
		            <option value="6Months">6Months</option>
		            <option value="12Months">12Months</option>
        			</select>
				</td>
		</tr>
		<tr>
		    <th><fmt:message key="applyWebHostingService" /></th>
		    <td>
		        <input type='checkbox' id='webHostingCheckbox' name='application' value='Submit' onchange="toggleInputs()">
		        <label for='webHostingCheckbox'><fmt:message key="application" /></label>
		    </td>
		</tr>
		<tr>
		    <th><fmt:message key="hostingType" /></th>
		    <td>
		        <%
		            String[] hostingOptions = {"Window", "Linux", "Other"};
		            for (int i = 0; i < hostingOptions.length; i++) {
		                String hostingType = hostingOptions[i];
		                out.println("<input type='radio' id='hostingRadio" + (i+1) + "' name='hostingType' value='" + hostingType + "' disabled>");
		                out.println("<label for='hostingRadio" + (i+1) + "'>" + hostingType + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th><fmt:message key="serverSize" /></th>
		    <td>
		        <%
		            String[] serverSizeOptions = {"Large", "Medium", "Small"};
		            for (int i = 0; i < serverSizeOptions.length; i++) {
		                String serverSize = serverSizeOptions[i];
		                out.println("<input type='radio' id='serverRadio" + (i+1) + "' name='serverSize' value='" + serverSize + "' disabled>");
		                out.println("<label for='serverRadio" + (i+1) + "'>" + serverSize + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th><fmt:message key="additionalWebStorage" /></th>
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
	<a class="btn-fill" href="confirm.cu"><fmt:message key="save" /></a>
	<a class="btn-empty" href="list.qna"><fmt:message key="cancel" /></a>
</div>
</fmt:bundle>
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