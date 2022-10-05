package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.WishlistDto;

@Mapper
public interface IWishlistDao {
	public List<WishlistDto> wishList(String users_id);
	public int wishCount(String users_id);
}
