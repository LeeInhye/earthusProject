package com.us.order.model.vo;

import java.sql.Date;

public class Order {
	
	private int orderNo;
	private int userNo;
	private String payment;
	private int pointUsed;
	private String shpMemo;
	private int paymentAmount;
	private String ordrrName;
	private String ordrrPhone;
	private String delName;
	private String delPhone;
	private String zoneCode;
	private String delAddress;
	private String addrDetail;
	private int delNo;
	private int delStatus;
	private int proCount;
	private String proCode;
	private String proName;
	private Date orderDate;
	
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

	public Order() {}

	public Order(int orderNo, int userNo, String payment, int pointUsed, String shpMemo, int paymentAmount,
			String ordrrName, String ordrrPhone, String delName, String delPhone, String zoneCode, String delAddress,
			String addrDetail, int delNo, int delStatus) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.payment = payment;
		this.pointUsed = pointUsed;
		this.shpMemo = shpMemo;
		this.paymentAmount = paymentAmount;
		this.ordrrName = ordrrName;
		this.ordrrPhone = ordrrPhone;
		this.delName = delName;
		this.delPhone = delPhone;
		this.zoneCode = zoneCode;
		this.delAddress = delAddress;
		this.addrDetail = addrDetail;
		this.delNo = delNo;
		this.delStatus = delStatus;
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

	public int getPointUsed() {
		return pointUsed;
	}

	public void setPointUsed(int pointUsed) {
		this.pointUsed = pointUsed;
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

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getDelAddress() {
		return delAddress;
	}

	public void setDelAddress(String delAddress) {
		this.delAddress = delAddress;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", payment=" + payment + ", pointUsed=" + pointUsed
				+ ", shpMemo=" + shpMemo + ", paymentAmount=" + paymentAmount + ", ordrrName=" + ordrrName
				+ ", ordrrPhone=" + ordrrPhone + ", delName=" + delName + ", delPhone=" + delPhone + ", zoneCode="
				+ zoneCode + ", delAddress=" + delAddress + ", addrDetail=" + addrDetail + ", delNo=" + delNo
				+ ", delStatus=" + delStatus + "]";
	}
	

}
