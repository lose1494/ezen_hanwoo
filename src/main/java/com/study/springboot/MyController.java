package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.service.CartService;
import com.study.springboot.service.FaqService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.One2oneService;
import com.study.springboot.service.One2one_answerService;
import com.study.springboot.service.OrderlistService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.Product_qnaService;
import com.study.springboot.service.Product_qna_replyService;
import com.study.springboot.service.ReviewService;
import com.study.springboot.service.UsersService;
import com.study.springboot.service.WishlistService;



public class MyController {
	@Autowired
	private	CartService cartService;
	@Autowired
	private	FaqService faqService;
	@Autowired
	private	NoticeService noticeService;
	@Autowired
	private	One2oneService one2oneService;
	@Autowired
	private	OrderlistService orderlistService;
	@Autowired
	private	ProductService productservice;
	@Autowired
	private	ReviewService reviewService;
	@Autowired
	private	UsersService usersService;
	@Autowired
	private	WishlistService wishlistService;
	@Autowired
	private Product_qna_replyService product_qna_replyService;
	@Autowired
	private Product_qnaService product_qnaService;
	@Autowired
	private One2one_answerService one2one_answerService;
	
	@RequestMapping("/")
	public String root() {
		
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		//알럿 메시지 중복 제거
		String alertMessage = (String)request.getSession().getAttribute("alert");
		System.out.println("index alertMessage:" + alertMessage);
		if( alertMessage != null) {
			request.setAttribute("alert", alertMessage);
			request.getSession().setAttribute("alert", null);
		}
		
		model.addAttribute("mainPage", "main.jsp");
		
		return "index"; //index.jsp 디스패치 
	}
	
}

	