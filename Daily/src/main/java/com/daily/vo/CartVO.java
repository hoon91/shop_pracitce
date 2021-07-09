package com.daily.vo;

import java.util.Date;

public class CartVO {
	
	private int cartNum;
	private String userid;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	private String gdsSize;
	
	
	
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getGdsSize() {
		return gdsSize;
	}
	public void setGdsSize(String gdsSize) {
		this.gdsSize = gdsSize;
	}
	
	
	
	
	
}
