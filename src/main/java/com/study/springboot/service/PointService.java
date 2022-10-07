package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IPointDao;
import com.study.springboot.dto.PointDto;

@Component
public class PointService {
	@Autowired
	private IPointDao pointdao;
	
	public List<PointDto> pointList(String users_id, String page, int num_page_size) {
		
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		List<PointDto> pointList = pointdao.pointList(users_id, startRowNum, endRowNum);
		return pointList;
	}
	
	public int pointSum(String users_id) {
		int pointSum = pointdao.pointSum(users_id);
		return pointSum;
	}
	
	public int pointCount(String users_id) {
		int pointCount = pointdao.pointCount(users_id);
		return pointCount;
	}
	
	public int insertPoint(PointDto dto) {
		int insertPoint = pointdao.insertPoint(dto);
		return insertPoint;
	}
	
	public int deletePoint(String users_id) {
		int deletePoint = pointdao.deletePoint(users_id);
		return deletePoint;
	}
}
