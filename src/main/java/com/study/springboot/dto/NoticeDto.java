package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_idx;
	private String notice_name;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_img;
		
}
