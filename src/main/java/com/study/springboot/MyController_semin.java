package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.study.springboot.service.ProductService;

@Controller
public class MyController_semin {
	@Autowired
	private ProductService productservice;
	
}

