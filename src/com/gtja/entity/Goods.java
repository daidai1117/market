package com.gtja.entity;

/*
create table good(
	id int primary key auto_increment,
	gname varchar(1000),
	barcode varchar(255),
	price double(10,2),
	stock int,
	demo text
 */
public class Goods {
	private Integer id;
	private String gname;
	private String barcode;
	private Double price;
	private Integer stock;
	private String demo;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getDemo() {
		return demo;
	}
	public void setDemo(String demo) {
		this.demo = demo;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", gname=" + gname + ", barcode=" + barcode
				+ ", price=" + price + ", stock=" + stock + ", demo=" + demo
				+ "]";
	}
	
	
}
