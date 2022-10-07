package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product_qna_replyDto {
	private int reply_idx;
	private String reply_name;
	private String reply_content;
	private Date reply_date;
	private int qna_idx;
	
}
