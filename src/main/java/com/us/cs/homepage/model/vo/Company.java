package com.us.cs.homepage.model.vo;

import java.util.Date;

public class Company {
	private int comNo;
	private int comCategory;
	private String comContent;
	private Date comUpdateDate;
	
	
	public Company() {
		super();
	}

	public Company(int comNo, int comCategory, String comContent, Date comUpdateDate) {
		super();
		this.comNo = comNo;
		this.comCategory = comCategory;
		this.comContent = comContent;
		this.comUpdateDate = comUpdateDate;
	}


	public int getComNo() {
		return comNo;
	}


	public void setComNo(int comNo) {
		this.comNo = comNo;
	}


	public int getComCategory() {
		return comCategory;
	}


	public void setComCategory(int comCategory) {
		this.comCategory = comCategory;
	}


	public String getComContent() {
		return comContent;
	}


	public void setComContent(String comContent) {
		this.comContent = comContent;
	}


	public Date getComUpdateDate() {
		return comUpdateDate;
	}


	public void setComUpdateDate(Date comUpdateDate) {
		this.comUpdateDate = comUpdateDate;
	}


	@Override
	public String toString() {
		return "Company [comNo=" + comNo + ", comCategory=" + comCategory + ", comContent=" + comContent
				+ ", comUpdateDate=" + comUpdateDate + "]";
	}	
	
	
	
	
	

}
