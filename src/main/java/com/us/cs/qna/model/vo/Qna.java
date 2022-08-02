package com.us.cs.qna.model.vo;

import java.sql.Date;

public class Qna {
	
	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private String qnaFile;
	private String qnaEmail;
	private String qnaPhone;
	private String qnaPwd;
	private String qnaAnsWriter;
	private String qnaAnswer;
	private Date qnaEnrollDate;
	private String qnaStatus;
	
	public Qna() {}

	public Qna(int qnaNo, String qnaWriter, String qnaTitle, String qnaContent, String qnaFile, String qnaEmail,
			String qnaPhone, String qnaPwd, String qnaAnsWriter, String qnaAnswer, Date qnaEnrollDate,
			String qnaStatus) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaEmail = qnaEmail;
		this.qnaPhone = qnaPhone;
		this.qnaPwd = qnaPwd;
		this.qnaAnsWriter = qnaAnsWriter;
		this.qnaAnswer = qnaAnswer;
		this.qnaEnrollDate = qnaEnrollDate;
		this.qnaStatus = qnaStatus;
	}

	public Qna(int qnaNo, String qnaWriter, String qnaTitle, String qnaContent, String qnaFile, String qnaEmail,
			String qnaPhone, String qnaPwd, String qnaAnsWriter, String qnaAnswer, Date qnaEnrollDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaEmail = qnaEmail;
		this.qnaPhone = qnaPhone;
		this.qnaPwd = qnaPwd;
		this.qnaAnsWriter = qnaAnsWriter;
		this.qnaAnswer = qnaAnswer;
		this.qnaEnrollDate = qnaEnrollDate;
	}
	
	

	public Qna(int qnaNo, String qnaWriter, String qnaTitle, String qnaContent, String qnaFile, String qnaEmail,
			String qnaPhone, String qnaPwd, String qnaAnswer, Date qnaEnrollDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaEmail = qnaEmail;
		this.qnaPhone = qnaPhone;
		this.qnaPwd = qnaPwd;
		this.qnaAnswer = qnaAnswer;
		this.qnaEnrollDate = qnaEnrollDate;
	}
	
	public Qna(int qnaNo, String qnaWriter, String qnaTitle, String qnaContent, String qnaFile, String qnaAnswer,
			Date qnaEnrollDate, String qnaStatus) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaAnswer = qnaAnswer;
		this.qnaEnrollDate = qnaEnrollDate;
		this.qnaStatus = qnaStatus;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaFile() {
		return qnaFile;
	}

	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}

	public String getQnaEmail() {
		return qnaEmail;
	}

	public void setQnaEmail(String qnaEmail) {
		this.qnaEmail = qnaEmail;
	}

	public String getQnaPhone() {
		return qnaPhone;
	}

	public void setQnaPhone(String qnaPhone) {
		this.qnaPhone = qnaPhone;
	}

	public String getQnaPwd() {
		return qnaPwd;
	}

	public void setQnaPwd(String qnaPwd) {
		this.qnaPwd = qnaPwd;
	}

	public String getQnaAnsWriter() {
		return qnaAnsWriter;
	}

	public void setQnaAnsWriter(String qnaAnsWriter) {
		this.qnaAnsWriter = qnaAnsWriter;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public Date getQnaEnrollDate() {
		return qnaEnrollDate;
	}

	public void setQnaEnrollDate(Date qnaEnrollDate) {
		this.qnaEnrollDate = qnaEnrollDate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaWriter=" + qnaWriter + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaFile=" + qnaFile + ", qnaEmail=" + qnaEmail + ", qnaPhone=" + qnaPhone
				+ ", qnaPwd=" + qnaPwd + ", qnaAnsWriter=" + qnaAnsWriter + ", qnaAnswer=" + qnaAnswer
				+ ", qnaEnrollDate=" + qnaEnrollDate + ", qnaStatus=" + qnaStatus + "]";
	}

	
	

}
