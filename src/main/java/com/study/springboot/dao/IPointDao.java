package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.PointDto;

@Mapper
public interface IPointDao {
	public List<PointDto> pointList(String point_users_id, int startRowNum, int endRowNum);
	public int pointSum(String point_users_id);
	public int pointCount(String point_usres_id);
	public int insertPoint(PointDto dto);
	public int deletePoint(String point_users_id);
}
