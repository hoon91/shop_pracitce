package com.daily.vo;

import java.util.Date;

public class ReplyVO {
	
	private int gdsNum;
	private String userid;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [gdsNum=" + gdsNum + ", userid=" + userid + ", repNum=" + repNum + ", repCon=" + repCon
				+ ", repDate=" + repDate + ", getGdsNum()=" + getGdsNum() + ", getUserid()=" + getUserid()
				+ ", getRepNum()=" + getRepNum() + ", getRepCon()=" + getRepCon() + ", getRepDate()=" + getRepDate()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
