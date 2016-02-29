package com.gtja.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gtja.entity.Goods;

@Repository
public interface GoodsDao {
	public List<Goods> findAll();
	
	public Goods findByBarcode(String barcode);

}
