package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IUsersDao;

@Component
public class UsersService {
	@Autowired
	private	IUsersDao usersdao;
	
	public int login(String users_id, String users_pw) {
		int result = 0;
		
		result = usersdao.login( users_id, users_pw );
				
		return result;
	}
}
