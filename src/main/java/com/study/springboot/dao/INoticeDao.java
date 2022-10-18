package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	//관리자 공지사항
	public List<NoticeDto> admin_notice_list();

	//공지사항 개수
	public int notice_count();

	//공지사항 상세페이지
	public List<NoticeDto> notice_detail(String notice_idx);

	//공지사항 글쓰기
	public void noticeWrite(Map<String, String> param);

	//공지사항 검색결과
    public List<NoticeDto> searchResult(String search_type, String search_contents);


}
