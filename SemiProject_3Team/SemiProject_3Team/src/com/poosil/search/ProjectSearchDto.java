package com.poosil.search;

import java.util.Date;

public class ProjectSearchDto {
	
	private int projectid;
	private String userid;
	private String projectmaintitle;
	private String projectsubtitle;
	private String thumbimage;
	private String projectcategory;
	private String projectstartdate;
	private String projectenddate;
	private String detaildesc;
	private Date createdat;
	private Date updatedat;
	private String address;
	private String lattitude;
	private String longitude;
	private String province;
	private int goalprice;
	private int totalprice;
	private int soldcount;
	private int likecount;
	
	
	public ProjectSearchDto() {
	
	}


	public ProjectSearchDto(int projectid, String userid, String projectmaintitle, String projectsubtitle,
			String thumbimage, String projectcategory, String projectstartdate, String projectenddate,
			String detaildesc, Date createdat, Date updatedat, String address, String lattitude, String longitude,
			String province, int goalprice, int totalprice, int soldcount, int likecount) {
		super();
		this.projectid = projectid;
		this.userid = userid;
		this.projectmaintitle = projectmaintitle;
		this.projectsubtitle = projectsubtitle;
		this.thumbimage = thumbimage;
		this.projectcategory = projectcategory;
		this.projectstartdate = projectstartdate;
		this.projectenddate = projectenddate;
		this.detaildesc = detaildesc;
		this.createdat = createdat;
		this.updatedat = updatedat;
		this.address = address;
		this.lattitude = lattitude;
		this.longitude = longitude;
		this.province = province;
		this.goalprice = goalprice;
		this.totalprice = totalprice;
		this.soldcount = soldcount;
		this.likecount = likecount;
	}


	public int getProjectid() {
		return projectid;
	}


	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getProjectmaintitle() {
		return projectmaintitle;
	}


	public void setProjectmaintitle(String projectmaintitle) {
		this.projectmaintitle = projectmaintitle;
	}


	public String getProjectsubtitle() {
		return projectsubtitle;
	}


	public void setProjectsubtitle(String projectsubtitle) {
		this.projectsubtitle = projectsubtitle;
	}


	public String getThumbimage() {
		return thumbimage;
	}


	public void setThumbimage(String thumbimage) {
		this.thumbimage = thumbimage;
	}


	public String getProjectcategory() {
		return projectcategory;
	}


	public void setProjectcategory(String projectcategory) {
		this.projectcategory = projectcategory;
	}


	public String getProjectstartdate() {
		return projectstartdate;
	}


	public void setProjectstartdate(String projectstartdate) {
		this.projectstartdate = projectstartdate;
	}


	public String getProjectenddate() {
		return projectenddate;
	}


	public void setProjectenddate(String projectenddate) {
		this.projectenddate = projectenddate;
	}


	public String getDetaildesc() {
		return detaildesc;
	}


	public void setDetaildesc(String detaildesc) {
		this.detaildesc = detaildesc;
	}


	public Date getCreatedat() {
		return createdat;
	}


	public void setCreatedat(Date createdat) {
		this.createdat = createdat;
	}


	public Date getUpdatedat() {
		return updatedat;
	}


	public void setUpdatedat(Date updatedat) {
		this.updatedat = updatedat;
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


	public int getGoalprice() {
		return goalprice;
	}


	public void setGoalprice(int goalprice) {
		this.goalprice = goalprice;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public int getSoldcount() {
		return soldcount;
	}


	public void setSoldcount(int soldcount) {
		this.soldcount = soldcount;
	}


	public int getLikecount() {
		return likecount;
	}


	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	

	}
	
	
