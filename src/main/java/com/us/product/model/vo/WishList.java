package com.us.product.model.vo;

import java.sql.Date;

public class WishList {
	
	private int userNo;
	private int proCode;
	private Date wishDate;
	private String proImgPath;
	private String proName;
	private int price;
	
	public String getProImgPath() {
		return proImgPath;
	}

	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
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

	public WishList() {}

	public WishList(int userNo, int proCode, Date wishDate) {
		super();
		this.userNo = userNo;
		this.proCode = proCode;
		this.wishDate = wishDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public Date getWishDate() {
		return wishDate;
	}

	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}

	@Override
	public String toString() {
		return "Wishlist [userNo=" + userNo + ", proCode=" + proCode + ", wishDate=" + wishDate + "]";
	}
	


}
