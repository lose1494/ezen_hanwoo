package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.dao.IReviewDao;

public class ReviewService {
	@Autowired
	private	IReviewDao reviewdao;
}
