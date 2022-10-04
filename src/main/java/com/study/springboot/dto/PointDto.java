package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointDto {
	private int point_idx;
	private String point_users_id;
	private Date point_start_date;
	private int point;
	private Date point_end_date;
	private String point_content;
}
