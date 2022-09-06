package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IWishlistDao;

public class WishlistService {
	@Autowired
	private	IWishlistDao wishlistdao;
}
