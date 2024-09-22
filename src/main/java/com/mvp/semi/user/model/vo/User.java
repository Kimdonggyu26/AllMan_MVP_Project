package com.mvp.semi.user.model.vo;

import java.sql.Date;

public class User {
		private int userNo;
		private String userId;
		private String userPwd;
		private String phone;
		private String email;
		private String userNick;
		private Date enrollDt;
		private Date modifyDt;
		private String status;
		private int tasteNo;
		private String filePath;
		private int teamNo;
		
		
public User() {}


public User(int userNo, String userId, String userPwd, String phone, String email, String userNick, Date enrollDt,
		Date modifyDt, String status, int tasteNo, String filePath, int teamNo) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPwd = userPwd;
	this.phone = phone;
	this.email = email;                            
	this.userNick = userNick;
	this.enrollDt = enrollDt;
	this.modifyDt = modifyDt;
	this.status = status;
	this.tasteNo = tasteNo;
	this.filePath = filePath;
	this.teamNo = teamNo;
}


public User(int userNo, String userId, String userPwd, String phone, String email, String userNick, Date enrollDt,
		Date modifyDt, String status, int tasteNo) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPwd = userPwd;
	this.phone = phone;
	this.email = email;
	this.userNick = userNick;
	this.enrollDt = enrollDt;
	this.modifyDt = modifyDt;
	this.status = status;
	this.tasteNo = tasteNo;
}


public User(int userNo, String userId, String userPwd, String phone, String email, Date enrollDt, Date modifyDt,
		String status) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPwd = userPwd;
	this.phone = phone;
	this.email = email;
	this.enrollDt = enrollDt;
	this.modifyDt = modifyDt;
	this.status = status;
}


public User(int userNo, String userId, String userPwd, String phone, String email) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPwd = userPwd;
	this.phone = phone;
	this.email = email;
}


public User(String userId, String userPwd, String phone, String email) {
	super();
	this.userId = userId;
	this.userPwd = userPwd;
	this.phone = phone;
	this.email = email;
}


public int getUserNo() {
	return userNo;
}


public void setUserNo(int userNo) {
	this.userNo = userNo;
}


public String getUserId() {
	return userId;
}


public void setUserId(String userId) {
	this.userId = userId;
}


public String getUserPwd() {
	return userPwd;
}


public void setUserPwd(String  userPwd) {
	this.userPwd = userPwd;
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


public String getUserNick() {
	return userNick;
}


public void setUserNick(String userNick) {
	this.userNick = userNick;
}


public Date getEnrollDt() {
	return enrollDt;
}


public void setEnrollDt(Date enrollDt) {
	this.enrollDt = enrollDt;
}


public Date getModifyDt() {
	return modifyDt;
}


public void setModifyDt(Date modifyDt) {
	this.modifyDt = modifyDt;
}


public String getStatus() {
	return status;
}


public void setStatus(String status) {
	this.status = status;
}


public int getTasteNo() {
	return tasteNo;
}


public void setTasteNo(int tasteNo) {
	this.tasteNo = tasteNo;
}


public String getFilePath() {
	return filePath;
}


public void setFilePath(String filePath) {
	this.filePath = filePath;
}


public int getTeamNo() {
	return teamNo;
}


public void setTeamNo(int teamNo) {
	this.teamNo = teamNo;
}


@Override
public String toString() {
	return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", phone=" + phone + ", email="
			+ email + ", userNick=" + userNick + ", enrollDt=" + enrollDt + ", modifyDt=" + modifyDt + ", status="
			+ status + ", tasteNo=" + tasteNo + ", filePath=" + filePath + ", teamNo=" + teamNo + "]";
}
		
}
