package com.us.cs.faq.model.vo;

import java.sql.Date;

public class Faq {
	
	private int faqNo;
	private String faqWriter;
	private String csCategory;
	private String faqTitle;
	private String faqContent;
	private Date faqEnrollDate;
	private String faqStatus;
	
	public Faq() {}

	public Faq(int faqNo, String faqWriter, String csCategory, String faqTitle, String faqContent, Date faqEnrollDate,
			String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.csCategory = csCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqEnrollDate = faqEnrollDate;
		this.faqStatus = faqStatus;
	}
	

	public Faq(int faqNo, String faqWriter, String csCategory, String faqTitle, String faqContent, Date faqEnrollDate) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.csCategory = csCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqEnrollDate = faqEnrollDate;
	}

	

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getCsCategory() {
		return csCategory;
	}

	public void setCsCategory(String csCategory) {
		this.csCategory = csCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqEnrollDate() {
		return faqEnrollDate;
	}

	public void setFaqEnrollDate(Date faqEnrollDate) {
		this.faqEnrollDate = faqEnrollDate;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", csCategory=" + csCategory + ", faqTitle="
				+ faqTitle + ", faqContent=" + faqContent + ", faqEnrollDate=" + faqEnrollDate + ", faqStatus="
				+ faqStatus + "]";
	}
	

}
