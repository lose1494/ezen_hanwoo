package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOrderlistDao;
import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;
import com.study.springboot.dto.OrderlistdetailDto;

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

	public List<OrderlistdetailDto> orderlist1(String page, int num_page_size ) {
        
        int num_page_no = Integer.parseInt( page );
        int startRowNum = (num_page_no - 1) * num_page_size + 1;
        int endRowNum = (num_page_no * num_page_size);
        
        List<OrderlistdetailDto> orderlist1 = orderdao.orderlist1( startRowNum, endRowNum);
        return orderlist1;
    }

    public List<OrderlistdetailDto> orderlist2(int order_idx) {
        List<OrderlistdetailDto> orderlist2 = orderdao.orderlist2(order_idx);
        return orderlist2;
    }
    
   public int order_Count(String search_type, String search_contents) {
       int order_Count = orderdao.order_Count(search_type, search_contents);
       return order_Count;
   }

public List<OrderlistdetailDto> searchResult(String search_type, String search_contents, String page, int num_page_size) {
    
    int num_page_no = Integer.parseInt( page );
    int startRowNum = (num_page_no - 1) * num_page_size + 1;
    int endRowNum = (num_page_no * num_page_size);
    
    List<OrderlistdetailDto> searchResult = orderdao.searchResult(search_type, search_contents, startRowNum, endRowNum);
    
    return searchResult;
}
}
