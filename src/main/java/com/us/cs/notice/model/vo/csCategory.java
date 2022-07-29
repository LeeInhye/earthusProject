package com.us.cs.notice.model.vo;

public class csCategory {
	
	private int csCategoryNo;
	private String csCategoryName;
	
	public csCategory() {}
	
	public csCategory(int csCategoryNo, String csCategoryName) {
		super();
		this.csCategoryNo = csCategoryNo;
		this.csCategoryName = csCategoryName;
	}

	public int getCsCategoryNo() {
		return csCategoryNo;
	}

	public void setCsCategoryNo(int csCategoryNo) {
		this.csCategoryNo = csCategoryNo;
	}

	public String getCsCategoryName() {
		return csCategoryName;
	}

	public void setCsCategoryName(String csCategoryName) {
		this.csCategoryName = csCategoryName;
	}

	@Override
	public String toString() {
		return "csCategory [csCategoryNo=" + csCategoryNo + ", csCategoryName=" + csCategoryName + "]";
	}
	
	

}
