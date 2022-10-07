package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IProductDao;
import com.study.springboot.dto.ProductDto;
@Component
public class ProductService {
	@Autowired
	private	IProductDao productdao;
	
	public List<ProductDto> productlist(String category) {
		List<ProductDto> productlist = productdao.productlist(category);
		return productlist;
	}
	public int product_count(String category) {
		int product_count = productdao.product_count(category);
		return product_count;
	}
}
