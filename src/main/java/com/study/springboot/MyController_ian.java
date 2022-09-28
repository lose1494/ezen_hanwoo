package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyController_ian {
	
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
	
	@RequestMapping("/Notice/notice")
	public String notice (Model model) {
		model.addAttribute("mainPage", "notice/notice.jsp");
		return "index";
	}
	
	@RequestMapping("/Notice/notice_view")
	public String notice_view (Model model) {
		model.addAttribute("mainPage", "notice/notice_view.jsp");
		return "index";
	}
	
	@RequestMapping("/Notice/faq")
	public String faq (Model model) {
		model.addAttribute("mainPage", "notice/faq.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_main")
	public String memberlist (Model model) {
		model.addAttribute("mainPage", "admin/admin_main.jsp");
		return "index";
	}
	@RequestMapping("/admin/admin_item")
	public String adminitem (Model model) {
		model.addAttribute("mainPage", "admin/admin_item.jsp");
		return "index";
	}
	@RequestMapping("/admin/admin_order")
	public String adminorder (Model model) {
		model.addAttribute("mainPage", "admin/admin_order.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_maindetail")
	public String admin_maindetail (Model model) {
		model.addAttribute("mainPage", "admin/admin_maindetail.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/item_list")
	public String item_list (Model model) {
		model.addAttribute("mainPage", "admin/item_list.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/item_register")
	public String item_register (Model model) {
		model.addAttribute("mainPage", "admin/item_register.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/item_check")
	public String item_check (Model model) {
		model.addAttribute("mainPage", "admin/item_check.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/item_revise")
	public String item_revise (Model model) {
		model.addAttribute("mainPage", "admin/item_revise.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_order_detail")
	public String admin_order_detail (Model model) {
		model.addAttribute("mainPage", "admin/admin_order_detail.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_review")
	public String admin_review (Model model) {
		model.addAttribute("mainPage", "admin/admin_review.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_inquiry")
	public String admin_inquiry (Model model) {
		model.addAttribute("mainPage", "admin/admin_inquiry.jsp");
		return "index";
	}
	@RequestMapping("/admin/admin_notice")
	public String admin_notice (Model model) {
		model.addAttribute("mainPage", "admin/admin_notice.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_noticewrite")
	public String admin_noticewrite (Model model) {
		model.addAttribute("mainPage", "admin/admin_noticewrite.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_one2one")
	public String admin_one2one (Model model) {
		model.addAttribute("mainPage", "admin/admin_one2one.jsp");
		return "index";
	}
	
	@RequestMapping("/admin/admin_faq")
	public String admin_faq (Model model) {
		model.addAttribute("mainPage", "admin/admin_faq.jsp");
		return "index";
	}  
}

	