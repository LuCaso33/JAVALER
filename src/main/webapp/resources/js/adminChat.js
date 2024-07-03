'use strict';

var chatRoomPage = document.querySelector('#chatroom-page');
var chatRoomList = document.querySelector('#chatroom-list');
var chatRoomForm = document.querySelector('#chatroom-name-form');
var roomnameInput = document.querySelector('#roomname');
var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var exitButton = document.querySelector('#exit-chat-room');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var username = 'admin';

var colors = [
    '#2196F3', '#32c787', '#00BCD4', '#ff5652',
    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];

function introPage(event) {
    var url = "http://192.168.0.126:8080/chat/chatrooms";
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
            data.forEach(item => {
                var chatRoomElement = document.createElement('li');
                chatRoomElement.classList.add('chatroom');
                chatRoomElement.setAttribute('roomId', item.roomId);
                chatRoomElement.setAttribute('roomName', item.roomName);  // roomName属性を追加
                chatRoomElement.setAttribute('onclick', 'chatRoomClick(this)');

                var roomnameElement = document.createElement('span');
                var roonameText = document.createTextNode(item.roomName);
                roomnameElement.appendChild(roonameText);

                var userCountElement = document.createElement('p');
                var userCountText = document.createTextNode('현재 인원 : ' + item.userCount + '명');
                userCountElement.appendChild(userCountText);

                chatRoomElement.appendChild(roomnameElement);
                chatRoomElement.appendChild(userCountElement);

                chatRoomList.appendChild(chatRoomElement);
                chatRoomPage.scrollTop = chatRoomPage.scrollHeight;
            });
        });
}

function chatRoomClick(room) {
    console.log("chatRoomClick関数呼び出し");
    chatRoomPage.classList.add('hidden');

    var roomId = room.getAttribute('roomId');
    var roomName = room.getAttribute('roomName');  // roomName属性を取得
    
    var url = "http://192.168.0.126:8080/chat/roomname?roomId=" + roomId;

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            localStorage.setItem('roomName', data);
            localStorage.setItem('roomId', roomId);
            chatPage.classList.remove('hidden');
            username = 'admin';
            connect();  // `event`を渡さずに呼び出
        })
        .catch(error => {
            console.error('Error fetching room name:', error);
        });

    localStorage.setItem('roomId', roomId);
}


/*function createChatRoom(event) {
    event.preventDefault(); // 페이지가 다시 로드 되는 것을 막는다.
    var selectedRoom = document.querySelector('input[name="roomname"]:checked');
    var nameText = selectedRoom ? selectedRoom.value : '';
    
    var url = "http://192.168.0.129:8080/chat/chatroom";
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-type': 'application/json'
        },
        body: nameText
    })
        .then(response => {
            return response.json();
        })
        .then(data => {

            localStorage.setItem('roomId', data.roomId);
            localStorage.setItem('roomName', data.roomName);
            
        // タグを削除する
        var messageElement = document.getElementById('select-service-message');
        if (messageElement) {
            messageElement.remove();
        }

        var formElement = document.getElementById('select-service-form');
        if (formElement) {
            formElement.remove();
        }
	connect(event);

        });
}*/

function connect(event) {
	
    
    if (username) {

        var socket = new SockJS('/chat/ws');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
	    console.log("connect関数でサブスクライブ完了");
    }
	    console.log("connect関数呼び出し成功");
	    
    event.preventDefault();
}

function onConnected() {
    console.log("onConnected関数呼び出し");
    console.log("roomId: " + localStorage.getItem('roomId'));
    console.log("roomName: " + localStorage.getItem('roomName'));

    //var roomnameElement = document.querySelector('#chat-page .chat-header h2');
    //roomnameElement.innerText = localStorage.getItem('roomName');

    // Subscribe to the Public Topic
    var roomId = localStorage.getItem('roomId');
    stompClient.subscribe('/topic/public/' + roomId, onMessageReceived);

    // Tell your username to the server
    console.log("Sending addUser message");
    stompClient.send("/app/chat.addUser",
        {},
        JSON.stringify({ sender: username, type: 'JOIN', roomId: roomId })
    );

    connectingElement.classList.add('hidden');
}

