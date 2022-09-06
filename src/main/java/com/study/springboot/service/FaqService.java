package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IFaqDao;

public class FaqService {
	@Autowired
	private	IFaqDao faqdao;
}
