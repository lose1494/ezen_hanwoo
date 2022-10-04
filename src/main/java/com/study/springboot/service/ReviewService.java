package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.ReviewDto;

public class ReviewService {
	@Autowired
	private	IReviewDao reviewdao;
	
	public List<ReviewDto> reviewList(String category, String param) {
		List<ReviewDto> reviewList = reviewdao.reviewList(category, param);
		return reviewList;
	}
}
