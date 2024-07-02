<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
							サービスを選択して下さい。
			            </div>
			        </div>
			    </div>
			</div>
			<div class="bms_clear"></div>

			<div id="select-service-form" class="bms_message bms_left">
			    <div class="bms_message_box">
			        <div class="bms_message_content">
			            <div class="bms_message_text">

				            <form id="chatroom-name-form" name="chatroom-name-form">
				                <div class="chatroom-form-group">
				
				                <label>
				                    <input type="radio" name="roomname" value="プロジェクトお問い合わせ" class="chatroom-form-control"/> プロジェクトお問い合わせ
				                </label>
				                <label>
				                    <input type="radio" name="roomname" value="メンテナンスのお問い合わせ" class="chatroom-form-control"/> メンテナンスのお問い合わせ
				                </label>
				                <label>
				                    <input type="radio" name="roomname" value="その他のお問い合わせ" class="chatroom-form-control"/> その他のお問い合わせ
				                </label>
				               <!-- <input type="text" id="roomname" placeholder="Roomname" autocomplete="off" class="chatroom-form-control" /> -->
				               
				                </div>
				                <div class="chatroom-submit">
				                    <button type="submit" class="accent roomname-submit">Create Room</button>
				                </div>
				            </form>
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
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
	

