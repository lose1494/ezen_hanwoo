package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IProductDao;

public class ProductService {
	@Autowired
	private	IProductDao productdao;
}
