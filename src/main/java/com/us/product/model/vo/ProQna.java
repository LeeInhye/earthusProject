package com.us.product.model.vo;

import java.sql.Date;

public class ProQna {
	
	private int proQnaNo;
	private String proCode;
	private String proQnaTitle;
	private String proQnaContent;
	private String proQnaPwd;
	private int proQnaWriterNo; // 작성자 회원번호 (회원일 경우)
	private String proQnaWriterName;
	private String proQnaEmail;
	private String proQnaPhone;
	private Date proQEnrollDate;
	private Date proAEnrollDate;
	private String proAWriter;
	private String proAContent;
	
	private String proName;

	public ProQna() {}

	public ProQna(int proQnaNo, String proCode, String proQnaTitle, String proQnaContent, String proQnaPwd,
			int proQnaWriterNo, String proQnaWriterName, String proQnaEmail, String proQnaPhone, Date proQEnrollDate,
			Date proAEnrollDate, String proAWriter, String proAcontent, String proName) {
		super();
		this.proQnaNo = proQnaNo;
		this.proCode = proCode;
		this.proQnaTitle = proQnaTitle;
		this.proQnaContent = proQnaContent;
		this.proQnaPwd = proQnaPwd;
		this.proQnaWriterNo = proQnaWriterNo;
		this.proQnaWriterName = proQnaWriterName;
		this.proQnaEmail = proQnaEmail;
		this.proQnaPhone = proQnaPhone;
		this.proQEnrollDate = proQEnrollDate;
		this.proAEnrollDate = proAEnrollDate;
		this.proAWriter = proAWriter;
		this.proAContent = proAContent;
		this.proName = proName;
	}

	public ProQna(int proQnaNo, String proCode, String proQnaTitle, String proQnaContent, String proQnaPwd,
			int proQnaWriterNo, String proQnaWriterName, String proQnaEmail, String proQnaPhone, Date proQEnrollDate,
			Date proAEnrollDate, String proAWriter, String proAContent) {
		super();
		this.proQnaNo = proQnaNo;
		this.proCode = proCode;
		this.proQnaTitle = proQnaTitle;
		this.proQnaContent = proQnaContent;
		this.proQnaPwd = proQnaPwd;
		this.proQnaWriterNo = proQnaWriterNo;
		this.proQnaWriterName = proQnaWriterName;
		this.proQnaEmail = proQnaEmail;
		this.proQnaPhone = proQnaPhone;
		this.proQEnrollDate = proQEnrollDate;
		this.proAEnrollDate = proAEnrollDate;
		this.proAWriter = proAWriter;
		this.proAContent = proAContent;
	}
	
	public ProQna(String proCode, String proQnaTitle, String proQnaContent, String proQnaPwd, String proQnaWriterName,
			String proQnaEmail, String proQnaPhone) {
		super();
		this.proCode = proCode;
		this.proQnaTitle = proQnaTitle;
		this.proQnaContent = proQnaContent;
		this.proQnaPwd = proQnaPwd;
		this.proQnaWriterName = proQnaWriterName;
		this.proQnaEmail = proQnaEmail;
		this.proQnaPhone = proQnaPhone;
	}

	public ProQna(int proQnaNo, String proQnaTitle, String proQnaWriterName, Date proQEnrollDate, Date proAEnrollDate,
			String proName) {
		super();
		this.proQnaNo = proQnaNo;
		this.proQnaTitle = proQnaTitle;
		this.proQnaWriterName = proQnaWriterName;
		this.proQEnrollDate = proQEnrollDate;
		this.proAEnrollDate = proAEnrollDate;
		this.proName = proName;
	}

	public int getProQnaNo() {
		return proQnaNo;
	}

	public void setProQnaNo(int proQnaNo) {
		this.proQnaNo = proQnaNo;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getProQnaTitle() {
		return proQnaTitle;
	}

	public void setProQnaTitle(String proQnaTitle) {
		this.proQnaTitle = proQnaTitle;
	}

	public String getProQnaContent() {
		return proQnaContent;
	}

	public void setProQnaContent(String proQnaContent) {
		this.proQnaContent = proQnaContent;
	}

	public String getProQnaPwd() {
		return proQnaPwd;
	}

	public void setProQnaPwd(String proQnaPwd) {
		this.proQnaPwd = proQnaPwd;
	}

	public int getProQnaWriterNo() {
		return proQnaWriterNo;
	}

	public void setProQnaWriterNo(int proQnaWriterNo) {
		this.proQnaWriterNo = proQnaWriterNo;
	}

	public String getProQnaWriterName() {
		return proQnaWriterName;
	}

	public void setProQnaWriterName(String proQnaWriterName) {
		this.proQnaWriterName = proQnaWriterName;
	}

	public String getProQnaEmail() {
		return proQnaEmail;
	}

	public void setProQnaEmail(String proQnaEmail) {
		this.proQnaEmail = proQnaEmail;
	}

	public String getProQnaPhone() {
		return proQnaPhone;
	}

	public void setProQnaPhone(String proQnaPhone) {
		this.proQnaPhone = proQnaPhone;
	}

	public Date getProQEnrollDate() {
		return proQEnrollDate;
	}

	public void setProQEnrollDate(Date proQEnrollDate) {
		this.proQEnrollDate = proQEnrollDate;
	}

	public Date getProAEnrollDate() {
		return proAEnrollDate;
	}

	public void setProAEnrollDate(Date proAEnrollDate) {
		this.proAEnrollDate = proAEnrollDate;
	}

	public String getProAWriter() {
		return proAWriter;
	}

	public void setProAWriter(String proAWriter) {
		this.proAWriter = proAWriter;
	}

	public String getProAContent() {
		return proAContent;
	}

	public void setProAContent(String proAContent) {
		this.proAContent = proAContent;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	@Override
	public String toString() {
		return "ProQna [proQnaNo=" + proQnaNo + ", proCode=" + proCode + ", proQnaTitle=" + proQnaTitle
				+ ", proQnaContent=" + proQnaContent + ", proQnaPwd=" + proQnaPwd + ", proQnaWriterNo=" + proQnaWriterNo
				+ ", proQnaWriterName=" + proQnaWriterName + ", proQnaEmail=" + proQnaEmail + ", proQnaPhone="
				+ proQnaPhone + ", proQEnrollDate=" + proQEnrollDate + ", proAEnrollDate=" + proAEnrollDate
				+ ", proAWriter=" + proAWriter + ", proAContent=" + proAContent + "]";
	}
}
