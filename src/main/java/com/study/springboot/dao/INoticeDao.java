package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	//관리자 공지사항
	public List<NoticeDto> admin_notice_list();
	
	//관리자 글쓰기
	public int notice_write(NoticeDto dto1);

	//공지사항 개수
	public int notice_count();

	//공지사항 상세페이지
	public List<NoticeDto> notice_detail(String notice_idx);


}
