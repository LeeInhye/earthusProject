package com.us.member.model.vo;

import java.util.Date;

public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String zonecode;
	private String address;
	private String addrExtra;
	private String addrDetail;
	private String userBirth;
	private String gender;
	private Date userEnrollDate;
	private Date userModifyDate;
	private String userStatus;
	
	public Member() {}

	public Member(int userNo, String userId, String userPwd, String userName, String email, String phone,
			String zonecode, String address, String addrExtra, String addrDetail, String userBirth, String gender,
			Date userEnrollDate, Date userModifyDate, String userStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.zonecode = zonecode;
		this.address = address;
		this.addrExtra = addrExtra;
		this.addrDetail = addrDetail;
		this.userBirth = userBirth;
		this.gender = gender;
		this.userEnrollDate = userEnrollDate;
		this.userModifyDate = userModifyDate;
		this.userStatus = userStatus;
	}

	public Member(String userId, String userPwd, String userName, String email, String phone, String zonecode,
			String address, String addrExtra, String addrDetail, String userBirth, String gender) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.zonecode = zonecode;
		this.address = address;
		this.addrExtra = addrExtra;
		this.addrDetail = addrDetail;
		this.userBirth = userBirth;
		this.gender = gender;
	}

	public Member(String userId, String userName) {
		super();
		this.userId = userId;
		this.userName = userName;
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

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddrExtra() {
		return addrExtra;
	}

	public void setAddrExtra(String addrExtra) {
		this.addrExtra = addrExtra;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	public Date getUserModifyDate() {
		return userModifyDate;
	}

	public void setUserModifyDate(Date userModifyDate) {
		this.userModifyDate = userModifyDate;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", phone=" + phone + ", zonecode=" + zonecode + ", address=" + address
				+ ", addrExtra=" + addrExtra + ", addrDetail=" + addrDetail + ", userBirth=" + userBirth + ", gender="
				+ gender + ", userEnrollDate=" + userEnrollDate + ", userModifyDate=" + userModifyDate + ", userStatus="
				+ userStatus + "]";
	};
	
	
}
