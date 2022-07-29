package com.us.cs.homepage.model.vo;

public class Banner {
	
	// 필드 영역
	private int bnNo;
	private String bnImgSrc;
	private String bnStatus;
	
	// 기본 생성자
	public Banner() {
		super();
	}

	// 매개변수 생성자
	public Banner(int bnNo, String bnImgSrc, String bnStatus) {
		super();
		this.bnNo = bnNo;
		this.bnImgSrc = bnImgSrc;
		this.bnStatus = bnStatus;
	}

	
	// Getter/Setter 
	public int getBnNo() {
		return bnNo;
	}

	public void setBnNo(int bnNo) {
		this.bnNo = bnNo;
	}

	public String getBnImgSrc() {
		return bnImgSrc;
	}

	public void setBnImgSrc(String bnImgSrc) {
		this.bnImgSrc = bnImgSrc;
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
		return "Banner [bnNo=" + bnNo + ", bnImgSrc=" + bnImgSrc + ", bnStatus=" + bnStatus + "]";
	}
	
	
	

}
