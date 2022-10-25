package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOrderlistDao;
import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;

@Component
public class OrderlistService {
	@Autowired
	private	IOrderlistDao orderdao;
	
	public int insertOrder(OrderlistDto dto) {
	    int insertOrder = orderdao.insertOrder(dto);
	    return insertOrder;
	}
	
	public int insertOrderDetail(OrderDetailDto dto) {
	    int insertOrderDetail = orderdao.insertOrderDetail(dto);
	    return insertOrderDetail;
	}

	public List<OrderlistDto> orderlist(String users_id) {
        List<OrderlistDto> orderlist = orderlistdao.orderlist(users_id);
        return orderlist;
    }
	public int insertOrder(OrderlistDto dto) {
        int insertOrder = orderlistdao.insertOrder(dto);
        return insertOrder;
    }
}
