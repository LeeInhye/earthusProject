package com.us.contents.model.vo;

import java.sql.Date;

public class ContentsLike {

	private int cntNo;
	private int userNo;
	private Date cntLikeDate;
	
	public ContentsLike() {};
	
	public ContentsLike(int cntNo, int userNo, Date cntLikeDate) {
		super();
		this.cntNo = cntNo;
		this.userNo = userNo;
		this.cntLikeDate = cntLikeDate;
	}

	public int getCntNo() {
		return cntNo;
	}

	public void setCntNo(int cntNo) {
		this.cntNo = cntNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getCntLikeDate() {
		return cntLikeDate;
	}

	public void setCntLikeDate(Date cntLikeDate) {
		this.cntLikeDate = cntLikeDate;
	}

	@Override
	public String toString() {
		return "ContentsLike [cntNo=" + cntNo + ", userNo=" + userNo + ", cntLikeDate=" + cntLikeDate + "]";
	}

}
