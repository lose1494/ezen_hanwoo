package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IWishlistDao;
import com.study.springboot.dto.WishlistDto;

@Component
public class WishlistService {
	@Autowired
	private	IWishlistDao wishlistdao;
	
	public List<WishlistDto> wishList(String users_id) {
		List<WishlistDto> wishList = wishlistdao.wishList(users_id);
		return wishList;
	}
	
	public int wishCount(String users_id) {
		int wishCount = wishlistdao.wishCount(users_id);
		return wishCount;
	}
}