/*    //Server에서 받은 sender의 값을 현재 session의 username에 대입
    stompClient.subscribe('/topic/chat.addUser', function(response) {
        username = JSON.parse(response.body).sender;
        console.log("Received addUser response: " + response.body);
    });*/


function exitChatRoom(event){
	console.log("exitChatRoom関数呼び出し成功");
    stompClient.unsubscribe();
    localStorage.removeItem('roomId');

    chatPage.classList.add('hidden');
    chatRoomPage.classList.remove('hidden');

    location.reload();
}

function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

function sendMessage(event) {
	console.log("sendMessage関数呼び出し");
    var messageContent = messageInput.value.trim();
    var roomId = localStorage.getItem('roomId');

    if (messageContent && stompClient) {
        var chatMessage = {
            sender: username,
            content: messageInput.value,
            type: 'CHAT',
            roomId: roomId
        };

        console.log("Sending chat message: " + JSON.stringify(chatMessage));
        stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}

function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);
    var container = document.getElementById('messageArea');

    if (message.type === 'JOIN' && message.sender === 'admin') {
        var messageElement = document.createElement('li');
        messageElement.classList.add('event-message');

        var usernameElement = document.createElement('span');
        usernameElement.innerText = 'ジャバラー';
        messageElement.appendChild(usernameElement);

        var textElement = document.createElement('p');
        textElement.innerText = '接続完了。チャットを開始します。';
        messageElement.appendChild(textElement);

        container.appendChild(messageElement);
    } else if (message.type === 'LEAVE') {
        var messageElement = document.createElement('li');
        messageElement.classList.add('event-message');

        var textElement = document.createElement('p');
        textElement.innerText = message.sender + ' left!';
        messageElement.appendChild(textElement);

        container.appendChild(messageElement);
    } else {
        if (message.sender === username) {
            var messageDiv = createMessageElement(message.sender, message.content, 'bms_right');
        } else {
            var messageDiv = createMessageElement(message.sender, message.content, 'bms_left');
        }

        container.appendChild(messageDiv);

        var messageBoxClearDiv = document.createElement('div');
        messageBoxClearDiv.classList.add('bms_clear');
        messageDiv.parentNode.insertBefore(messageBoxClearDiv, messageDiv.nextSibling);
    }

    messageArea.scrollTop = messageArea.scrollHeight;
}

function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}

function generateUUID() {
    let d = new Date().getTime();
    if (window.performance && typeof window.performance.now === "function") {
        d += performance.now(); // use high-precision timer if available
    }
    const uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        const r = (d + Math.random()*16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
    return uuid;
}

// 메시지 요소를 생성하는 함수
function createMessageElement(sender, content, alignment) {
    var messageDiv = document.createElement('div');
    messageDiv.classList.add('bms_message', alignment);

    if (sender !== 'admin') {
		var headerElement = document.createElement('h2');
		headerElement.innerText = "ユーザー";
		messageDiv.appendChild(headerElement);
	}

    var messageBoxDiv = document.createElement('div');
    messageBoxDiv.classList.add('bms_message_box');

    var messageContentDiv = document.createElement('div');
    messageContentDiv.classList.add('bms_message_content');

    var messageTextDiv = document.createElement('div');
    messageTextDiv.classList.add('bms_message_text');
    messageTextDiv.innerText = content;

    messageContentDiv.appendChild(messageTextDiv);
    messageBoxDiv.appendChild(messageContentDiv);
    messageDiv.appendChild(messageBoxDiv);

    return messageDiv;
}


document.addEventListener("DOMContentLoaded", introPage, true);

//chatRoomForm.addEventListener('submit', createChatRoom, true);
//usernameForm.addEventListener('submit', connect, true);
messageForm.addEventListener('submit', sendMessage, true);
exitButton.addEventListener('click', exitChatRoom, true);
