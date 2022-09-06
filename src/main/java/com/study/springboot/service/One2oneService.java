package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IOne2oneDao;

public class One2oneService {
	@Autowired
	private	IOne2oneDao one2onedao;
}
