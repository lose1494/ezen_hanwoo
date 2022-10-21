package com.study.springboot.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.NoticeDto;

@Component
public class NoticeService {
	@Autowired
	INoticeDao noticedao;

	public List<NoticeDto> admin_notice_list( String page, int num_page_size ) {
	    
	    int num_page_no = Integer.parseInt( page );
        int startRowNum = (num_page_no - 1) * num_page_size + 1;
        int endRowNum = (num_page_no * num_page_size);
        
		List<NoticeDto> admin_notice_list = noticedao.admin_notice_list(startRowNum, endRowNum);
		return admin_notice_list;
	}

	public int notice_count(String search_type, String search_contents) {
		int notice_count = noticedao.notice_count(search_type, search_contents);
		return notice_count;
	}

	public List<NoticeDto> notice_detail(String notice_idx) {
		List<NoticeDto> notice_detail = noticedao.notice_detail(notice_idx);
		return notice_detail;
	}

	public void noticeWrite(Map<String, String> param) {
		noticedao.noticeWrite(param);
	}


    public List<NoticeDto> searchResult(String search_type, String search_contents, 
            String page, int num_page_size) {
        
        int num_page_no = Integer.parseInt( page );
        int startRowNum = (num_page_no - 1) * num_page_size + 1;
        int endRowNum = (num_page_no * num_page_size);
        
        List<NoticeDto> searchResult = noticedao.searchResult(search_type, search_contents, startRowNum, endRowNum);
        return searchResult;
    }

	

	public List<NoticeDto> noticelist(String notice_idx, String notice_title, Date notice_date) {
        List<NoticeDto> noticelist = noticedao.noticelist(notice_idx, notice_title, notice_date);
        return noticelist;
    }
	public List<NoticeDto> updatelist(String notice_idx, String notice_title, String notice_content) {
        List<NoticeDto> updatelist = noticedao.updatelist(notice_idx, notice_title, notice_content);
        return updatelist;
    }


}
