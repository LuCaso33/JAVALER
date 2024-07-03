package chat;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


public class ChatRoom {
    private String roomId;
    private String roomName;
    private int userCount;
    private List<String> users;

    public static ChatRoom create(String roomName){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setRoomId(UUID.randomUUID().toString());
        chatRoom.setRoomName(roomName);
        chatRoom.setUsers(new ArrayList<>());

        return chatRoom;
    }
    
    //Getter & Setter
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public List<String> getUsers() {
		return users;
	}
	public void setUsers(List<String> users) {
		this.users = users;
	}
    

}
