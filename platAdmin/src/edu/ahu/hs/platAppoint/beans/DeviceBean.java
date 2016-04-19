package edu.ahu.hs.platAppoint.beans;

public class DeviceBean {
	private String deviceId;
	private String deviceName;
	private String type;
	private String photo;
	private String expriment;
	private String train;
	private int trainNum;
	private String price;
	private String adminId;
	private String adminName;
	private String made;
	public DeviceBean(){
		 
	 }
	 public DeviceBean(String deviceId,String deviceName,String type,String made,String photo,String expriment,
			 String train,int trainNum,String price,String adminId){
		 this.deviceId=deviceId;
		 this.deviceName=deviceName;
		 this.type=type;
		 this.photo=photo;
		 this.expriment=expriment;
		 this.train=train;
		 this.trainNum=trainNum;
		 this.price=price;
		 this.adminId=adminId;
		 this.made=made;
	 }
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getExpriment() {
		return expriment;
	}
	public void setExpriment(String expriment) {
		this.expriment = expriment;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	public int getTrainNum() {
		return trainNum;
	}
	public void setTrainNum(int trainNum) {
		this.trainNum = trainNum;
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
	
	public String getMade() {
		return made;
	}
	public void setMade(String made) {
		this.made = made;
	}
	public String toString() {
		return "DeviceBean [deviceId=" + deviceId + ", deviceName="
				+ deviceName + ", type=" + type + ", made=" + made + ", photo=" + photo
				+ ", expriment=" + expriment + ", train=" + train
				+ ", trainNum=" + trainNum + ", price=" 
				+ price + ", adminId=" + adminId + ", adminName=" + adminName + "]";
	} 

}
