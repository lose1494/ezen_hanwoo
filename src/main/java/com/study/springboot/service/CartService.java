package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dto.CartProductDto;

@Component
public class CartService {
	@Autowired
	ICartDao cartdao;
	
	public List<CartProductDto> cartList(String users_id) {
		List<CartProductDto> cartList = cartdao.cartList(users_id);
		return cartList;
	}
	
	public int cartCount(String users_id) {
		int cartCount = cartdao.cartCount(users_id);
		return cartCount;
	}
	
	public int insertCart(CartProductDto dto) {
		int insertCart = cartdao.insertCart(dto);
		return insertCart;
	}
	
	public int deleteCart(int product_idx ,String users_id ) {
		int deleteCart = cartdao.deleteCart(product_idx,users_id);
		return deleteCart;
	}
	public int updateCart(int cart_count, String users_id, int product_idx) {
		int updateCart = cartdao.updateCart(cart_count , users_id, product_idx);
		return updateCart;
	}
	public int deleteCartall(String users_id ) {
		int deleteCartall = cartdao.deleteCartall(users_id);
		return deleteCartall;
	}
}
