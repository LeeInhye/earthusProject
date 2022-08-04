package com.us.product.model.vo;

import java.util.Date;

public class Cart {
	
	private int userNo;
	private String proCode;
	private String proName;
	private int price;
	private int proQty;
	private Date addDate;
	
	public Cart() {
		super();
	}
	
	public Cart(int userNo, String proCode, String proName, int price, int proQty, Date addDate) {
		super();
		this.userNo = userNo;
		this.proCode = proCode;
		this.proName = proName;
		this.price = price;
		this.proQty = proQty;
		this.addDate = addDate;
	}
	
	

	public Cart(int userNo, String proCode, String proName, int price, int proQty) {
		super();
		this.userNo = userNo;
		this.proCode = proCode;
		this.proName = proName;
		this.price = price;
		this.proQty = proQty;
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

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		return "Cart [userNo=" + userNo + ", proCode=" + proCode + ", proName=" + proName + ", price=" + price
				+ ", proQty=" + proQty + ", addDate=" + addDate + "]";
	}
	
	
}
