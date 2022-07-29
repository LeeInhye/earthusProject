package com.us.contents.model.vo;

import java.sql.Date;

public class Contents {

	private int cntNo;
	private String cntTitle;
	private String cntContent;
	private String cntThumbnail;
	private int cntCount;
	private Date cntEnrollDate;
	private String cntStatus;
	private int cntLike;
	
	public Contents() {}

	public Contents(int cntNo, String cntTitle, String cntContent, String cntThumbnail, int cntCount,
			Date cntEnrollDate, String cntStatus) {
		super();
		this.cntNo = cntNo;
		this.cntTitle = cntTitle;
		this.cntContent = cntContent;
		this.cntThumbnail = cntThumbnail;
		this.cntCount = cntCount;
		this.cntEnrollDate = cntEnrollDate;
		this.cntStatus = cntStatus;
	}

	public Contents(int cntNo, String cntTitle, int cntCount, Date cntEnrollDate, int cntLike) {
		super();
		this.cntNo = cntNo;
		this.cntTitle = cntTitle;
		this.cntCount = cntCount;
		this.cntEnrollDate = cntEnrollDate;
		this.cntLike = cntLike;
	}

	public Contents(int cntNo, String cntTitle, String cntContent, String cntThumbnail, int cntCount,
			Date cntEnrollDate, int cntLike) {
		super();
		this.cntNo = cntNo;
		this.cntTitle = cntTitle;
		this.cntContent = cntContent;
		this.cntThumbnail = cntThumbnail;
		this.cntCount = cntCount;
		this.cntEnrollDate = cntEnrollDate;
		this.cntLike = cntLike;
	}
	
	public Contents(int cntNo, String cntTitle, String cntContent, String cntThumbnail, Date cntEnrollDate,
			int cntLike) {
		super();
		this.cntNo = cntNo;
		this.cntTitle = cntTitle;
		this.cntContent = cntContent;
		this.cntThumbnail = cntThumbnail;
		this.cntEnrollDate = cntEnrollDate;
		this.cntLike = cntLike;
	}

	public int getCntNo() {
		return cntNo;
	}

	public void setCntNo(int cntNo) {
		this.cntNo = cntNo;
	}

	public String getCntTitle() {
		return cntTitle;
	}

	public void setCntTitle(String cntTitle) {
		this.cntTitle = cntTitle;
	}

	public String getCntContent() {
		return cntContent;
	}

	public void setCntContent(String cntContent) {
		this.cntContent = cntContent;
	}

	public String getCntThumbnail() {
		return cntThumbnail;
	}

	public void setCntThumbnail(String cntThumbnail) {
		this.cntThumbnail = cntThumbnail;
	}

	public int getCntCount() {
		return cntCount;
	}

	public void setCntCount(int cntCount) {
		this.cntCount = cntCount;
	}

	public Date getCntEnrollDate() {
		return cntEnrollDate;
	}

	public void setCntEnrollDate(Date cntEnrollDate) {
		this.cntEnrollDate = cntEnrollDate;
	}

	public String getCntStatus() {
		return cntStatus;
	}

	public void setCntStatus(String cntStatus) {
		this.cntStatus = cntStatus;
	}

	public int getCntLike() {
		return cntLike;
	}

	public void setCntLike(int cntLike) {
		this.cntLike = cntLike;
	}

	@Override
	public String toString() {
		return "Contents [cntNo=" + cntNo + ", cntTitle=" + cntTitle + ", cntContent=" + cntContent + ", cntThumbnail="
				+ cntThumbnail + ", cntCount=" + cntCount + ", cntEnrollDate=" + cntEnrollDate + ", cntStatus="
				+ cntStatus + ", cntLike=" + cntLike + "]";
	}
	
}
