<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 스프링은 따로 라이브러리를 설치하지 않아도 다운 받을 라이브러리를 설정할 수 있다. -->
<!-- 그 중에 jstl 라이브러리도 있기 때문에 사용할 수 있는것 -->
<!-- 라이브러리 목록은 iot/pom.xml, c:\사용자\.m2에서 확인가능 -->

<link rel="stylesheet" type="text/css" href="css/common.css?v=<%=new java.util.Date().getTime() %>">
<!-- rel : 형태는 스타일 시트, 타입은 텍스트로된 css -->
<!-- 주소 뒤에 ?v=로 버전관리를 할 수 있다 -->
<!-- Date()가 임포트가 안될경우 패키지명을 직접 지정해도 된다. -->

<!-- 어느 페이지에 가도 인클루드 되어있는 헤더에 jQuery 선언문을 넣는다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
header ul, header ul li {
	margin: 0;
	padding: 0;
	display: inline;
}

header .category {
	font-size: 18px;
}

header .category ul li:not(:first-child) { /* 첫번째 li만 빼고 지정 */
	padding-left: 30px;
}

header .category ul li a:hover, header .category ul li a.active {
	font-weight: bold;
	color: #0000cd;
}

header #userid, header #userpw {
	width: 100px;
	height: 18px;
	font-size: 14px;
}

header ul li input { display:block; }

/* Dropdown menu styles */
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover { background-color: #f1f1f1 }

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #0398fc;
}

</style>

<header style="border-bottom: 1px solid #ccc; padding: 15px 0; text-align: left">
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
	<div class="category" style="margin-left: 100px;"> 
		<ul>
			<li><a href="<core:url value='/' />"><img src="${pageContext.request.contextPath}/resources/images/logo.png" /></a></li>
			<li><a href='list.da' ${category eq 'da' ? "class='active'" : '' } ><fmt:message key="partners" /></a></li>
			<li><a href='list.qna' ${category eq 'qna' ? "class='active'" : '' } ><fmt:message key="projectInquiries" /></a></li>
			<li><a href='list.no' ${category eq 'no' ? "class='active'" : '' } ><fmt:message key="maintenanceInquiries" /></a></li>
			<li><a href='list.cu' ${category eq 'cu' ? "class='active'" : '' } ><fmt:message key="maintenanceRequest" /></a></li>
			<li><a href='list.bo' ${category eq 'bo' ? "class='active'" : '' } ><fmt:message key="applyForAJob" /></a></li>
		</ul>
	</div>
	
	<div style="position: absolute; right: 0; top: 25px; margin-right: 100px;">
		<!-- 로그인한 경우 -->
		<core:if test="${!empty login_info }">
			<ul>
				<li class="dropdown">
					<a href="javascript:void(0)" class="dropbtn"><fmt:message key="myPage" /></a>
					<div class="dropdown-content">
						<a href="#" onclick="myService()"><fmt:message key="myService" /></a>
						<a href="#" onclick="myPost()"><fmt:message key="myPost" /></a>
						<a href="#" onclick="memberInfo()"><fmt:message key="myInfo" /></a>
						<a href="#" onclick="memberDelete()"><fmt:message key="accountDelete" /></a>
					</div>
				</li>
				<li>${login_info.name } [ ${login_info.id } ]</li>
				<li><a class="btn-fill" onclick="go_logout()"><fmt:message key="logOut" /></a></li>
			</ul>
		</core:if>

		 <!-- 로그인하지 않은 경우 -->
		 <core:if test="${empty login_info }">
			 <ul>
			 	<li>
			 		<span style="position: absolute; top: -14px; left: -120px">
						<input type="text" id="userid" placeholder="ID" />
						<input type="password" onkeypress="if(event.keyCode == 13) {go_login()}" id="userpw" placeholder="Password" />
			 		</span>
			 	</li>
			 	<li><a class="btn-fill" href="findUser"><fmt:message key="findAccount" /></a></li>
			 	<li><a class="btn-fill" onclick="go_login()"><fmt:message key="logIn" /></a></li>
			 	<li><a class="btn-fill" href="member"><fmt:message key="signUp" /></a></li>
			 </ul>
		 </core:if>
	</div>
</fmt:bundle>
</header>

<script>
function go_login() {
	if( $('#userid').val() == '' ) {
		alert('IDを入力して下さい!');
		$('#userid').focus();
		return;
	} else if( $('#userpw').val() == '' ) {
		alert('パスワードを入力して下さい!');
		$('#userpw').focus();
		return;
	}

	$.ajax({
		type: 'post',
		url: 'login',
		data: { id:$('#userid').val(), pw:$('#userpw').val() },
		success: function(data) {
			if(data == 'true') {
				location.reload();
			} else {
				alert('アカウント情報が正しくありません！');
				$("#userid").focus();
			}
		},
		error: function(req, text) {
			 alert(text + ': ' + req.status);
	 	}
	});
}

function go_logout() {
	$.ajax({
		type: "post",
		url: "logout",
		success: function() {
			location.reload();
		},
		error: function(req, text) {
			 alert(text + ': ' + req.status);
	 	}
	});
}

function myService() {
    window.location.href = "myService"; // 페이지 이동
}

function myPost() {
    window.location.href = "myPost"; // 페이지 이동
}

function memberInfo() {
    window.location.href = "memberInfo"; // 페이지 이동
}

function memberDelete() {
	window.location.href = "memberDelete";
}

</script>