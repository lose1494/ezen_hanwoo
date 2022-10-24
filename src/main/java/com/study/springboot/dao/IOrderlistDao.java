package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderlistDto;

@Mapper
public interface IOrderlistDao {
    public List<OrderlistDto> orderlist(String users_id);
    public int insertOrder(OrderlistDto dto);
}
