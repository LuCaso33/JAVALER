package chat;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@Repository
public class ChatRoomRepository {
    private static List<ChatRoom> chatRooms = new ArrayList<ChatRoom>();

    public List<ChatRoom> getChatRoomList() {
        List<ChatRoom> result = new ArrayList<ChatRoom>(chatRooms);
        Collections.reverse(result);
        return result;
    }

    public static ChatRoom getChatRoom(String roomId) {
        for (ChatRoom room : chatRooms) {
            if (roomId.equals(room.getRoomId())) {
                return room;
            }
        }
        return null;
    }

    public static void plusUserCnt(ChatRoom chatRoom) {
        chatRoom.setUserCount(chatRoom.getUserCount() + 1);
    }

    public String addUser(String roomId, String sender) {
        ChatRoom chatRoom = getChatRoom(roomId);
        plusUserCnt(chatRoom);
        chatRoom.getUsers().add(sender);

        
            return sender;
    }

    public void deleteUser(String username, String roomId) {
        ChatRoom chatRoom = getChatRoom(roomId);

        List<String> chatRoomUsers = chatRoom.getUsers();
        chatRoom.setUserCount(chatRoom.getUserCount() - 1);

        if (chatRoom.getUserCount() == 0) {
            chatRooms.remove(chatRoom);
        }

        Iterator<String> iterator = chatRoomUsers.iterator();
        while (iterator.hasNext()) {
            String name = iterator.next();
            if (name.equals(username)) {
                iterator.remove();
            }
        }
    }

    public ChatRoom createChatRoom(String roomName) {
        ChatRoom chatRoom = ChatRoom.create(roomName);
        chatRooms.add(chatRoom);
        return chatRoom;
    }

    public String getRoomName(String roomId) {
        for (ChatRoom room : chatRooms) {
            if (room.getRoomId().equals(roomId)) {
                return room.getRoomName();
            }
        }
        throw new RuntimeException("No Room");
    }
}
