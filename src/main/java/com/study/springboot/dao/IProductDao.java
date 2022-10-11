package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ProductDto;


@Mapper
public interface IProductDao {

	List<ProductDto> productlist(String product_category);
	
	ProductDto productDetail(int product_idx);

	List<ProductDto> item_list();

	int item_Count();

	List<ProductDto> item_result(String search, String text);

	int deleteProduct(int idx);
	
	public int product_count(String product_category);

	List<ProductDto> productDetail(String product_idx);
	
	

}
