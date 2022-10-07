package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product_qnaDto {
	private int qna_idx;
	private String qna_id;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private int qna_secret;
	private String qna_pw;
	private String qna_status;
	private int product_idx;
	
}
