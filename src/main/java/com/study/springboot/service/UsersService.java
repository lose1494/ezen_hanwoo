package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IUsersDao;
import com.study.springboot.dto.UsersDto;

@Component
public class UsersService {
	@Autowired
IUsersDao usersdao;
	
	public int login(String users_id, String users_pw) {
		int result = 0;
		
		result = usersdao.login( users_id, users_pw );
				
		return result;
	}

	public List<UsersDto> userList() {
		List<UsersDto> userList = usersdao.userList();
		return userList;
	}
	
	public int list_Count() {
		int list_Count = usersdao.list_Count();
		return list_Count;
	}

	public List<UsersDto> search_result(String list, String text) {
		List<UsersDto> search_result = usersdao.userList(list , text);
		return search_result;
	}

	
	
	
}
