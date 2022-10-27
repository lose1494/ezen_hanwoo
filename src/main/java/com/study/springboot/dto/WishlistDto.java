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
	private int list_product_idx;
	private int list_count;
}
