package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IProduct_qnaDao;

public class Product_qnaService {
	@Autowired
	private	IProduct_qnaDao product_qnadao;
}
