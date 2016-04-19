package edu.ahu.hs.platAppoint.beans;

public class AdminBean {
	private String adminId;
	private String adminName;
	private String passWd;
	private String realName;
	private String phone;
	private String email;
	private int grade;
	
	public AdminBean(){
		
	}
	public AdminBean(String adminId,String adminName,String passWd,String realName,String phone,
			String email,int grade){
		this.adminId=adminId;
		this.adminName=adminName;
		this.passWd=passWd;
		this.realName=realName;
		this.phone=phone;
		this.email=email;
		this.grade=grade;
		
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPassWd() {
		return passWd;
	}
	public void setPassWd(String passWd) {
		this.passWd = passWd;
	}
	
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String toString() {
		return "AdminBean [adminId=" + adminId + ", adminName="
				+ adminName + ", passWd=" + passWd + ", realName=" + realName
				+ ", phone=" + phone + ", email=" + email
				+ ", grade=" + grade + "]";
	}
}
