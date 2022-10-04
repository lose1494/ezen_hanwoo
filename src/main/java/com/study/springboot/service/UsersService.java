package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IUsersDao;
import com.study.springboot.dto.UsersDto;

public class UsersService {
	@Autowired
	private	IUsersDao usersdao;
	
	public List<UsersDto> member_list() {
		List<UsersDto> member_list = usersdao.member_list();
		return member_list;
	}

	
}
