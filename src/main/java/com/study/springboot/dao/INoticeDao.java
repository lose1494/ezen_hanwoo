package com.study.springboot.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

	public void noticeWrite(Map<String, String> param);
	
	public List<NoticeDto> noticelist(String notice_idx, String notice_title, Date Notice_date);
	
	public int noticeupdate(String notice_idx, String notice_title, String notice_content);
	
	public List<NoticeDto> updatelist(String notice_idx, String notice_title, String notice_content);
}
