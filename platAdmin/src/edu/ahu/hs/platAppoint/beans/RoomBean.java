package edu.ahu.hs.platAppoint.beans;

public class RoomBean {
	
	private String roomId;
	private String roomNo;
	private String roomType;
	private String roomFunction;
	private String addr;
	private String price;
	private String adminId;
	private String adminName;
	private int contain;
	public RoomBean(){
		
	}
	
	public RoomBean(String roomId,String roomNo,String roomType,String roomFunction,
			String addr,String price,String adminId,String adminName,int contain){
		super();
		this.roomId=roomId;
		this.roomNo=roomNo;
		this.roomType=roomType;
		this.roomFunction=roomFunction;
		this.addr=addr;
		this.price=price;
		this.adminId=adminId;
		this.adminName=adminName;
		this.contain=contain;
	}
	
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	public int getContain() {
		return contain;
	}

	public void setContain(int contain) {
		this.contain = contain;
	}

	
	public String getRoomFunction() {
		return roomFunction;
	}

	public void setRoomFunction(String roomFunction) {
		this.roomFunction = roomFunction;
	}

	public String toString() {
		return "RoomBean [roomId=" + roomId + ", roomNo="
				+ roomNo + ", roomType=" + roomType + ", roomFunction=" + roomFunction
				+ ", addr=" + addr + ", price=" + price
				+ ", adminId=" + adminId + ", adminName=" + adminName +  ", contain=" + contain + "]";
	}
}
