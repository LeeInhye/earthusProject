package com.us.point.model.vo;

import java.sql.Date;

public class Point {

	private int pointNo;
	private int userNo;
	private String pointType;
	private String pointReason;
	private int pointAmount;
	private int pointBalance;
	private Date pointDate;
	private int orderNo;
	private int challNo;
	private String userId;
	private String userName;
	
	public Point() {}

	public Point(int pointNo, int userNo, String pointType, String pointReason, int pointAmount, int pointBalance,
			Date pointDate, int orderNo, int challNo) {
		super();
		this.pointNo = pointNo;
		this.userNo = userNo;
		this.pointType = pointType;
		this.pointReason = pointReason;
		this.pointAmount = pointAmount;
		this.pointBalance = pointBalance;
		this.pointDate = pointDate;
		this.orderNo = orderNo;
		this.challNo = challNo;
	}

	public Point(int pointNo, String pointType, String pointReason, int pointAmount, int pointBalance, Date pointDate, String userId,
			String userName) {
		super();
		this.pointNo = pointNo;
		this.pointType = pointType;
		this.pointReason = pointReason;
		this.pointAmount = pointAmount;
		this.pointBalance = pointBalance;
		this.pointDate = pointDate;
		this.userId = userId;
		this.userName = userName;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPointType() {
		return pointType;
	}

	public void setPointType(String pointType) {
		this.pointType = pointType;
	}

	public String getPointReason() {
		return pointReason;
	}

	public void setPointReason(String pointReason) {
		this.pointReason = pointReason;
	}

	public int getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(int pointAmount) {
		this.pointAmount = pointAmount;
	}

	public int getPointBalance() {
		return pointBalance;
	}

	public void setPointBalance(int pointBalance) {
		this.pointBalance = pointBalance;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getChallNo() {
		return challNo;
	}

	public void setChallNo(int challNo) {
		this.challNo = challNo;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", userNo=" + userNo + ", pointType=" + pointType + ", pointReason="
				+ pointReason + ", pointAmount=" + pointAmount + ", pointBalance=" + pointBalance + ", pointDate="
				+ pointDate + ", orderNo=" + orderNo + ", challNo=" + challNo + ", userId=" + userId + ", userName="
				+ userName + "]";
	}

}
