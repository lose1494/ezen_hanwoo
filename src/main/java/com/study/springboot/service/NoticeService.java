package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.INoticeDao;

public class NoticeService {
	@Autowired
	private	INoticeDao noticedao;
}
