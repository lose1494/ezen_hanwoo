package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.NoticeDto;

@Component
public class NoticeService {
	@Autowired
	INoticeDao noticedao;

	public List<NoticeDto> admin_notice_list() {
		List<NoticeDto> admin_notice_list = noticedao.admin_notice_list();
		return admin_notice_list;
	}

	public int notice_write(NoticeDto dto1) {
		int dto2 = noticedao.notice_write(dto1);
		return dto2;
	}

	

}
