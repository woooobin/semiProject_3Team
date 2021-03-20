package com.poosil.projects.dto;

import java.util.Date;

public class ProjectDto {
	private String projectId;
	private String userId;
	private String projectMainTitle;
	private String projectSubTitle;
	private String thumbImage;
	private String projectCategory;
	private Date projectStartDate;
	private Date projectEndDate;
	private Date shippingStartDate;
	private String detailDesc;
	private Date createdAt;
	private Date updatedAt;
	private String address;
	private String lattitude;
	private String longitude;
	private String province;
	private int goalPrice;
	private int totalPrice;
	private int soldCount;
	private int likeCount;
	
	public ProjectDto() {
		
	}
	public ProjectDto(String projectId, String userId, String projectMainTitle, String projectSubTitle,
			String thumbImage, String projectCategory, Date projectStartDate, Date projectEndDate,
			Date shippingStartDate, String detailDesc, Date createdAt, Date updatedAt, String address, String lattitude,
			String longitude, String province, int goalPrice, int totalPrice, int soldCount, int likeCount) {
		super();
		this.projectId = projectId;
		this.userId = userId;
		this.projectMainTitle = projectMainTitle;
		this.projectSubTitle = projectSubTitle;
		this.thumbImage = thumbImage;
		this.projectCategory = projectCategory;
		this.projectStartDate = projectStartDate;
		this.projectEndDate = projectEndDate;
		this.shippingStartDate = shippingStartDate;
		this.detailDesc = detailDesc;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.address = address;
		this.lattitude = lattitude;
		this.longitude = longitude;
		this.province = province;
		this.goalPrice = goalPrice;
		this.totalPrice = totalPrice;
		this.soldCount = soldCount;
		this.likeCount = likeCount;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectMainTitle() {
		return projectMainTitle;
	}
	public void setProjectMainTitle(String projectMainTitle) {
		this.projectMainTitle = projectMainTitle;
	}
	public String getProjectSubTitle() {
		return projectSubTitle;
	}
	public void setProjectSubTitle(String projectSubTitle) {
		this.projectSubTitle = projectSubTitle;
	}
	public String getThumbImage() {
		return thumbImage;
	}
	public void setThumbImage(String thumbImage) {
		this.thumbImage = thumbImage;
	}
	public String getProjectCategory() {
		return projectCategory;
	}
	public void setProjectCategory(String projectCategory) {
		this.projectCategory = projectCategory;
	}
	public Date getProjectStartDate() {
		return projectStartDate;
	}
	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public Date getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(Date projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	public Date getShippingStartDate() {
		return shippingStartDate;
	}
	public void setShippingStartDate(Date shippingStartDate) {
		this.shippingStartDate = shippingStartDate;
	}
	public String getDetailDesc() {
		return detailDesc;
	}
	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLattitude() {
		return lattitude;
	}
	public void setLattitude(String lattitude) {
		this.lattitude = lattitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public int getGoalPrice() {
		return goalPrice;
	}
	public void setGoalPrice(int goalPrice) {
		this.goalPrice = goalPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getSoldCount() {
		return soldCount;
	}
	public void setSoldCount(int soldCount) {
		this.soldCount = soldCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
