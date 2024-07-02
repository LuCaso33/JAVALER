<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="bmesse.css" />
    <title></title>
</head>
<body>
    <h3 id="me" user_id="1"></h3>
    <h3 id="partner" thread_id="1"></h3>
    <div id="users">
        <button class="user" user_id="2">2</button>
    </div>
    <br>
    <div id="your_container">
        <div id="bms_messages_container">
            <div id="bms_chat_header">
                <div id="bms_chat_user_status">
                    <div id="bms_status_icon"></div>
                    <div id="bms_chat_user_name"></div>
                </div>
            </div>

            <div id="bms_messages">
    
                <div class="bms_message bms_left">
                    <div class="bms_message_box">
                        <div class="bms_message_content">
                            <div class="bms_message_text"></div>
                        </div>
                    </div>
                </div>
                <div class="bms_clear"></div>

                <div class="bms_message bms_right">
                    <div class="bms_message_box">
                        <div class="bms_message_content">
                            <div class="bms_message_text"></div>
                        </div>
                    </div>
                </div>
                <div class="bms_clear"></div><!--  -->
            </div>
    
            <div id="bms_send">
                <textarea id="bms_send_message"></textarea>
                <div id="bms_send_btn"></div>
            </div>
        </div>
    </div>
</body>
</html>