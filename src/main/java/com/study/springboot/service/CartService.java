package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dto.CartDto;

@Component
public class CartService {
	@Autowired
	private ICartDao cartdao;
	
	public List<CartDto> cartList(String users_id) {
		List<CartDto> cartList = cartdao.cartList(users_id);
		return cartList;
	}
	
	public int cartCount(String users_id) {
		int cartCount = cartdao.cartCount(users_id);
		return cartCount;
	}
	
	public int insertCart(CartDto dto) {
		int insertCart = cartdao.insertCart(dto);
		return insertCart;
	}
	
	public int deleteCart(String users_id) {
		int deleteCart = cartdao.deleteCart(users_id);
		return deleteCart;
	}
}
