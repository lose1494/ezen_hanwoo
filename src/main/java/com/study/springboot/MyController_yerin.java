package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController_yerin {

	@RequestMapping("/mypage/mypage_addressManagement")
	public String mypage_addressManagement(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_addressManagement.jsp");
		return "index";
	}
}
