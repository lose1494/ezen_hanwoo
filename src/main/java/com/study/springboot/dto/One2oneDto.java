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
	private String one2one_id;
	private String one2one_title;
	private String one2one_content;
	private String one2one_image;
	private String one2one_email;
	private String one2one_phone;
	private Date one2one_date;
	private String one2one_status;
}
