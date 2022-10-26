package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDto {
    private int detail_idx;
    private String order_no;
    private int product_idx;
    private int product_count;
    private String product_price;
    private String pay_method;
}
