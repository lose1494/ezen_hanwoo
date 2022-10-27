package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IProduct_qna_replyDao;
import com.study.springboot.dto.Product_qna_replyDto;
@Component
public class Product_qna_replyService {
	@Autowired
	private	IProduct_qna_replyDao product_qna_replydao;
	
	   public List<Product_qna_replyDto> joinTest() {
	        List<Product_qna_replyDto> join = product_qna_replydao.joinTest();
	        return join;
	    }

	    public List<Product_qna_replyDto> qna_List(String one2one_id, String page, int num_page_size){
	        
	        int num_page_no = Integer.parseInt( page );
	        int startRowNum = (num_page_no - 1) * num_page_size + 1;
	        int endRowNum = (num_page_no * num_page_size);
	        
	        List<Product_qna_replyDto> qna_List = product_qna_replydao.qna_List(one2one_id, startRowNum, endRowNum);
	        return qna_List;
	    }

	    public int insertReply(Product_qna_replyDto dto) {
	        int insertReply = product_qna_replydao.insertReply(dto);
	        return insertReply;
	    }

	    public int updateAnswer(Product_qna_replyDto dto) {
	        int updateAnswer = product_qna_replydao.updateAnswer(dto);
	        return updateAnswer;
	    }

	    public int deleteAnswer(int reply_idx) {
	        int deleteAnswer = product_qna_replydao.deleteAnswer(reply_idx);
	        return deleteAnswer;
	    }


	
}
