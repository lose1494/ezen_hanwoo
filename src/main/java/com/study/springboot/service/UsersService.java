package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IUsersDao;

public class UsersService {
	@Autowired
	private	IUsersDao usersdao;
}
