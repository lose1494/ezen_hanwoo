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

	public List<ProductDto> item_list() {
		List<ProductDto> item_list = productdao.item_list();
		return item_list;
	}

	public int item_Count() {
		int item_Count = productdao.item_Count();
		return item_Count;
	}

	public List<ProductDto> item_result(String search, String text) {
		List<ProductDto> item_result = productdao.item_result(search,text);
		return item_result;
	}

	public int deleteProduct(int idx) {
		int deleteProduct = productdao.deleteProduct(idx);
		return deleteProduct;
	}


	
}
