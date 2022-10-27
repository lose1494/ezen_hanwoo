package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IFaqDao;
import com.study.springboot.dto.FaqDto;

@Component
public class FaqService {
	@Autowired
	private	IFaqDao faqdao;
	
	public List<FaqDto> faqList(String faq_type, String sort, String word, String page, int num_page_size) {
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		System.out.println(sort +","+ word);
		List<FaqDto> faqList = faqdao.faqList(faq_type, sort, word, startRowNum, endRowNum);
		return faqList;
	}
	
	public int faqCount(String faq_type, String sort, String word) {
		int faqCount = faqdao.faqCount(faq_type, sort, word);
		return faqCount;
	}
}
