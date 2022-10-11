package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.ReviewDto;

@Component
public class ReviewService {
	@Autowired
	private	IReviewDao reviewdao;
	
	public List<ReviewDto> reviewList(String category, String value, String page, int num_page_size) {
		
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		List<ReviewDto> reviewList = reviewdao.reviewList(category, value, startRowNum, endRowNum);
		return reviewList;
	}
	
	public int reviewCount(String sort, String value) {
		int reviewCount = reviewdao.reviewCount(sort, value);
		return reviewCount;
	}
	
	public double reviewAvg(int product_idx) {
		double reviewAvg = reviewdao.reviewAvg(product_idx);
		return reviewAvg;
	}
	
	public int insertReview(ReviewDto dto) {
		int insertReview = reviewdao.insertReview(dto);
		return insertReview;
	}
	
	public int deleteReview(int review_idx) {
		int deleteReview = reviewdao.deleteReview(review_idx);
		return deleteReview;
	}
}
