package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;

@Mapper
public interface IOrderlistDao {
    public int insertOrder(OrderlistDto dto);
    public int insertOrderDetail(OrderDetailDto dto);
}
