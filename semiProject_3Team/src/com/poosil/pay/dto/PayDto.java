package com.poosil.pay.dto;

import java.sql.Date;

public class PayDto {
	
	private int orderseq;
	private int quantity;
	private String userid;
	private int projectitemseq;
	private String address;
	private int phone;
	private int totalprice;
	private Date orderdate;
	
	public PayDto() {
		
	}
	
	public PayDto(int orderseq, int quantity, String userid, int projectitemseq, String address, int phone,
			int totalprice, Date orderdate) {
		
		this.orderseq = orderseq;
		this.quantity = quantity;
		this.userid = userid;
		this.projectitemseq = projectitemseq;
		this.address = address;
		this.phone = phone;
		this.totalprice = totalprice;
		this.orderdate = orderdate;
	}

	public int getOrderseq() {
		return orderseq;
	}

	public void setOrderseq(int orderseq) {
		this.orderseq = orderseq;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getProjectitemseq() {
		return projectitemseq;
	}

	public void setProjectitemseq(int projectitemseq) {
		this.projectitemseq = projectitemseq;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
}
