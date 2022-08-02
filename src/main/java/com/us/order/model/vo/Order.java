package com.us.order.model.vo;

import java.sql.Date;

public class Order {
	
	private int orderNo;
	private int userNo;
	private String payment;
	private int pointsUsed;
	private String shpMemo;
	private int paymentAmount;
	private String ordrrName;
	private String ordrrPhone;
	private String delName;
	private String delPhone;
	private String delZoneCode;
	private String delAddress;
	private String delAddrDetail;
	private int delNo;
	private int delStatus;
	private int proCount;
	private String proCode;
	private String proName;
	private Date orderDate;
	private String proImgPath;
	private int price;
	private int quantity;
	private String zoneCode;
	private String userName;
	private String phone;
	private String address;
	private String addrDetail;
	
	
	public Order(int orderNo, int delStatus, String proName, Date orderDate, String proImgPath, int price,
			int quantity) {
		super();
		this.orderNo = orderNo;
		this.delStatus = delStatus;
		this.proName = proName;
		this.orderDate = orderDate;
		this.proImgPath = proImgPath;
		this.price = price;
		this.quantity = quantity;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getProImgPath() {
		return proImgPath;
	}

	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public Order(int orderNo, String payment, int pointsUsed, String shpMemo, int paymentAmount, String delName,
			String delPhone, String delZoneCode, String delAddress, String delAddrDetail, int delStatus, String proName,
			Date orderDate, String proImgPath, int price, int quantity, String zoneCode, String userName, String phone,
			String address, String addrDetail) {
		super();
		this.orderNo = orderNo;
		this.payment = payment;
		this.pointsUsed = pointsUsed;
		this.shpMemo = shpMemo;
		this.paymentAmount = paymentAmount;
		this.delName = delName;
		this.delPhone = delPhone;
		this.delZoneCode = delZoneCode;
		this.delAddress = delAddress;
		this.delAddrDetail = delAddrDetail;
		this.delStatus = delStatus;
		this.proName = proName;
		this.orderDate = orderDate;
		this.proImgPath = proImgPath;
		this.price = price;
		this.quantity = quantity;
		this.zoneCode = zoneCode;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.addrDetail = addrDetail;
	}

	public Order() {}
	
	

	public Order(int orderNo, int paymentAmount, int delStatus, int proCount, String proCode, String proName,
			Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.paymentAmount = paymentAmount;
		this.delStatus = delStatus;
		this.proCount = proCount;
		this.proCode = proCode;
		this.proName = proName;
		this.orderDate = orderDate;
	}

	public Order(int orderNo, int userNo, String payment, int pointsUsed, String shpMemo, int paymentAmount,
			String ordrrName, String ordrrPhone, String delName, String delPhone, String delZoneCode, String delAddress,
			String delAddrDetail, int delNo) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.payment = payment;
		this.pointsUsed = pointsUsed;
		this.shpMemo = shpMemo;
		this.paymentAmount = paymentAmount;
		this.ordrrName = ordrrName;
		this.ordrrPhone = ordrrPhone;
		this.delName = delName;
		this.delPhone = delPhone;
		this.delZoneCode = delZoneCode;
		this.delAddress = delAddress;
		this.delAddrDetail = delAddrDetail;
		this.delNo = delNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getPointsUsed() {
		return pointsUsed;
	}

	public void setPointsUsed(int pointsUsed) {
		this.pointsUsed = pointsUsed;
	}

	public String getShpMemo() {
		return shpMemo;
	}

	public void setShpMemo(String shpMemo) {
		this.shpMemo = shpMemo;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getOrdrrName() {
		return ordrrName;
	}

	public void setOrdrrName(String ordrrName) {
		this.ordrrName = ordrrName;
	}

	public String getOrdrrPhone() {
		return ordrrPhone;
	}

	public void setOrdrrPhone(String ordrrPhone) {
		this.ordrrPhone = ordrrPhone;
	}

	public String getDelName() {
		return delName;
	}

	public void setDelName(String delName) {
		this.delName = delName;
	}

	public String getDelPhone() {
		return delPhone;
	}

	public void setDelPhone(String delPhone) {
		this.delPhone = delPhone;
	}

	public String getDelZoneCode() {
		return delZoneCode;
	}

	public void setDelZoneCode(String delZoneCode) {
		this.delZoneCode = delZoneCode;
	}

	public String getDelAddress() {
		return delAddress;
	}

	public void setDelAddress(String delAddress) {
		this.delAddress = delAddress;
	}

	public String getDelAddrDetail() {
		return delAddrDetail;
	}

	public void setDelAddrDetail(String delAddrDetail) {
		this.delAddrDetail = delAddrDetail;
	}

	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", payment=" + payment + ", pointsUsed=" + pointsUsed
				+ ", shpMemo=" + shpMemo + ", paymentAmount=" + paymentAmount + ", ordrrName=" + ordrrName
				+ ", ordrrPhone=" + ordrrPhone + ", delName=" + delName + ", delPhone=" + delPhone + ", delZoneCode="
				+ delZoneCode + ", delAddress=" + delAddress + ", delAddrDetail=" + delAddrDetail + ", delNo=" + delNo
				+ "]";
	}
	
	
	
	
	

}
