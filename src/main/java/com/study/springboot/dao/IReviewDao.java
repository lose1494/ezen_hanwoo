package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReviewDto;

@Mapper
public interface IReviewDao {
	public List<ReviewDto> reviewList(String sort, String value, int startRowNum, int endRowNum);
	public int reviewCount(String sort, String value);
	public int insertReview(ReviewDto dto);
	public int deleteReview(int review_idx);
}
