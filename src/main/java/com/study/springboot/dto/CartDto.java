package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDto {
	private int cart_idx;
	private String users_id;
	private String cart_product_name;
	private int product_idx;
	private int cart_count;
}
