package com.us.cs.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeWriter;
	private String csCategory;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeEnrollDate;
	private String notice_status;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeWriter, String csCategory, String noticeTitle, String noticeContent,
			Date noticeEnrollDate, String notice_status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.csCategory = csCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeEnrollDate = noticeEnrollDate;
		this.notice_status = notice_status;
	}
	

	public Notice(int noticeNo, String noticeWriter, String csCategory, String noticeTitle, String noticeContent,
			Date noticeEnrollDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.csCategory = csCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeEnrollDate = noticeEnrollDate;
	}

	public Notice(String noticeWriter, String csCategory, String noticeTitle, String noticeContent) {
		super();
		this.noticeWriter = noticeWriter;
		this.csCategory = csCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public Notice(int noticeNo, String noticeWriter, String csCategory, String noticeTitle, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.csCategory = csCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getCsCategory() {
		return csCategory;
	}

	public void setCsCategory(String csCategory) {
		this.csCategory = csCategory;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeEnrollDate() {
		return noticeEnrollDate;
	}

	public void setNoticeEnrollDate(Date noticeEnrollDate) {
		this.noticeEnrollDate = noticeEnrollDate;
	}

	public String getNotice_status() {
		return notice_status;
	}

	public void setNotice_status(String notice_status) {
		this.notice_status = notice_status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", csCategory=" + csCategory
				+ ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeEnrollDate="
				+ noticeEnrollDate + ", notice_status=" + notice_status + "]";
	}
	
}

	