<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
      <title>ジャバラー</title>
      <!-- <link rel="stylesheet" href="css/adminChat.css" /> -->
      <link rel="stylesheet" href="css/chat.css" />
  </head>
  <body>
    <noscript>
      <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>
    
    <!-- 관리자가 아닐 때 보이는 페이지 -->
	<core:if test="${empty login_info || login_info.admin ne 'Y'}">
    <div id="chat-page">
	    <!-- <div id="your_container">
	    	test message
	        ここにbmesseが動的に挿入される
	    </div> -->
	    

	    
    
         <div class="chat-container">
            <div class="chat-header">
                <h2>チャットお問い合わせ</h2>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">
            
			<div id="select-service-message" class="bms_message bms_left">
			    <div class="bms_message_box">
			        <div class="bms_message_content">
			            <div class="bms_message_text">
							<b>サービスを選択して下さい。</b>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="bms_clear"></div>
			
			
			
			
<!-- <style>
.chatroom-form-control {
            background-color: #ff7e00; /* 초기 색깔 */
            border: none;
            border-radius: 30px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 10px 0;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
}

.chatroom-form-control:hover {
            background-color: #ed6600; /* 호버 시 색깔 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
}
</style> -->
			
			

			<div id="select-service-form" class="bms_message bms_left">
			    <div class="bms_message_box">
			        <div class="bms_message_content">
					    <button type="button" class="chatroom-form-control" onclick="createChatRoom('プロジェクトお問い合わせ')">プロジェクトお問い合わせ</button><br>
					    <button type="button" class="chatroom-form-control" onclick="createChatRoom('メンテナンスのお問い合わせ')">メンテナンスのお問い合わせ</button><br>
					    <button type="button" class="chatroom-form-control" onclick="createChatRoom('その他のお問い合わせ')">その他のお問い合わせ</button>
			            <div class="bms_message_text">
			                <div class="chatroom-form-group">
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="bms_clear"></div>
			                    
            </ul>
            <form id="messageForm" name="messageForm" nameForm="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">送信</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
	</core:if>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="js/userChat.js"></script>
    <!-- <script src="js/chat.js"></script> -->
  </body>
</html>

