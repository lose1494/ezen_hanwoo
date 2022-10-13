package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IProduct_qnaDao;
import com.study.springboot.dto.Product_qnaDto;

@Component
public class Product_qnaService {
	@Autowired
	private	IProduct_qnaDao product_qnadao;
	
	public List<Product_qnaDto> qnaList(String sort, String value, String page, int num_page_size) {
		
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		List<Product_qnaDto> qnaList = product_qnadao.qnaList(sort, value, startRowNum, endRowNum);
		return qnaList;
	}
	
	public int qnaCount(String sort, String value) {

		int qnaCount = product_qnadao.qnaCount(sort, value);
		return qnaCount;
	}
	
	public int insertQna(Product_qnaDto dto) {
		int insertQna = product_qnadao.insertQna(dto);
		return insertQna;
	}
	
	public int deleteQna(int qna_idx) {
		int deleteQna = product_qnadao.deleteQna(qna_idx);
		return deleteQna;
	}

	public List<Product_qnaDto> qna_list() {
		List<Product_qnaDto> qna_list = product_qnadao.qna_list();
		return qna_list;
	}
	
	
}
