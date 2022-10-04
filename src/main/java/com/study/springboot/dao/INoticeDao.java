package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	//관리자 공지사항
	public List<NoticeDto> admin_notice_list();


}
