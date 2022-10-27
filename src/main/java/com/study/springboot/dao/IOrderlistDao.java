package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;
import com.study.springboot.dto.OrderlistdetailDto;

@Mapper
public interface IOrderlistDao {
    public List<OrderlistDto> orderList(String users_id);
    public OrderlistDto orderDto(String order_no);
    public List<OrderDetailDto> detailList(String order_no);
    public int insertOrder(OrderlistDto dto);
    public int insertOrderDetail(OrderDetailDto dto);
    public List<OrderlistDto> orderlist(String users_id);
    public List<OrderlistdetailDto> orderlist2(int order_idx);
    public int order_Count(String search_type, String search_contents);
    public List<OrderlistdetailDto> orderlist1(int startRowNum, int endRowNum);
    public List<OrderlistdetailDto> searchResult(String search_type, String search_contents, 
                                                 int startRowNum, int endRowNum);
    
}
