package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.UsersDto;

@Mapper
public interface IUsersDao {
	
	//회원 목록
	public List<UsersDto> member_list();

}
