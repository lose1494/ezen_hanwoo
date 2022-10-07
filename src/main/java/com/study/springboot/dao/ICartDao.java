package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.CartDto;

@Mapper
public interface ICartDao {
	public List<CartDto> cartList(String users_id);
	public int cartCount(String users_id);
	public int insertCart(CartDto dto);
	public int deleteCart(int users_idx);
}
