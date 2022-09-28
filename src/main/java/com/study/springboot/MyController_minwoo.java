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
	@RequestMapping("/mypage/mypage_cart")
	public String mypage_cart (Model model) {
		model.addAttribute("mainPage","mypage/mypage_cart.jsp");
		return "index";
	}
	
	@RequestMapping("/member/login")
	public String login (Model model) {
		model.addAttribute("mainPage","member/login.jsp");
		return "index";
	}
	
	@RequestMapping("/member/join")
	public String join  (Model model) {
		model.addAttribute("mainPage","member/join.jsp");
		return "index";
	}
	
	@RequestMapping("/member/join2")
	public String join2 (Model model) {
		model.addAttribute("mainPage","member/join2.jsp");
		return "index";
	}


}
