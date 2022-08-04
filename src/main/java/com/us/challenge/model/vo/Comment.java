package com.us.challenge.model.vo;

public class Comment {
	
	private int cmntNo;
	private int challNo;
	private String cmntWriter; // 작성기능시 회원번호 | 조회기능시 회원이름
	private String cmntContent;
	private String cmntEnrollDate;
	private String cmntStatus;

	public Comment() {}

	public Comment(int cmntNo, int challNo, String cmntWriter, String cmntContent, String cmntEnrollDate, String cmntStatus) {
		super();
		this.cmntNo = cmntNo;
		this.challNo = challNo;
		this.cmntWriter = cmntWriter;
		this.cmntContent = cmntContent;
		this.cmntEnrollDate = cmntEnrollDate;
		this.cmntStatus = cmntStatus;
	}

	public Comment(int cmntNo, String cmntWriter, String cmntContent, String cmntEnrollDate, String cmntStatus) {
		super();
		this.cmntNo = cmntNo;
		this.cmntWriter = cmntWriter;
		this.cmntContent = cmntContent;
		this.cmntEnrollDate = cmntEnrollDate;
		this.cmntStatus = cmntStatus;
	}

	public int getCmntNo() {
		return cmntNo;
	}

	public void setCmntNo(int cmntNo) {
		this.cmntNo = cmntNo;
	}

	public int getChallNo() {
		return challNo;
	}

	public void setChallNo(int challNo) {
		this.challNo = challNo;
	}

	public String getCmntWriter() {
		return cmntWriter;
	}

	public void setCmntWriter(String cmntWriter) {
		this.cmntWriter = cmntWriter;
	}

	public String getCmntContent() {
		return cmntContent;
	}

	public void setCmntContent(String cmntContent) {
		this.cmntContent = cmntContent;
	}

	public String getCmntEnrollDate() {
		return cmntEnrollDate;
	}

	public void setCmntEnrollDate(String cmntEnrollDate) {
		this.cmntEnrollDate = cmntEnrollDate;
	}

	public String getCmntStatus() {
		return cmntStatus;
	}

	public void setCmntStatus(String cmntStatus) {
		this.cmntStatus = cmntStatus;
	}

	@Override
	public String toString() {
		return "Comment [cmntNo=" + cmntNo + ", challNo=" + challNo + ", cmntWriter=" + cmntWriter + ", cmntContent="
				+ cmntContent + ", cmntEnrollDate=" + cmntEnrollDate + ", cmntStatus=" + cmntStatus + "]";
	}

}
