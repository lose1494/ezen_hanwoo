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
	
	public List<PointDto> pointList(String users_id) {
		List<PointDto> pointList = pointdao.pointList(users_id);
		return pointList;
	}
	
	public int pointSum() {
		int pointSum = pointdao.pointSum();
		return pointSum;
	}
}
