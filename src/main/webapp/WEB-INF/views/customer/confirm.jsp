<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title><fmt:message key="applicationCompleted" /></title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<div class="container py-4">	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key="applicationCompleted" /></h1>
        <p class="col-md-8 fs-4"><fmt:message key="adminWillContact" /></p>      
      </div>
    </div>
  	
	  <div class="row align-items-md-stretch ">
		<h2 class="alert alert-primary"><fmt:message key="thankYouForApplying" /></h2>
	</div>
	<div class="container">
		<p><a href="/" class="btn btn-secondary"> &laquo;<fmt:message key="returnToMain" /></a>
	</div> 
  </div>
</fmt:bundle>
</body>
</html>