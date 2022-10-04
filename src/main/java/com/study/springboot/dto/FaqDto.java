package com.study.springboot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FaqDto {
	private int faq_idx;
	private String faq_title;
	private String faq_content;
	private String faq_type;
}
