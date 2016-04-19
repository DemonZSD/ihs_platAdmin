package edu.ahu.hs.platAppoint.beans;

public class UserBean {
	private String userId;
	private String userName;
	private String passWd;
	private String realName;
	private String phoneNum;
	private String email;
	private String departMent;
	
	public UserBean(){
		
	}
	public UserBean(String userId,String userName,String passWd,String realName,String phoneNum,
			String email,String departMent){
		this.userId=userId;
		this.userName=userName;
		this.passWd=passWd;
		this.realName=realName;
		this.phoneNum=phoneNum;
		this.email=email;
		this.departMent=departMent;
		
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

	public String getPassWd() {
		return passWd;
	}

	public void setPassWd(String passWd) {
		this.passWd = passWd;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartMent() {
		return departMent;
	}

	public void setDepartMent(String departMent) {
		this.departMent = departMent;
	}
	public String toString() {
		return "UserBean [userId=" + userId + ", userName="
				+ userName + ", passWd=" + passWd + ", realName=" + realName
				+ ", phoneNum=" + phoneNum + ", email=" + email
				+ ", departMent=" + departMent + "]";
	}

}
