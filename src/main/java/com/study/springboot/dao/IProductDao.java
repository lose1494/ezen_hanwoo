package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ProductDto;

@Mapper
public interface IProductDao {

	List<ProductDto> productlist(String product_category);

	public int product_count(String product_category);

}
