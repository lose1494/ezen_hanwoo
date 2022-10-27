package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class One2one_answerDto {
	private int answer_idx;
	private String answer_id;
	private String answer_content;
	private Date answer_date;
	private int one2one_idx;
	
	private One2oneDto one2oneDto;
}
