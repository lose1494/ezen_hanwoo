package com.study.springboot.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_idx;
	private String notice_name;
	private String notice_title;
	private String notice_content;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date notice_date;
	private String notice_img;
		
}
