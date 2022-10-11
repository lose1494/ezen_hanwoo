package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.UsersDto;

@Mapper
public interface IUsersDao {
	
	public List<UsersDto> userList();
	public UsersDto userDetail(String users_id);
	public int login(String users_id, String users_pw);
	public int joinUser(UsersDto dto);
	public int deleteUser(int users_idx);
	public int list_Count();
	public List<UsersDto> userList(String list, String text);
	public int updateUser(UsersDto dto);
	public int deleteUser(String users_id, String users_pw);
	public List<UsersDto> user_Dtail(String users_id);
}
