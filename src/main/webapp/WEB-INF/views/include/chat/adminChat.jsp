<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
      <title>Spring Boot WebSocket Chat Application | CalliCoder</title>
      <!-- <link rel="stylesheet" href="css/adminChat.css" /> -->
      <link rel="stylesheet" href="css/chat.css" />
  </head>
  <body>
    <noscript>
      <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>

<%-- 	<!-- 관리자일 때만 보이는 페이지 -->
	<core:if test="${!empty login_info && login_info.admin eq 'Y'}"> --%>
    <div id="chatroom-page">
        <div class="chatroom-container">
            <ul id="chatroom-list">
            </ul>
        </div>
    </div>
<!--     <div id="username-page" class="hidden">
        <div class="username-page-container">
        	
        	유저네임 수동 입력하는 경우  
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
 						유저네임 수동 입력하는 경우               
                    <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" /> 
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div> -->

    <div id="chat-page" class="hidden">

	    <!-- <div id="your_container">
	    	test message
	        ここにbmesseが動的に挿入される
	    </div> -->
    
         <div class="chat-container">
            <div class="chat-header">
                <h2>チャットお問い合わせ</h2>
                <button id="exit-chat-room" class="exit-chat-room">＜ </button>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm" nameForm="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%--     </core:if> --%>
    
<%--     <!-- 관리자가 아닐 때 보이는 페이지 -->
	<core:if test="${empty login_info || login_info.admin ne 'Y'}">
    	<core:import url="/WEB-INF/views/include/chat/userChat.jsp" />
	</core:if> --%>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="js/adminChat.js"></script>
    <!-- <script src="js/chat.js"></script> -->
  </body>
</html>