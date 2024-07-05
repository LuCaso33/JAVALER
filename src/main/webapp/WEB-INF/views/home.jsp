<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<html>
<head>
<title>Home</title>
</head>
<body>
<core:if test="${not empty alertMessage}">
    <script type="text/javascript">
        alert("${alertMessage}");
    </script>
</core:if>
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
<!-- <div id="content"> -->
	<img src="img/banner.png" style="width: 80%" />
<!-- </div> -->
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>
