package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Product_qna_replyDto;

@Mapper
public interface IProduct_qna_replyDao {
    
    public int insertReply(Product_qna_replyDto dto);
    public int updateAnswer(Product_qna_replyDto dto);
    public int deleteAnswer(int reply_idx);
    public List<Product_qna_replyDto> joinTest();
    public List<Product_qna_replyDto> qna_List(String one2one_id, int startRowNum, int endRowNum);
}
