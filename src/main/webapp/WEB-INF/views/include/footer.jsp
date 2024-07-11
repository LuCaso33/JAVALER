<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<footer style='font-size:14px; border-top:1px solid #ccc; padding:15px 0'>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
	<div><fmt:message key="companyName" /> : <fmt:message key="corporation" /> JAVALLAR</div>
	<div><fmt:message key="contact" /> : 010-1234-5678</div>
	<div>Copyright 2024</div>
</fmt:bundle>
</footer>