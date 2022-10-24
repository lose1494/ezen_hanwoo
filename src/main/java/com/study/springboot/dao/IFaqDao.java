package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.FaqDto;

@Mapper
public interface IFaqDao {
	List<FaqDto> faqList(String faq_type, String sort, String word, int startRowNum, int endRowNum);
	int faqCount(String faq_type, String sort, String word);
	int insertFaq(FaqDto dto);
	int deleteFaq(int faq_idx);
}
