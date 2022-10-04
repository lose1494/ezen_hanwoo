package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.UsersDto;

@Mapper
public interface IUsersDao {
	public List<UsersDto> userList();
	public UsersDto userDetail();
	public int login(String users_id, String users_pw);
	public int joinUser(UsersDto dto);
	public int deleteUser(int users_idx);
}
