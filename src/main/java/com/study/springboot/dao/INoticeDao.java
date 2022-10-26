package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	//관리자 공지사항
	public List<NoticeDto> admin_notice_list(int startRowNum, int endRowNum);

	//공지사항 개수
	public int notice_count(String search_type, String search_contents);

	//공지사항 상세페이지
	public List<NoticeDto> notice_detail(int notice_idx);

	//공지사항 글쓰기
	public void noticeWrite(Map<String, String> param);

	//공지사항 검색결과
    public List<NoticeDto> searchResult(String search_type, String search_contents, int startRowNum, int endRowNum);

    //공지사항 삭제
    public int deleteNotice(int idx);

    //공지사항 수정VIew
    public NoticeDto notice_Edit(int notice_idx);
    
    //공지사항 업데이트
    void noticeEdit(Map<String, String> noticeEdit);

}
