package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController_minwoo {

	@RequestMapping("/product/search_result")
	public String search_result (Model model) {
		model.addAttribute("mainPage","product/search_result.jsp");
		return "index";
	}
	
	@RequestMapping("/product/")
	public String  (Model model) {
		model.addAttribute("mainPage","product/.jsp");
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
}
