package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOne2one_answerDao;
import com.study.springboot.dto.One2one_answerDto;

@Component
public class One2one_answerService {
    @Autowired
	private IOne2one_answerDao one2one_answerdao;
	
	public One2one_answerDto one2oneAnswer(int one2one_idx) {
	    One2one_answerDto one2oneAnswer = one2one_answerdao.one2oneAnswer(one2one_idx);
	    return one2oneAnswer;
	}
	
	public int insertAnswer(One2one_answerDto dto) {
	    int insertAnswer = one2one_answerdao.insertAnswer(dto);
	    return insertAnswer;
	}
	
	public int updateAnswer(One2one_answerDto dto) {
        int updateAnswer = one2one_answerdao.updateAnswer(dto);
        return updateAnswer;
    }
	
	public int deleteAnswer(int answer_idx) {
	    int deleteAnswer = one2one_answerdao.deleteAnswer(answer_idx);
	    return deleteAnswer;
	}
	
	public List<One2one_answerDto> one2oneList(String one2one_id, String page, int num_page_size){
        
        int num_page_no = Integer.parseInt( page );
        int startRowNum = (num_page_no - 1) * num_page_size + 1;
        int endRowNum = (num_page_no * num_page_size);
        
        List<One2one_answerDto> one2oneList = one2one_answerdao.one2oneList(one2one_id, startRowNum, endRowNum);
        return one2oneList;
    }
}
