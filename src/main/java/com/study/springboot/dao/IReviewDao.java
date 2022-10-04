package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReviewDto;

@Mapper
public interface IReviewDao {
	public List<ReviewDto> reviewList(String category, String param);
	public int insertReview(ReviewDto dto);
	public int deleteReview(int review_idx);
}
