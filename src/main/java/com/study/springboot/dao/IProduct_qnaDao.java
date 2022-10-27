package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Product_qnaDto;
import com.study.springboot.dto.Product_qna_replyDto;

@Mapper
public interface IProduct_qnaDao {
	public List<Product_qnaDto> qnaList(String sort, String value, int startRowNum, int endRowNum);
	public int qnaCount(String sort, String value);
	public Product_qnaDto qnaDetail(int qna_idx);
	public int insertQna(Product_qnaDto dto);
	public int deleteQna(int qna_idx);
	public List<Product_qnaDto> joinTest();
    public List<Product_qna_replyDto> qna_List(String users_id, String page, int num_page_size);
    public int updateStatus(Product_qnaDto dto1);
    public int qnaListCount(String users_id);
}
