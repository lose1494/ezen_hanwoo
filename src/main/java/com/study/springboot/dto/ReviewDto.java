package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {
	private int review_idx;
	private String review_id;
	private String review_title;
	private String review_content;
	private String review_image;
	private Date review_date;
	private int review_star_rating;
	private int product_idx;
	private String product_name;
	
	private int count;
	private review_star star;
	
	public class review_star {
		private int star_score;
	}
}


