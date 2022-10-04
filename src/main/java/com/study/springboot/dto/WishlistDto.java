package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishlistDto {
	private int list_idx;
	private String list_users_id;
	private String list_product_name;
	private int list_count;
}
