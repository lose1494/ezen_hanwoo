package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class One2oneDto {
	private int one2one_idx;
	private String one2one_name;
	private String one2one_title;
	private String one2one_content;
	private Date one2one_date;
}
