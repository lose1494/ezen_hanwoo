package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IOrderlistDao;

public class OrderlistService {
	@Autowired
	private	IOrderlistDao orderlistdao;
}
