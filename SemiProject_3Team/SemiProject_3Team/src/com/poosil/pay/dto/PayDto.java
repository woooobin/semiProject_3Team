package com.poosil.pay.dto;

import java.util.Date;

public class PayDto {
	
	private int orderSeq;
	private int quantity;
	private String userId;
	private int projectItemSeq;
	private String address;
	private int phone;
	private int totalPrice;
	private int price;
	private Date orderDate;
	
	public PayDto() {
		
	}

	public PayDto(int orderSeq, int quantity, String userId, int projectItemSeq, String address, int phone,
			int totalPrice, int price, Date orderDate) {
		this.orderSeq = orderSeq;
		this.quantity = quantity;
		this.userId = userId;
		this.projectItemSeq = projectItemSeq;
		this.address = address;
		this.phone = phone;
		this.totalPrice = totalPrice;
		this.price = price;
		this.orderDate = orderDate;
	}

	public int getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProjectItemSeq() {
		return projectItemSeq;
	}

	public void setProjectItemSeq(int projectItemSeq) {
		this.projectItemSeq = projectItemSeq;
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
	
		
	
}
