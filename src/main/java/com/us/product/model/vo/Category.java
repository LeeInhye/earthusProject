package com.us.product.model.vo;

public class Category {
	
	private int categoryNo;
	private String categoryName;
	private String categoryImgPath;
	
	public Category() {}

	public Category(int categoryNo, String categoryName, String categoryImgPath) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryImgPath = categoryImgPath;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryImgPath() {
		return categoryImgPath;
	}

	public void setCategoryImgPath(String categoryImgPath) {
		this.categoryImgPath = categoryImgPath;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryImgPath="
				+ categoryImgPath + "]";
	}
	
	

}
