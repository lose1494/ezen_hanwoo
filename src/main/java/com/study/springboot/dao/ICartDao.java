package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.CartProductDto;

@Mapper
public interface ICartDao {
	public List<CartProductDto> cartList(String users_id);
	public int cartCount(String users_id);
	public int insertCart(CartProductDto dto);
	public int deleteCart(int product_idx ,String users_id);
	public int updateCart(int cart_count, String users_id, int product_idx);
	public int deleteCartall(String users_id);
}