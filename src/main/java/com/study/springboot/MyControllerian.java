package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyControllerian {
	
//	  @Autowired private CartService cartService;
//	  
//	  @Autowired private FaqService faqService;
//	  
//	  @Autowired private NoticeService noticeService;
//	  
//	  @Autowired private One2oneService one2oneService;
//	  
//	  @Autowired private OrderlistService orderlistService;
//	 
//	  @Autowired private ProductService productservice;
//	  
//	  @Autowired private ReviewService reviewService;
//	  
//	  @Autowired private UsersService usersService;
//	  
//	  @Autowired private WishlistService wishlistService;
//	  
//	  @Autowired private Product_qna_replyService product_qna_replyService;
//	  
//	  @Autowired private Product_qnaService product_qnaService;
//	  
//	  @Autowired private One2one_answerService one2one_answerService;
	 
	
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
		}
		
		model.addAttribute("mainPage", "main.jsp");
		return "index"; //index.jsp 디스패치 
	}
	@RequestMapping("/product/product01")
	public String product01(HttpServletRequest request, Model model) {
		
		model.addAttribute("mainPage", "product/product01.jsp");
		return "index";
	}
}

	