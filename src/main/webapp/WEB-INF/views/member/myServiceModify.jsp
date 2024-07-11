<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail JSP</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<h3>[ ${vo.writer } ]<fmt:message key="applicationInfo" /></h3>
	<form action="serviceUpdate" method="post">
	<table class='w-pct60'>
<tr>
			<th><fmt:message key="product" /></th>
		<td>
		<%
		    String[] options = {"Basic", "Standard", "Premium"};
		    for (int i = 0; i < options.length; i++) {
		        String product = options[i];
		        out.println("<input type='radio' id='radio" + (i+1) + "' name='product' value='" + product + "'>");
		        out.println("<label for='radio" + (i+1) + "'>" + product + "</label>");
		    }
		%>
		</td>
		</tr>
		<tr>
			<th><fmt:message key="usagePeriod" /></th>
				<td>
					<select name="usagePeriod" id="period">
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
                    <input type="checkbox" id="webHostingCheckbox" name="webHosting" value="YES" onchange="toggleInputs()">
                    <label for="webHostingCheckbox"><fmt:message key="application" /></label>
                    <!-- hidden input to send 'NO' if checkbox is unchecked -->
                    <input type="hidden" id="webHostingHidden" name="webHosting" value="NO">
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
		                String serverScale = serverSizeOptions[i];
		                out.println("<input type='radio' id='serverRadio" + (i+1) + "' name='serverScale' value='" + serverScale + "' disabled>");
		                out.println("<label for='serverRadio" + (i+1) + "'>" + serverScale + "</label>");
		            }
		        %>
		    </td>
		</tr>
		<tr>
		    <th><fmt:message key="additionalWebStorage" /></th>
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
	<div class='btnSet'>
		<a class="btn-fill" onclick="$('form').submit()"><fmt:message key="save" /></a>
		<a class='btn-empty' href="#" onclick="myService()"><fmt:message key="cancel" /></a>
	</div>
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</fmt:bundle>
</body>
</html>