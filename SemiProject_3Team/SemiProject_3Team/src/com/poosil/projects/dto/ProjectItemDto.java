package com.poosil.projects.dto;

public class ProjectItemDto {
	private int projectItemSeq;
	private String projectItemName;
	private String projectItemDesc;
	private int shippingFee;
	private int quantity;
	
	private int projectId;
	private int price;
	
	public ProjectItemDto() {};
	
	public ProjectItemDto(int projectItemSeq, String projectItemName, String projectItemDesc, int shippingFee,
			int quantity,  int projectId, int price) {
		super();
		this.projectItemSeq = projectItemSeq;
		this.projectItemName = projectItemName;
		this.projectItemDesc = projectItemDesc;
		this.shippingFee = shippingFee;
		this.quantity = quantity;
		
		this.projectId = projectId;
		this.price = price;
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
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
