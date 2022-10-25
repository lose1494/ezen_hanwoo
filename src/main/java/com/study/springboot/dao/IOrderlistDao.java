package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;

@Mapper
public interface IOrderlistDao {
    public int insertOrder(OrderlistDto dto);
    public int insertOrderDetail(OrderDetailDto dto);
    public List<OrderlistDto> orderlist(String users_id);
    public int insertOrder(OrderlistDto dto);
}
