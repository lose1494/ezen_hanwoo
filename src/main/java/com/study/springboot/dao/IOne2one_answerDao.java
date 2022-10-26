package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2one_answerDto;

@Mapper
public interface IOne2one_answerDao {
    public One2one_answerDto one2oneAnswer(int one2one_idx);
    public int insertAnswer(One2one_answerDto dto);
    public int updateAnswer(One2one_answerDto dto);
    public int deleteAnswer(int answer_idx);
    public List<One2one_answerDto> one2oneList(String one2one_id, int startRowNum, int endRowNum);
}
