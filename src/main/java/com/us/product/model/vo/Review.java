package com.us.product.model.vo;

import java.util.Date;

public class Review {
	private int revNo;
	private int userNo;
	private String proCode;
	private String proName;
	private String proImgPath;
	private Date revDate;
	private int revRate;
	private String revContent;
	private String revImgPath;
	private String revType;

	public Review() {
		super();
	}

	public Review(int revNo, int userNo, String proCode, String proName, String proImgPath, Date revDate, int revRate,
			String revContent, String revImgPath, String revType) {
		super();
		this.revNo = revNo;
		this.userNo = userNo;
		this.proCode = proCode;
		this.proName = proName;
		this.proImgPath = proImgPath;
		this.revDate = revDate;
		this.revRate = revRate;
		this.revContent = revContent;
		this.revImgPath = revImgPath;
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
	
	public String getRevImgPath() {
		return revImgPath;
	}
	
	public void setRevImgPath(String revImgPath) {
		this.revImgPath = revImgPath;
	}
	
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProImgPath() {
		return proImgPath;
	}

	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}


	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", userNo=" + userNo + ", proCode=" + proCode + ", revDate=" + revDate
				+ ", revRate=" + revRate + ", revContent=" + revContent + ", revType=" + revType + "]";
	}

	
}