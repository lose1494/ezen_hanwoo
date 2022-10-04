package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderlistDto {
	private int order_idx;
	private int order_no;
	private String order_users_id;
	private String order_product_name;
	private int order_total_price;
	private String order_comment;
	private Date order_date;
	private String order_address;
	private int order_phone;
}
