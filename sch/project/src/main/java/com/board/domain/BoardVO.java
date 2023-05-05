package com.board.domain;

import java.sql.Date;

public class BoardVO {
	 int id;
	 String title, singersong; 
	 //image img;
	 Date reg_user,reg_date,up_user,up_date;
	 
	 
	 public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSingersong() {
		return singersong;
	}
	public void setSingersong(String singersong) {
		this.singersong = singersong;
	}
	public Date getReg_user() {
		return reg_user;
	}
	public void setReg_user(Date reg_user) {
		this.reg_user = reg_user;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUp_user() {
		return up_user;
	}
	public void setUp_user(Date up_user) {
		this.up_user = up_user;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	
}
