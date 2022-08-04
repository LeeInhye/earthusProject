package com.us.challenge.model.vo;

import java.sql.Date;

public class Challenge {
	
	private int challNo;
	private String challTitle;
	private String challContent;
	private int challPoint;
	private String challThumbnail;
	private int challCount;
	private Date challEnrollDate;
	private String challStatus;
	private int challCmnt; // 댓글 수
	private int prevNo; // 이전 글번호
	private int nextNo; // 다음 글번호
	
	public Challenge() {}

	public Challenge(int challNo, String challTitle, String challContent, int challPoint, String challThumbnail,
			int challCount, Date challEnrollDate, String challStatus) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challContent = challContent;
		this.challPoint = challPoint;
		this.challThumbnail = challThumbnail;
		this.challCount = challCount;
		this.challEnrollDate = challEnrollDate;
		this.challStatus = challStatus;
	}

	public Challenge(int challNo, String challTitle, int challPoint, Date challEnrollDate, int challCmnt) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challPoint = challPoint;
		this.challEnrollDate = challEnrollDate;
		this.challCmnt = challCmnt;
	}
	
	public Challenge(int challNo, String challTitle, int challPoint, String challThumbnail, Date challEnrollDate,
			int challCmnt) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challPoint = challPoint;
		this.challThumbnail = challThumbnail;
		this.challEnrollDate = challEnrollDate;
		this.challCmnt = challCmnt;
	}

	public Challenge(int challNo, String challTitle, String challContent, int challPoint, String challThumbnail,
			int challCount, Date challEnrollDate, int challCmnt, int prevNo, int nextNo) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challContent = challContent;
		this.challPoint = challPoint;
		this.challThumbnail = challThumbnail;
		this.challCount = challCount;
		this.challEnrollDate = challEnrollDate;
		this.challCmnt = challCmnt;
		this.prevNo = prevNo;
		this.nextNo = nextNo;
	}

	public Challenge(int challNo, String challTitle, String challThumbnail) {
		super();
		this.challNo = challNo;
		this.challTitle = challTitle;
		this.challThumbnail = challThumbnail;
	}

	public int getChallNo() {
		return challNo;
	}

	public void setChallNo(int challNo) {
		this.challNo = challNo;
	}

	public String getChallTitle() {
		return challTitle;
	}

	public void setChallTitle(String challTitle) {
		this.challTitle = challTitle;
	}

	public String getChallContent() {
		return challContent;
	}

	public void setChallContent(String challContent) {
		this.challContent = challContent;
	}

	public int getChallPoint() {
		return challPoint;
	}

	public void setChallPoint(int challPoint) {
		this.challPoint = challPoint;
	}

	public String getChallThumbnail() {
		return challThumbnail;
	}

	public void setChallThumbnail(String challThumbnail) {
		this.challThumbnail = challThumbnail;
	}

	public int getChallCount() {
		return challCount;
	}

	public void setChallCount(int challCount) {
		this.challCount = challCount;
	}

	public Date getChallEnrollDate() {
		return challEnrollDate;
	}

	public void setChallEnrollDate(Date challEnrollDate) {
		this.challEnrollDate = challEnrollDate;
	}

	public String getChallStatus() {
		return challStatus;
	}

	public void setChallStatus(String challStatus) {
		this.challStatus = challStatus;
	}

	public int getChallCmnt() {
		return challCmnt;
	}

	public void setChallCmnt(int challCmnt) {
		this.challCmnt = challCmnt;
	}
	
	public int getPrevNo() {
		return prevNo;
	}

	public void setPrevNo(int prevNo) {
		this.prevNo = prevNo;
	}

	public int getNextNo() {
		return nextNo;
	}

	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}

	@Override
	public String toString() {
		return "Challenge [challNo=" + challNo + ", challTitle=" + challTitle + ", challContent=" + challContent
				+ ", challPoint=" + challPoint + ", challThumbnail=" + challThumbnail + ", challCount=" + challCount
				+ ", challEnrollDate=" + challEnrollDate + ", challStatus=" + challStatus + ", challCmnt=" + challCmnt
				+ ", prevNo=" + prevNo + ", nextNo=" + nextNo + "]";
	}
	
}
