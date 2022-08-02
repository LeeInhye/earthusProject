package com.us.product.model.vo;

import java.util.Date;

public class Review {
	private int revNo;
	private int userNo;
	private String proCode;
	private Date revDate;
	private int revRate;
	private String revContent;
	private String revType;

	public Review() {
		super();
	}

	public Review(int revNo, int userNo, String proCode, Date revDate, int revRate, String revContent, String revType) {
		super();
		this.revNo = revNo;
		this.userNo = userNo;
		this.proCode = proCode;
		this.revDate = revDate;
		this.revRate = revRate;
		this.revContent = revContent;
		this.revType = revType;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
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

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getRevType() {
		return revType;
	}

	public void setRevType(String revType) {
		this.revType = revType;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", userNo=" + userNo + ", proCode=" + proCode + ", revDate=" + revDate
				+ ", revRate=" + revRate + ", revContent=" + revContent + ", revType=" + revType + "]";
	}

	
}