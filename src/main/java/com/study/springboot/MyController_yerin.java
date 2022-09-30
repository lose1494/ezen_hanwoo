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
	@RequestMapping("/mypage/mypage_memberEdit_1")
	public String mypage_memberEdit_1(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_memberEdit_1.jsp");
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
	
	@RequestMapping("/mypage/mypage_orderDetail")
	public String mypage_orderDetail(Model model) {
		
		return "mypage/mypage_orderDetail";
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
	
	//주문
	@RequestMapping("/product/order01")
	public String order01(Model model) {
		model.addAttribute("mainPage", "product/order01.jsp");
		return "index";
	}
	
	@RequestMapping("/product/order02")
	public String order02(Model model) {
		model.addAttribute("mainPage", "product/order02.jsp");
		return "index";
	}
	
	//문의
	@RequestMapping("/customer/customer01")
	public String customer01(Model model) {
		model.addAttribute("mainPage", "customer/customer01.jsp");
		return "index";
	}
}
