package com.gtja.entity;

import java.sql.Timestamp;
import java.util.Date;


/*
	id int primary key auto_increment,
	name varchar(255),
	phone varchar(255),
	amt double(10,2) default 0,
	jifen double(10,2) default 0,
	flag varchar(20) default "true",
	cdate timestamp DEFAULT now()
	demo...
 */
public class Member {
	
	private Integer id;
	private String name;
	private String phone;
	private Double amt;
	private Double jifen;
	private String flag;
	private Timestamp cdate;
	private String demo;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Double getAmt() {
		return amt;
	}
	public void setAmt(Double amt) {
		this.amt = amt;
	}
	public Double getJifen() {
		return jifen;
	}
	public void setJifen(Double jifen) {
		this.jifen = jifen;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	
	public String getDemo() {
		return demo;
	}
	public void setDemo(String demo) {
		this.demo = demo;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", phone=" + phone
				+ ", amt=" + amt + ", jifen=" + jifen + ", flag=" + flag
				+ ", cdate=" + cdate + ", demo=" + demo + "]";
	}
}
