package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController_yerin {
	
    //마이페이지
	@RequestMapping("/mypage/mypage_main")
	public String mypage_main(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_main.jsp");
		return "index";
	}

	@RequestMapping("/mypage/mypage_addressManagement")
	public String mypage_addressManagement(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_addressManagement.jsp");
		return "index";
	}	
	
	@RequestMapping("/mypage/mypage_memberEdit")
	public String mypage_memberEdit(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_memberEdit.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_memberWithdrawal")
	public String mypage_memberWithdrawal(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_memberWithdrawal.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_one2one")
	public String mypage_one2one(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_one2one.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_order")
	public String mypage_order(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_orderlist.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_point")
	public String mypage_point(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_point.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_productQna")
	public String mypage_productQna(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_productQna.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_review")
	public String mypage_review(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_review.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_wishlist")
	public String mypage_wishlist(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_wishlist.jsp");
		return "index";
	}
	
	//상품 상세	
	@RequestMapping("/product/product01_1")
	public String product01_1(Model model) {
		model.addAttribute("mainPage", "product/product01_1.jsp");
		return "index";
	}
}
