package com.poosil.projects.dto;

public class ProjectItemDto {
	private int projectItemSeq;
	private String projectItemName;
	private String projectItemDesc;
	private int shippingFee;
	private int quantity;
	private String thumbImage;
	private int projectId;
	
	
	public ProjectItemDto() {};
	
	public ProjectItemDto(int projectItemSeq, String projectItemName, String projectItemDesc, int shippingFee,
			int quantity, String thumbImage, int projectId) {
		super();
		this.projectItemSeq = projectItemSeq;
		this.projectItemName = projectItemName;
		this.projectItemDesc = projectItemDesc;
		this.shippingFee = shippingFee;
		this.quantity = quantity;
		this.thumbImage = thumbImage;
		this.projectId = projectId;
	}
	
	
	public int getProjectItemSeq() {
		return projectItemSeq;
	}
	public void setProjectItemSeq(int projectItemSeq) {
		this.projectItemSeq = projectItemSeq;
	}
	public String getProjectItemName() {
		return projectItemName;
	}
	public void setProjectItemName(String projectItemName) {
		this.projectItemName = projectItemName;
	}
	public String getProjectItemDesc() {
		return projectItemDesc;
	}
	public void setProjectItemDesc(String projectItemDesc) {
		this.projectItemDesc = projectItemDesc;
	}
	public int getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(int shippingFee) {
		this.shippingFee = shippingFee;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getThumbImage() {
		return thumbImage;
	}
	public void setThumbImage(String thumbImage) {
		this.thumbImage = thumbImage;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	
	
	
}
