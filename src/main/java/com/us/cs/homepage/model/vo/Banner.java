package com.us.cs.homepage.model.vo;

public class Banner {
	
	// 필드 영역
	private int bnNo;
	private String bnImgURL;
	private String bnStatus;
	
	// 기본 생성자
	public Banner() {
		super();
	}

	// 매개변수 생성자
	public Banner(int bnNo, String bnImgURL, String bnStatus) {
		super();
		this.bnNo = bnNo;
		this.bnImgURL = bnImgURL;
		this.bnStatus = bnStatus;
	}

	
	// Getter/Setter 
	public int getBnNo() {
		return bnNo;
	}

	public void setBnNo(int bnNo) {
		this.bnNo = bnNo;
	}

	public String getBnImgURL() {
		return bnImgURL;
	}

	public void setBnImgURL(String bnImgURL) {
		this.bnImgURL = bnImgURL;
	}

	public String getBnStatus() {
		return bnStatus;
	}

	public void setBnStatus(String bnStatus) {
		this.bnStatus = bnStatus;
	}

	
	// toString
	@Override
	public String toString() {
		return "Banner [bnNo=" + bnNo + ", bnImgURL=" + bnImgURL + ", bnStatus=" + bnStatus + "]";
	}
	
	
	

}
