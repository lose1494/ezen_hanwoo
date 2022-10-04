package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IUsersDao;
import com.study.springboot.dto.UsersDto;

@Component
public class UsersService {
	@Autowired
	private	IUsersDao usersdao;
	
	public List<UsersDto> member_list() {
		List<UsersDto> member_list = usersdao.member_list();
		return member_list;
	}

	
	public int login(String users_id, String users_pw) {
		int result = 0;
		
		result = usersdao.login( users_id, users_pw );
				
		return result;
	}
}
