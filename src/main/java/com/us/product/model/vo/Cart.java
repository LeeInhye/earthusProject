package com.us.product.model.vo;

import java.util.Date;

public class Cart {
	
	private int userNo;
	private String proCode;
	private int proQty;
	private Date addDate;
	
	public Cart() {
		super();
	}

	public Cart(int userNo, String proCode, int proQty, Date addDate) {
		super();
		this.userNo = userNo;
		this.proCode = proCode;
		this.proQty = proQty;
		this.addDate = addDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public int getProQty() {
		return proQty;
	}

	public void setProQty(int proQty) {
		this.proQty = proQty;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "Cart [userNo=" + userNo + ", proCode=" + proCode + ", proQty=" + proQty + ", addDate=" + addDate + "]";
	}
	
}
