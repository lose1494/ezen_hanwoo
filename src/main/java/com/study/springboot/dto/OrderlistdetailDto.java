package com.study.springboot.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderlistdetailDto {
    private int order_idx;
    private String order_no;
    private String users_id;    
    private String order_total_price;
    private String order_comment;
    private String order_product_name;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date order_date;
    private String order_recipient;
    private String order_address1;
    private String order_address2;
    private String order_address3;
    private String order_phone;
    private String order_usepoint;
    private int detail_idx;
    private int product_idx;
    private int product_count;
    private String product_price;
    private String pay_method;
}
