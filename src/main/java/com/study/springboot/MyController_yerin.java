package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.PointDto;
import com.study.springboot.service.PointService;
import com.study.springboot.service.UsersService;

@Controller
public class MyController_yerin {
	
	@Autowired private UsersService usersService;
	@Autowired private PointService pointService;
		
    //마이페이지
	@RequestMapping("/mypage/mypage_main")
	public String mypage_main(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_main.jsp");
		return "index";
	}

	@RequestMapping("/mypage/mypage_point")
	public String mypage_point(Model model, HttpServletRequest request) {
		
		String users_id = (String) request.getSession().getAttribute("users_id");
		List<PointDto> pointList = pointService.pointList(users_id);
		
		model.addAttribute("pointList", pointList);
		model.addAttribute("mainPage", "mypage/mypage_point.jsp");
		
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_wishlist")
	public String mypage_wishlist(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_wishlist.jsp");
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
	
	@RequestMapping("/mypage/mypage_one2one")
	public String mypage_one2one(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_one2one.jsp");
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
	
	@RequestMapping("/mypage/mypage_addressManagement")
	public String mypage_addressManagement(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_addressManagement.jsp");
		return "index";
	}	
	
	@RequestMapping("/mypage/mypage_memberWithdrawal")
	public String mypage_memberWithdrawal(Model model) {
		model.addAttribute("mainPage", "mypage/mypage_memberWithdrawal.jsp");
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
	
	//로그인
	@RequestMapping("/member/loginAction")
	public String loginAction(@RequestParam("users_id") String users_id,
							  @RequestParam("users_pw") String users_pw,
							  HttpServletRequest request,
								Model model) {
		
		int result = usersService.login(users_id, users_pw);
		System.out.println("result:" + result);
		
		if( result == 1 ) {
			System.out.println("alert:" + "로그인되었습니다.");
			request.getSession().setAttribute("alert", "로그인되었습니다.");
			request.getSession().setAttribute("users_id", users_id);
			
			return "redirect:/index"; 				 
		}else {
			System.out.println("alert:" + "로그인 실패하였습니다.");
			
			model.addAttribute("alert", "로그인 실패하였습니다.");
			model.addAttribute("mainPage", "member/login.jsp");
			
			return "index"; //index.jsp 디스패치
		}
		 
	}
	
	//로그아웃
	@RequestMapping("/member/logoutAction")
	public String logout(HttpServletRequest request, Model model) {
		
		request.getSession().invalidate();	
		
		request.getSession().setAttribute("alert", "로그아웃되었습니다.");
		
		return "redirect:/index";  
	}
}
