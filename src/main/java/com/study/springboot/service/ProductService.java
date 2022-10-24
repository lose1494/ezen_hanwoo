package com.study.springboot.service;

import java.util.List;
import java.util.Map;

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
	
	public ProductDto productDetail(int product_idx) {
		ProductDto productDetail = productdao.productDetail(product_idx);
		return productDetail;
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

	public int product_count(String category) {
		int product_count = productdao.product_count(category);
		return product_count;
	}

	public List<ProductDto> productDetail(String product_idx) {
		List<ProductDto> productDetail = productdao.productDetail(product_idx);
		return productDetail;
	}

	public int insert_Product(ProductDto dto) {
		int insert_Product = productdao.insert_Product();
		return insert_Product;
	}

	public int revise_result(ProductDto dto) {
		int revise_result = productdao.revise_result();
		return revise_result;
	}

    public void productRegister(Map<String, String> register) {
        productdao.productRegister(register);
    }

  

}
