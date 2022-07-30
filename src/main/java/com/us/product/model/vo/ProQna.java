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
	private Date proQnaQEnrollDate;
	private Date proQnaAEnrollDate;
	private String proQnaAwriter;
	private String proQnaAcontent;

	public ProQna() {}

	public ProQna(int proQnaNo, String proCode, String proQnaTitle, String proQnaContent, String proQnaPwd,
			int proQnaWriterNo, String proQnaWriterName, String proQnaEmail, String proQnaPhone, Date proQnaQEnrollDate,
			Date proQnaAEnrollDate, String proQnaAwriter, String proQnaAcontent) {
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
		this.proQnaQEnrollDate = proQnaQEnrollDate;
		this.proQnaAEnrollDate = proQnaAEnrollDate;
		this.proQnaAwriter = proQnaAwriter;
		this.proQnaAcontent = proQnaAcontent;
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

	public Date getProQnaQEnrollDate() {
		return proQnaQEnrollDate;
	}

	public void setProQnaQEnrollDate(Date proQnaQEnrollDate) {
		this.proQnaQEnrollDate = proQnaQEnrollDate;
	}

	public Date getProQnaAEnrollDate() {
		return proQnaAEnrollDate;
	}

	public void setProQnaAEnrollDate(Date proQnaAEnrollDate) {
		this.proQnaAEnrollDate = proQnaAEnrollDate;
	}

	public String getProQnaAwriter() {
		return proQnaAwriter;
	}

	public void setProQnaAwriter(String proQnaAwriter) {
		this.proQnaAwriter = proQnaAwriter;
	}

	public String getProQnaAcontent() {
		return proQnaAcontent;
	}

	public void setProQnaAcontent(String proQnaAcontent) {
		this.proQnaAcontent = proQnaAcontent;
	}

	@Override
	public String toString() {
		return "ProQna [proQnaNo=" + proQnaNo + ", proCode=" + proCode + ", proQnaTitle=" + proQnaTitle
				+ ", proQnaContent=" + proQnaContent + ", proQnaPwd=" + proQnaPwd + ", proQnaWriterNo=" + proQnaWriterNo
				+ ", proQnaWriterName=" + proQnaWriterName + ", proQnaEmail=" + proQnaEmail + ", proQnaPhone="
				+ proQnaPhone + ", proQnaQEnrollDate=" + proQnaQEnrollDate + ", proQnaAEnrollDate=" + proQnaAEnrollDate
				+ ", proQnaAwriter=" + proQnaAwriter + ", proQnaAcontent=" + proQnaAcontent + "]";
	}
}
