package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartProductDto {
		private int product_idx;
		private String product_name;
		private String product_image;
		private String product_price;
		private String product_category;
		private String product_gram;
		private String product_explanation;
	
		  private int cart_idx;
		  private String users_id;
		  private String cart_product_name;
		  private int cart_count;

}
