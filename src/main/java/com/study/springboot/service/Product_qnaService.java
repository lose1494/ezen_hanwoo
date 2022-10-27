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
	
	public Product_qnaDto qnaDetail(int qna_idx) {
		Product_qnaDto qnaDetail = product_qnadao.qnaDetail(qna_idx);
		return qnaDetail;
	}
	
	public int insertQna(Product_qnaDto dto) {
		int insertQna = product_qnadao.insertQna(dto);
		return insertQna;
	}
	
	public int deleteQna(int qna_idx) {
		int deleteQna = product_qnadao.deleteQna(qna_idx);
		return deleteQna;
	}
		
	public List<Product_qnaDto> joinTest() {
		List<Product_qnaDto> join = product_qnadao.joinTest();
		return join;
	}
	
        public int updateStatus(Product_qnaDto dto1) {
        int updateStatus = product_qnadao.updateStatus(dto1);
        return updateStatus;
    }

        public int qnaListCount(String users_id) {
            int qnaListCount = product_qnadao.qnaListCount(users_id);
            return qnaListCount;
        }
    /*
     * public List<Product_qnaDto> qna_List(String users_id, String page, int
     * num_page_size) {
     * List<Product_qnaDto> qna_List = product_qnadao.qna_List(users_id, page,
     * num_page_size);
     * return qna_List;
     * }
     * 
     */
}
