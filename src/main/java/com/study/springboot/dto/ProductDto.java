package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
	private int product_idx;
	private String product_name;
	private String product_price;
	private String product_sort;
	private String product_explanation;
	private String product_gram;
}
