package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IUsersDao;
import com.study.springboot.dto.UsersDto;

@Component
public class UsersService {
	@Autowired
	private	IUsersDao usersdao;
	
	public List<UsersDto> member_list() {
		List<UsersDto> member_list = usersdao.userList();
		return member_list;
	}

	public UsersDto userDetail( String users_id ) {
		UsersDto userDetail = usersdao.userDetail(users_id);
		return userDetail;
	}
	
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
		List<UsersDto> search_result = usersdao.search_result(list , text);
		return search_result;
	}

	public int joinUser(UsersDto dto) {
		int userJoin = usersdao.joinUser(dto);
		return userJoin;
	}
	
	public int updateUser(UsersDto dto) {
		int userUpdate = usersdao.updateUser(dto);
		return userUpdate;
	}	
	   
    public int updatePoint(String users_id) {
        int updatePoint = usersdao.updatePoint(users_id);
        return updatePoint;
    }
    
	public int deleteUser(String users_id, String users_pw) {
		int userDelete = usersdao.deleteUser(users_id, users_pw);
		return userDelete;
	}

	public List<UsersDto> user_Detail(String users_id) {
		List<UsersDto> user_Detail = usersdao.user_Dtail(users_id);
		return user_Detail;
	}

	public int id_check_result(String users_id) {
		int id_check_result = usersdao.id_check_result(users_id);
		return id_check_result;
	}

	public int joinAction( Map<String, String> param) {
		int memberJoin = usersdao.joinAction( param );
		return memberJoin;
	}

    public Map<String, String> find(Map<String, String> param) {
        return usersdao.find(param);
    }
    public int updatepoint (String users_point, String users_id) {
        int updatepoint = usersdao.updatepoint(users_point, users_id);
        return updatepoint;
    }
}
