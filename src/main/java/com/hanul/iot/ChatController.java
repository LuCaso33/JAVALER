package com.hanul.iot;

import chat.ChatMessage;
import chat.ChatRoom;
import chat.ChatRoomRepository;
import member.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatController {
    
    @Autowired
    private ChatRoomRepository chatRoomRepository;
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @RequestMapping("")
    public String chat() {
    	
//        MemberVO login_info = (MemberVO) session.getAttribute("login_info");

//        if (login_info != null && "Y".equals(login_info.getAdmin())) {
            return "include/chat/chat";
//        } 
    }
    
    @MessageMapping("/chat.sendMessage")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        String destination = "/topic/public/" + chatMessage.getRoomId();
        System.out.println(chatMessage.getSender() + ": " + chatMessage.getContent());
        messagingTemplate.convertAndSend(destination, chatMessage);
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    public ChatMessage addUser(@Payload ChatMessage chatMessage,
                               SimpMessageHeaderAccessor headerAccessor) {
        System.out.println("addUser: " + chatMessage.getSender() + " to room " + chatMessage.getRoomId());
        
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        String sender = chatRoomRepository.addUser(chatMessage.getRoomId(), chatMessage.getSender());
        headerAccessor.getSessionAttributes().put("username", sender);
        headerAccessor.getSessionAttributes().put("roomId", chatMessage.getRoomId());

        ChatMessage response = new ChatMessage();
        response.setType(ChatMessage.MessageType.JOIN);
        response.setSender(sender);
        
        System.out.println(sender + " 님이 입장하셨습니다。");
        response.setRoomId(chatMessage.getRoomId());
        messagingTemplate.convertAndSend("/topic/public/" + chatMessage.getRoomId(), response);

        return response;
    }

    @GetMapping("/chatrooms")
    public ResponseEntity<List<ChatRoom>> getChatRoomList() {
        List<ChatRoom> chatRooms = chatRoomRepository.getChatRoomList();
        return new ResponseEntity<>(chatRooms, HttpStatus.OK);
    }

    @ResponseBody
    @GetMapping("/roomname")
    public ResponseEntity<String> getRoomName(@RequestParam String roomId) {
        String roomName = chatRoomRepository.getRoomName(roomId);
        System.out.println(roomName + " roomname found");
        return new ResponseEntity<>(roomName, HttpStatus.OK);
    }

    @PostMapping("/chatroom")
    public ResponseEntity<ChatRoom> createChatRoom(@RequestBody String roomName) {
        ChatRoom chatroom = chatRoomRepository.createChatRoom(roomName);
        System.out.println(roomName + " roomname created");
        return new ResponseEntity<>(chatroom, HttpStatus.OK);
    }
}
