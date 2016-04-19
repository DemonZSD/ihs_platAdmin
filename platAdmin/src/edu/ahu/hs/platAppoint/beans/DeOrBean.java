package edu.ahu.hs.platAppoint.beans;

public class DeOrBean {
	private String deOrId;
	private String orName;
	private String contact;
	private String email;
	private String reDate;
	private String reTime;
	private int noon;
	private String submitTime;
	private String money;
	private String deviceId;
	private String deviceName;
	private String deviceType;
	private String userId;
	private String userName;
	private int isUsing;
	private int finish;
	private String remark;
	private String adminId;
	private String adminName;
	private String department;
	private String purpose;
public DeOrBean(){
		
	}
	public DeOrBean(String deOrId,String orName,String contact,String email,
			String reDate,String reTime,int noon,String submitTime,String money,String deviceId,String userId,
			int isUsing,int finish,String remark,String purpose){
		this.deOrId=deOrId;
		this.orName=orName;
		this.contact=contact;
		this.email=email;
		this.reDate=reDate;
		this.reTime=reTime;
		this.noon=noon;
		this.submitTime=submitTime;
		this.money=money;
		this.deviceId=deviceId;
		this.userId=userId;
		this.isUsing=isUsing;
		this.finish=finish;
		this.remark=remark;
		this.purpose=purpose;
	}
	public String getDeOrId() {
		return deOrId;
	}
	public void setDeOrId(String deOrId) {
		this.deOrId = deOrId;
	}
	public String getOrName() {
		return orName;
	}
	public void setOrName(String orName) {
		this.orName = orName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getReDate() {
		return reDate;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	public String getReTime() {
		return reTime;
	}
	public void setReTime(String reTime) {
		this.reTime = reTime;
	}
	public int getNoon() {
		return noon;
	}
	public void setNoon(int noon) {
		this.noon = noon;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
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
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getIsUsing() {
		return isUsing;
	}
	public void setIsUsing(int isUsing) {
		this.isUsing = isUsing;
	}
	public int getFinish() {
		return finish;
	}
	public void setFinish(int finish) {
		this.finish = finish;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	@Override
	public String toString() {
		return "DeOrBean [deOrId=" + deOrId + ", orName=" + orName
				+ ", contact=" + contact + ", email=" + email + ", reDate="
				+ reDate + ", reTime=" + reTime + ", noon=" + noon
				+ ", submitTime=" + submitTime + ", money=" + money
				+ ", deviceId=" + deviceId + ", deviceName=" + deviceName
				+ ", deviceType=" + deviceType + ", userId=" + userId
				+ ", userName=" + userName + ", isUsing=" + isUsing
				+ ", finish=" + finish + ", remark=" + remark + ", adminId="
				+ adminId + ", adminName=" + adminName + ", department="
				+ department + ", purpose=" + purpose + "]";
	}
	

}
