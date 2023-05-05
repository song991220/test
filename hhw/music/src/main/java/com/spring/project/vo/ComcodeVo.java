package com.spring.project.vo;

import java.sql.Date;

public class ComcodeVo {
	String groupcd, code, value, delyn, reg_user, up_user; 
	Date reg_date,up_date;
	
	public String getGroupcd() {
		return groupcd;
	}
	public void setGroupcd(String groupcd) {
		this.groupcd = groupcd;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getUp_user() {
		return up_user;
	}
	public void setUp_user(String up_user) {
		this.up_user = up_user;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	@Override
	public String toString() {
		return "ComcodeVo [groupcd=" + groupcd + ", code=" + code + ", value=" + value + ", delyn=" + delyn
				+ ", reg_user=" + reg_user + ", up_user=" + up_user + ", reg_date=" + reg_date + ", up_date=" + up_date
				+ "]";
	}
	
}
