package com.us.cs.model.vo;

public class CsCategory {
	private int csNo;
	private String csName;
	
	public CsCategory() {}

	public CsCategory(int csNo, String csName) {
		super();
		this.csNo = csNo;
		this.csName = csName;
	}

	public int getCsNo() {
		return csNo;
	}

	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}

	public String getCsName() {
		return csName;
	}

	public void setCsName(String csName) {
		this.csName = csName;
	}

	@Override
	public String toString() {
		return "CsCategory [csNo=" + csNo + ", csName=" + csName + "]";
	}
	

}
