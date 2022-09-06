package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.ICartDao;

public class CartService {
	@Autowired
	private ICartDao cartdao;
}
