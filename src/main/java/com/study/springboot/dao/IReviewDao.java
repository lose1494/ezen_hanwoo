package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReviewDto;

@Mapper
public interface IReviewDao {
	public List<ReviewDto> reviewList(String standard, String value, 
			                          int startRowNum, int endRowNum, String sort, String word);
	public int reviewCount(String sort, String value, String word);
	public double reviewAvg(int product_idx);
	public List<ReviewDto> reviewGraph(int product_idx);
	public int insertReview(ReviewDto dto);
	public int deleteReview(int review_idx);
	public List<ReviewDto> review_result();
//	List<ReviewDto> searchProduct(String word, String sort);
    public int review_count();
    public List<ReviewDto> reviewResult(String searchType, String searchKeyword);
    public List<ReviewDto> reviewDate(String searchType, String searchKeyword,String fromDate, String toDate);
}
