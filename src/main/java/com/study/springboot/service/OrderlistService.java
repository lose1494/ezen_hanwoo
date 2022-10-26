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
	
	public List<OrderlistDto> orderList(String users_id) {
	    List<OrderlistDto> orderList = orderdao.orderList(users_id);
	    return orderList;
	}
	
	public OrderlistDto orderDto(String order_no) {	    
	    OrderlistDto orderDto = orderdao.orderDto(order_no);
	    return orderDto;
	}
	
	public List<OrderDetailDto> detailList(String order_no) {
	    List<OrderDetailDto> detailList = orderdao.detailList(order_no);
	    return detailList;
	}
	
	public int insertOrder(OrderlistDto dto) {
	    int insertOrder = orderdao.insertOrder(dto);
	    return insertOrder;
	}
	
	public int insertOrderDetail(OrderDetailDto dto) {
	    int insertOrderDetail = orderdao.insertOrderDetail(dto);
	    return insertOrderDetail;
	}

	public List<OrderlistDto> orderlist(String users_id) {
        List<OrderlistDto> orderlist = orderdao.orderlist(users_id);
        return orderlist;
    }
//	public int insertOrder(OrderlistDto dto) {
//        int insertOrder = orderlistdao.insertOrder(dto);
//        return insertOrder;
//    }
}
