package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2oneDto;

@Mapper
public interface IOne2oneDao {
//	public List<One2oneDto> one2oneList(String one2one_id, int startRowNum, int endRowNum);
	public One2oneDto one2oneDetail(int one2one_idx);
	public int one2oneCount(String one2one_id);
	public int insertOne2one(One2oneDto dto);
	public int updateStatus(One2oneDto dto);
	public int deleteOne2one(int one2one_idx);
}
