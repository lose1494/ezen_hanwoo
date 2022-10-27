package com.study.springboot;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.CartProductDto;
import com.study.springboot.dto.FaqDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2one_answerDto;
import com.study.springboot.dto.OrderlistDto;
import com.study.springboot.dto.OrderlistdetailDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_qnaDto;
import com.study.springboot.dto.Product_qna_replyDto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.dto.UsersDto;
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
@Controller

public class MyController_ian {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private ProductService productservice;
    @Autowired
    private Product_qnaService product_qnaService;
    @Autowired
    private CartService cartService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private OrderlistService orderservice;
	@Autowired
	private FaqService faqService;
	@Autowired
    private One2oneService one2oneService;
	@Autowired
    private One2one_answerService answerService;
	@Autowired
    private Product_qna_replyService productQnaRplyService;
	
	int num_page_size = 5;
    
    @RequestMapping("/")
    public String root() {
        return "redirect:index";
    }
    
    @RequestMapping("/index")
    public String index(@CookieValue(value="users_id", required=false) Cookie id, 
            @CookieValue(value="users_pw", required=false) Cookie pw, 
            HttpServletRequest request, Model model) {
        
        if( id != null && pw != null ) {
            System.out.println(id.getValue()+","+pw.getValue());
            int result = usersService.login(id.getValue(), pw.getValue());
            request.getSession().setAttribute("users_id", id.getValue());
            request.getSession().setAttribute("users_pw", pw.getValue());
        }
        
        // 알럿 메시지 중복 제거
        String alertMessage = (String) request.getSession().getAttribute("alert");
        System.out.println("index alertMessage:" + alertMessage);
        if (alertMessage != null) {
            request.setAttribute("alert", alertMessage);
        }
        List<ProductDto> productlist = productservice.productlist(null);
        model.addAttribute("productlist", productlist);
        model.addAttribute("mainPage", "main.jsp");
        return "index"; // index.jsp 디스패치
    }
    
    @RequestMapping("/product/product01")
    public String product01(@RequestParam(value="page",defaultValue="1") String page,
            @RequestParam(value="sort", defaultValue="select") String sort,
            HttpServletRequest request, Model model) {
        
        num_page_size = 6;
        String category = request.getParameter("product_category");   
        System.out.println(category);
        List<ProductDto> productlist = productservice.productCate(category, sort, page, num_page_size);
        
        int product_count = productservice.product_count(category);
        int pageNum = (int)Math.ceil((double)product_count/num_page_size);
        
        model.addAttribute("sort", sort);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("product_count", product_count);
        model.addAttribute("category", category);
        model.addAttribute("productlist", productlist);
        model.addAttribute("mainPage", "product/product01.jsp");
        
        return "index";
    }
    
 // 이용자 공지사항
    @RequestMapping("/Notice/notice")
    public String notice(@RequestParam(value="page", defaultValue="1") String page,
                         @RequestParam(value="search_type",defaultValue="notice_title") String search_type, 
                         @RequestParam(value="search_contents",required=false) String search_contents,
                         Model model) {
        
        int notice_count = noticeService.notice_count(search_type, search_contents);
        List<NoticeDto> admin_notice_list = noticeService.admin_notice_list(page, num_page_size);
        List<NoticeDto> searchResult;
        int pageNum = (int)Math.ceil((double)notice_count/num_page_size);
       
        if(search_type != null) {
            searchResult = noticeService.searchResult(search_type, search_contents, page, num_page_size);
            model.addAttribute("admin_notice_list", searchResult);
        }else {
            model.addAttribute("admin_notice_list", admin_notice_list);
        }
        
        model.addAttribute("type", search_type);
        model.addAttribute("word", search_contents);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("notice_count", notice_count);
        model.addAttribute("mainPage", "notice/notice.jsp");
        return "index";
    }
    
    // 이용자 공지사항 글
    @RequestMapping("/Notice/notice_view")
    public String notice_view(Model model,@RequestParam("notice_idx") int notice_idx) {
        List<NoticeDto> notice_detail = noticeService.notice_detail(notice_idx);
        model.addAttribute("notice_detail", notice_detail);
        model.addAttribute("mainPage", "notice/notice_view.jsp");
        return "index";
    }
    
    // 이용자 자주하는 질문
    @RequestMapping("/Notice/faq")
	public String faq(@RequestParam(value="page",defaultValue="1") String page,
			@RequestParam(value="faq_type",defaultValue="all") String faq_type,
			Model model, HttpServletRequest request) {
		
		String sort = "faq_title";
		String word = "";
		List<FaqDto> faqList = faqService.faqList(faq_type, sort, word, page, num_page_size);
		int faqCount = faqService.faqCount(faq_type, sort, word);
		int pageNum = (int)Math.ceil((double)faqCount/num_page_size);
		
		model.addAttribute("type", faq_type);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("faqList", faqList);
		model.addAttribute("mainPage", "notice/faq.jsp");
		return "index";
	}
	
	@RequestMapping("/Notice/searchFaq")
	public String searchFaq(@RequestParam(value="page",defaultValue="1") String page,
			@RequestParam(value="faq_type",defaultValue="all") String faq_type,
			@RequestParam(value="sort",defaultValue="faq_title") String sort,
			@RequestParam("word") String word,
			Model model, HttpServletRequest request) {
		
		System.out.println(word);
		List<FaqDto> faqList = faqService.faqList(faq_type, sort, word, page, num_page_size);
		int faqCount = faqService.faqCount(faq_type, sort, word);
		int pageNum = (int)Math.ceil((double)faqCount/num_page_size);
		System.out.println(pageNum);
		
		model.addAttribute("type", faq_type);
		model.addAttribute("sort", sort);
		model.addAttribute("word", word);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("faqList", faqList);
		model.addAttribute("mainPage", "notice/faq.jsp");
		return "index";
	}
    
    // 관리자 페이지 메인
    @RequestMapping("/admin/admin_main")
    public String userList(Model model) {
        String list = "all";
        String text = "";
        List<UsersDto> userList = usersService.search_result(list, text);
        int list_Count = usersService.list_Count();
        model.addAttribute("list_Count", list_Count);
        model.addAttribute("search_result", userList);
        model.addAttribute("mainPage", "admin/admin_main.jsp");
        return "index";
    }
    
    // 회원 검색
    @RequestMapping("/admin/member_search")
    public String member_search(@RequestParam("search_list") String list, @RequestParam("search_text") String text,
            Model model) {
        System.out.println("name:" + text); 
        List<UsersDto> search_result = usersService.search_result(list, text);
        for (UsersDto usersDto : search_result) {
            System.out.println(usersDto);
        }
        //[userDto0] 
        model.addAttribute("search_result", search_result);
        model.addAttribute("list", list);
        model.addAttribute("text", text);
        model.addAttribute("list_Count", search_result.size());
        model.addAttribute("mainPage", "admin/admin_main.jsp");
        return "index";
    }
    
    // 회원상세조회
    @RequestMapping("/admin/admin_maindetail")
    public String admin_maindetail(@RequestParam("users_id") String users_id, Model model) {
        List<UsersDto> user_Detail = usersService.user_Detail(users_id);
        model.addAttribute("user_Detail", user_Detail);
        model.addAttribute("users_id", users_id);
        model.addAttribute("mainPage", "admin/admin_maindetail.jsp");
        return "index";
    }
    
    // 상품관리
    @RequestMapping("/admin/admin_item")
    public String adminitem(Model model) {
        String search = "all";
        String text = "";
        List<ProductDto> item_list = productservice.item_result(search, text);
        int item_Count = productservice.item_Count();
        model.addAttribute("item_Count", item_Count);
        model.addAttribute("item_result", item_list);
        model.addAttribute("mainPage", "admin/admin_item.jsp");
        return "index";
    }
    
    // 상품 검색
    @RequestMapping("/admin/item_search")
    public String item_search(@RequestParam("item_search") String search, 
                              @RequestParam("main_text") String text,
                              Model model) {
        List<ProductDto> item_result = productservice.item_result(search, text);
    
        model.addAttribute("search", search);
        model.addAttribute("text", text);
        model.addAttribute("item_result", item_result);
        model.addAttribute("item_Count", item_result.size());
        model.addAttribute("mainPage", "admin/admin_item.jsp");
        return "index";
    }
    
    // 상품 삭제
    @RequestMapping("/admin/delete_product")
    @ResponseBody
    public String delete_product(@RequestParam("product_idx") int idx, Model model) {
        System.out.println(idx);
        int result = productservice.deleteProduct(idx);
        if (result != 1) {
            return "<script>alert('글 삭제 실패');history.back();</script>";
        } else {
            return "<script>alert('글 삭제 성공');" + "location.href='/admin/admin_item';</script>";
        }
    }
    
    //상품등록
    @RequestMapping("/admin/item_register")
    public String item_register(Model model) {
        model.addAttribute("mainPage", "admin/item_register.jsp");
        return "index";
    }
    
    @RequestMapping("/admin/productRegister")
        public String productRegister( @RequestBody Map<String, String>register) {
            productservice.productRegister(register);
            return "redirect:/admin/item_register";
        }
   
    // 상품 상세조회
    @RequestMapping("/admin/item_detail")
    public String item_detail(HttpServletRequest request, Model model) {
        String product_idx = request.getParameter("product_idx");
        List<ProductDto> productDetail = productservice.productDetail(product_idx);
        model.addAttribute("product_idx", product_idx);
        model.addAttribute("productDetail", productDetail);
        model.addAttribute("mainPage", "admin/item_detail.jsp");
        return "index";
    }
  
    //상품 수정
    @RequestMapping("/admin/item_revise")
    public String item_revise(HttpServletRequest request, Model model) {
        String product_idx= request.getParameter("product_idx");
        List<ProductDto> item_detail = productservice.productDetail(product_idx);
        model.addAttribute("product_idx", product_idx);
        model.addAttribute("item_detail", item_detail);
        model.addAttribute("mainPage", "admin/item_revise.jsp");
        return "index";
   }
    @RequestMapping("/admin/reviseProduct")
    public String reviseProduct ( @RequestBody Map<String, String> revise, Model model ) {
        /* System.out.println(revise); */
        productservice.reviseProduct( revise );
        model.addAttribute("mainPage", "admin/admin_item.jsp");
        return "index";
  }
    
    // 주문관리
    @RequestMapping("/admin/admin_order")
    public String adminorder(@RequestParam(value="page", defaultValue="1") String page,
                             @RequestParam(value="search_type",defaultValue="order_no") String search_type, 
                             @RequestParam(value="search_contents",required=false) String search_contents,
                             Model model) {
        List<OrderlistdetailDto> orderlist1 = orderservice.orderlist1(page, num_page_size);
        List<OrderlistdetailDto> searchResult;
        int order_Count = orderservice.order_Count(search_type, search_contents);
        int pageNum = (int)Math.ceil((double)order_Count/num_page_size);
        
        if(search_type != null) {
            searchResult = orderservice.searchResult(search_type,search_contents, page, num_page_size);
            model.addAttribute("orderlist1", searchResult);
        } else {
            model.addAttribute("orderlist1", orderlist1);
        }
        
        model.addAttribute("type", search_type);
        model.addAttribute("word", search_contents);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("order_Count", order_Count);
        model.addAttribute("mainPage", "admin/admin_order.jsp");
        return "index";
    }

    // 주문 상세 조회
    @RequestMapping("/admin/admin_order_detail")
    public String admin_order_detail(Model model,
            @RequestParam("order_idx") int order_idx) {
        List<OrderlistdetailDto> orderlist2 = orderservice.orderlist2(order_idx);
        
        model.addAttribute("orderlist2", orderlist2);
        model.addAttribute("mainPage", "admin/admin_order_detail.jsp");
        return "index";
    }
    
    // 리뷰 관리 검색
    @RequestMapping("/admin/admin_review")
    public String admin_review(Model model, 
                                @RequestParam(value="searchType",required=false) String Type,
                                @RequestParam(value="searchKeyword",required=false) String keyword,
                                @RequestParam(value="fromDate", required=false) String fromDate,
                                @RequestParam(value="toDate", required=false) String toDate,
                                HttpServletRequest request) {
        List<ReviewDto> review_result = reviewService.review_result();
        List<ReviewDto> reviewResult;
        List<ReviewDto> reviewDate;
        int review_count = reviewService.review_count();
        if( Type != null ) {
            reviewResult = reviewService.reviewResult( Type, keyword );
            model.addAttribute("review_result", reviewResult);
            model.addAttribute("review_count", reviewResult.size());
        }  else if( Type!= null || fromDate != null || toDate != null ) {
          reviewDate = reviewService.reviewDate(fromDate, toDate);
          System.out.println(reviewDate);
          model.addAttribute("review_result", reviewDate);
          model.addAttribute("review_count", reviewDate.size());
          } else {
            model.addAttribute("review_result", review_result); 
            model.addAttribute("review_count", review_count);
        }
        
        model.addAttribute("mainPage", "admin/admin_review.jsp");
        return "index";
    }
    
    // 상품 문의 관리
    @RequestMapping("/admin/admin_inquiry")
    public String admin_inquiry(@RequestParam(value="page",defaultValue="1") String page,
                                HttpServletRequest request, Model model) {
        String users_id = (String) request.getSession().getAttribute("users_id");
        
        List<Product_qna_replyDto> qna_List = productQnaRplyService.qna_List(users_id, page, num_page_size);
        int qnaListCount = product_qnaService.qnaListCount(users_id);
        int pageNum = (int)Math.ceil((double)qnaListCount/num_page_size);
        
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("qna_List", qna_List);
        model.addAttribute("mainPage", "admin/admin_inquiry.jsp");

        return "index";
    }
    
    @RequestMapping("/admin/QnAanswerWrite")
    @ResponseBody
    public int QnAanswerWrite(@RequestParam("qna_idx") int qna_idx,
                           @RequestParam("reply_content") String reply_content,
                              Product_qna_replyDto dto, Product_qnaDto dto1,
                              HttpServletRequest request, Model model ) {
        String reply_id = (String) request.getSession().getAttribute("users_id");
        dto.setReply_id(reply_id);
        dto.setReply_content(reply_content);
        dto.setQna_idx(qna_idx);        
        
        int result = productQnaRplyService.insertReply(dto);
        
        if( result == 1 ) {
            dto1.setQna_status("답변완료");
            dto1.setQna_idx(qna_idx);
            int updateStatus = product_qnaService.updateStatus(dto1);
        }
        
        return result;
    }
    
    @RequestMapping("/admin/QnAanswerUpdate")
    @ResponseBody
    public int QnAanswerUpdate(@RequestParam("reply_idx") int reply_idx,
                               @RequestParam("reply_content") String reply_content,
                               Product_qna_replyDto dto, 
                               HttpServletRequest request, Model model ) {
        dto.setReply_content(reply_content);
        dto.setQna_idx(reply_idx);
        
        int result = productQnaRplyService.updateAnswer(dto);
   
        
        return result;
    }
    
    @RequestMapping("/admin/QnAanswerDelete")
    @ResponseBody
    public int QnAanswerDelete(@RequestParam("qna_idx") int qna_idx,
                            @RequestParam("reply_idx") int reply_idx,
                            Product_qnaDto dto1,
                            HttpServletRequest request, Model model ) {

        int result = productQnaRplyService.deleteAnswer(reply_idx);
        
        if( result == 1 ) {
            dto1.setQna_status("답변 대기중");
            dto1.setQna_idx(qna_idx);
            int updateStatus = product_qnaService.updateStatus(dto1);
        }
        
        return result;
    }
    
    // 공지사항 관리
    @RequestMapping("/admin/admin_notice")
    public String admin_notice(@RequestParam(value="page", defaultValue="1") String page,
                         @RequestParam(value="search_type",defaultValue="notice_title") String search_type, 
                         @RequestParam(value="search_contents",required=false) String search_contents,
                         Model model) {
        
        int notice_count = noticeService.notice_count(search_type, search_contents);
        List<NoticeDto> admin_notice_list = noticeService.admin_notice_list(page, num_page_size);
        List<NoticeDto> searchResult;
        int pageNum = (int)Math.ceil((double)notice_count/num_page_size);
       
        if(search_type != null) {
            searchResult = noticeService.searchResult(search_type, search_contents, page, num_page_size);
            model.addAttribute("admin_notice_list", searchResult);
        }else {
            model.addAttribute("admin_notice_list", admin_notice_list);
        }
        
        model.addAttribute("type", search_type);
        model.addAttribute("word", search_contents);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("notice_count", notice_count);
        model.addAttribute("mainPage", "admin/admin_notice.jsp");
        return "index";
    }

    //공지사항 상세 페이지
    @RequestMapping("/admin/notice_detail")
    public String notice_detail ( HttpServletRequest request, Model model,
                                  @RequestParam ("notice_idx") int notice_idx) {
        List<NoticeDto> notice_detail = noticeService.notice_detail(notice_idx);
        model.addAttribute("notice_detail", notice_detail);
        model.addAttribute("mainPage", "admin/notice_detail.jsp");
        return "index";
    }
    // 공지사항 글쓰기
    @RequestMapping("/admin/admin_noticewrite")
    public String admin_noticewrite(Model model) {
        model.addAttribute("mainPage", "admin/admin_noticewrite.jsp");
        return "index";
    }
    //공지사항 글쓰기 Action
    @RequestMapping("/notice_writeAction")
    public String notice_writeAction(@RequestBody Map<String, String> param) {
        noticeService.noticeWrite(param);
        return "redirect:admin/admin_notice";
    }
    
    //공지사항 수정
    @RequestMapping("/admin/admin_noticeEdit")
    public String admin_noticewrite2(@RequestParam("notice_idx") int notice_idx,Model model) {
        NoticeDto noticedetail = noticeService.notice_Edit(notice_idx);
        System.out.println(noticedetail);
        model.addAttribute("dto", noticedetail);
        model.addAttribute("mainPage", "admin/admin_noticeEdit.jsp");
        return "index";
    }
    @RequestMapping("/admin/noticeEdit")
    public String noticeEdit ( @RequestBody Map<String, String> noticeEdit, Model model) {
        noticeService.noticeEdit(noticeEdit);
        model.addAttribute("mainPage","admin/admin_notice.jsp");
        return "index";
    }
    
    //공지사항 삭제
    @RequestMapping("/admin/deleteNotice")
    @ResponseBody
    public String deleteNotice(@RequestParam("notice_idx") int idx, Model model) {
        int result = noticeService.deleteNotice(idx);
        if (result != 1) {
        return "<script>alert('글 삭제 실패');history.back();</script>";
        } else {
        return "<script>alert('글 삭제 성공');" + "location.href='/admin/admin_notice';</script>";
        }
    }

    // 1:1문의
    @RequestMapping("/admin/admin_one2one")
    public String admin_one2one(@RequestParam(value="page",defaultValue="1") String page,
                                HttpServletRequest request, Model model) {
        String users_id = (String) request.getSession().getAttribute("users_id");
        
        List<One2one_answerDto> one2oneList = answerService.one2oneList(users_id, page, num_page_size);
        int one2oneCount = one2oneService.one2oneCount(users_id);
        int pageNum = (int)Math.ceil((double)one2oneCount/num_page_size);
        
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("one2oneList", one2oneList);
        model.addAttribute("mainPage", "admin/admin_one2one.jsp");

        return "index";
    }
    
    @RequestMapping("/admin/answerWrite")
    @ResponseBody
    public int answerWrite(@RequestParam("one2one_idx") int one2one_idx,
                              @RequestParam("answer_content") String answer_content,
                              One2one_answerDto dto, One2oneDto one,
                              HttpServletRequest request, Model model ) {
        System.out.println(one2one_idx);
        String answer_id = (String) request.getSession().getAttribute("users_id");
        dto.setAnswer_id(answer_id);
        dto.setAnswer_content(answer_content);
        dto.setOne2one_idx(one2one_idx);        
        
        int result = answerService.insertAnswer(dto);
        
        if( result == 1 ) {
            one.setOne2one_status("답변완료");
            one.setOne2one_idx(one2one_idx);
            int updateStatus = one2oneService.updateStatus(one);
        }
        
        return result;
    }
   
    @RequestMapping("/admin/answerUpdate")
    @ResponseBody
    public int answerUpdate(@RequestParam("answer_idx") int answer_idx,
                            @RequestParam("answer_content") String answer_content,
                            One2one_answerDto dto, 
                            HttpServletRequest request, Model model ) {

        dto.setAnswer_content(answer_content);
        dto.setOne2one_idx(answer_idx);        
        
        int result = answerService.updateAnswer(dto);
   
        
        return result;
    }
    
    @RequestMapping("/admin/answerDelete")
    @ResponseBody
    public int answerDelete(@RequestParam("one2one_idx") int one2one_idx,
                            @RequestParam("answer_idx") int answer_idx,
                            One2oneDto one,
                            HttpServletRequest request, Model model ) {

        int result = answerService.deleteAnswer(answer_idx);
        
        if( result == 1 ) {
            one.setOne2one_status("답변 대기중");
            one.setOne2one_idx(one2one_idx);
            int updateStatus = one2oneService.updateStatus(one);
        }
        
        return result;
    }
    

    // 자주하는 질문
    @RequestMapping("/admin/admin_faq")
    public String admin_faq(@RequestParam(value="page",defaultValue="1") String page,
                            @RequestParam(value="faq_type",defaultValue="all") String faq_type,
                            Model model, HttpServletRequest request) {
        String sort = "faq_title";
        String word = "";
        List<FaqDto> faqList = faqService.faqList(faq_type, sort, word, page, num_page_size);
        int faqCount = faqService.faqCount(faq_type, sort, word);
        int pageNum = (int)Math.ceil((double)faqCount/num_page_size);
        
        model.addAttribute("type", faq_type);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("faqList", faqList);
        model.addAttribute("mainPage", "admin/admin_faq.jsp");
        return "index";
    }
    @RequestMapping("/admin/admin_searchFaq")
    public String admin_searchFaq(@RequestParam(value="page",defaultValue="1") String page,
                                  @RequestParam(value="faq_type",defaultValue="all") String faq_type,
                                  @RequestParam(value="sort",defaultValue="faq_title") String sort,
                                  @RequestParam("word") String word,
                                  Model model, HttpServletRequest request) {
        System.out.println(word);
        List<FaqDto> faqList = faqService.faqList(faq_type, sort, word, page, num_page_size);
        int faqCount = faqService.faqCount(faq_type, sort, word);
        int pageNum = (int)Math.ceil((double)faqCount/num_page_size);
        System.out.println(pageNum);
        
        model.addAttribute("type", faq_type);
        model.addAttribute("sort", sort);
        model.addAttribute("word", word);
        model.addAttribute("page", page);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("faqList", faqList);
        model.addAttribute("mainPage", "admin/admin_faq.jsp");
        return "index";
    }
    
    // 상품상세페이지 리뷰등록
    @RequestMapping("/product/product_review_popup")
    public String product_review_popup(@RequestParam("product_idx") int product_idx,
            Model model, HttpServletRequest request) {
        String users_id = (String) request.getSession().getAttribute("users_id");
        if(users_id == null) {
            request.getSession().setAttribute("alert", "로그인이 필요합니다.");
            request.setAttribute("url", "/member/login");
            request.setAttribute("windowCheck", "popup");
            return "alert";
        } else {
            UsersDto user = usersService.userDetail(users_id);
            ProductDto product = productservice.productDetail(product_idx);
            model.addAttribute("user", user);
            model.addAttribute("product", product);
            return "product/product_review_popup";
        }
    }
    
    @RequestMapping("/mypage/mypage_cart")
    public String mypage_cart ( 
            Model model, HttpServletRequest request) {
        String users_id = (String) request.getSession().getAttribute("users_id");
        if(users_id == null) {
            request.getSession().setAttribute("alert", "로그인이 필요합니다.");
            request.setAttribute("url", "/member/login");
            return "alert";
        } else {
        model.addAttribute("mainPage","mypage/mypage_cart.jsp");
        return "index";
        }
    }
    
    @GetMapping("/mypage/get_cart_list")
    @ResponseBody
       public List<CartProductDto> get_cart_list( HttpServletRequest request) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        List<CartProductDto> cartList = cartService.cartList(users_id);
          return cartList;
       }
    @GetMapping("/mypage/get_order_list")
    @ResponseBody
       public List<CartProductDto> get_order_list( HttpServletRequest request) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        List<CartProductDto> cartList = cartService.cartList(users_id);
          return cartList;
       }
    @GetMapping("/mypage/get_order2_list")
    @ResponseBody
       public List<OrderlistDto> get_order2_list( HttpServletRequest request) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        List<OrderlistDto> orderlist = orderservice.orderlist(users_id);
          return orderlist;
       }
    
    @GetMapping("/mypage/cartdb")
    @ResponseBody
        public Object cartdb(@RequestParam ("cart_count") int cart_count,
                             @RequestParam ("cart_product_name") String cart_product_name,
                             @RequestParam ("product_idx") int product_idx,
                             HttpServletRequest request) {
        System.out.println(cart_count);
        CartProductDto cartdto = new CartProductDto();
        String users_id = (String)request.getSession().getAttribute("users_id");
        cartdto.setCart_count(cart_count);
        cartdto.setCart_product_name(cart_product_name);
        cartdto.setProduct_idx(product_idx);
        cartdto.setUsers_id(users_id);
        cartService.insertCart(cartdto);
        return "cartdb";
    }
   
    @GetMapping("/mypage/cart_Update")
    @ResponseBody
    public Object cart_Update(@RequestParam("cart_count") int cart_count,
                              @RequestParam("product_idx") int product_idx,
            HttpServletRequest request
                              ) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        cartService.updateCart(cart_count, users_id, product_idx);
        return "care_Update";
    }
    @GetMapping("/mypage/check_Update")
    @ResponseBody
    public Object check_Update(@RequestParam("cart_check") int cart_check,
                              @RequestParam("product_idx") int product_idx,
            HttpServletRequest request
                              ) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        cartService.updatecheck(cart_check, users_id, product_idx);
        System.out.println(cart_check);
        System.out.println(product_idx);
        
        return "check_Update";
    }
    @GetMapping("/mypage/cart_delete")
    @ResponseBody
    public Object cart_delete(@RequestParam("product_idx") int product_idx,
            HttpServletRequest request) { 
        String users_id = (String)request.getSession().getAttribute("users_id");
        cartService.deleteCart(product_idx,users_id );
        return "cart_delete";
    }
    @GetMapping("/mypage/cart_deleteall")
    @ResponseBody
    public Object cart_deleteall(
            HttpServletRequest request) { 
        String users_id = (String)request.getSession().getAttribute("users_id");
        cartService.deleteCartall(users_id );
        return "cart_deleteall";
    }
    

	/*
	 * @GetMapping("/mypage/get_cart_list")
       public Object get_cart_list(@RequestParam ("users_id") String
	 * users_id) { System.out.println("12312321321" + users_id); CartService cart =
	 * new CartService(); List<CartDto> cartList = cart.cartList(users_id); return
	 * cartList; }
	 */
	
	@RequestMapping("/mypage/cartOrder")
	public String cartOrder(@RequestParam("checkList") String checkIdx,
	        HttpServletRequest request, Model model) {
	    String check[] = checkIdx.split(",");
	    for(int i=0; i<check.length; i++) {
	        System.out.println(check[i]);
	    }
	    
	    String users_id = (String)request.getSession().getAttribute("users_id");
	    List<CartProductDto> cartList = cartService.cartList(users_id);
	    List<CartProductDto> orderList = new ArrayList<CartProductDto>();
	    for(int i=0; i<cartList.size(); i++) {
	        for(int j=0; j<check.length; j++) {
	            if( cartList.get(i).getProduct_idx() == Integer.valueOf(check[j]) ) {
	                orderList.add(cartList.get(i));
	            }
	        }
	       
	    }
        if(users_id == null) {
            request.getSession().setAttribute("alert", "로그인이 필요합니다.");
            request.setAttribute("url", "/member/login");
            return "alert";
        } else {
            
            UsersDto user = usersService.userDetail(users_id);
            
            model.addAttribute("user", user);
            model.addAttribute("orderCount", check.length);
            model.addAttribute("orderList", orderList);
            model.addAttribute("mainPage", "product/order01.jsp");
            return "index";
        }
	}
	
	
   
//    @GetMapping("/product/insertorder")
//    @ResponseBody
//        public Object insertorder(@RequestParam("order_no") int order_no,
//                                  @RequestParam("order_total_price") int order_total_price,
//                                  @RequestParam("order_comment") String order_comment,
//                                  @RequestParam("order_usepoint") String order_usepoint,
//                                  @RequestParam("order_date") Date order_date,
//                                  @RequestParam("order_recipient") String order_recipient,
//                                  @RequestParam("order_address1") String order_address1,
//                                  @RequestParam("order_address2") String order_address2,
//                                  @RequestParam("order_address3") String order_address3,
//                                  @RequestParam("order_phone") String order_phone,
//                                  @RequestParam("users_point") String users_point,
//                             HttpServletRequest request) {
//        String users_id = (String)request.getSession().getAttribute("users_id");
//        OrderlistDto orderdto = new OrderlistDto();
//        orderdto.setOrder_usepoint(order_usepoint);
//        orderdto.setOrder_address1(order_address1);
//        orderdto.setOrder_address2(order_address2);
//        orderdto.setOrder_address3(order_address3);
//        orderdto.setOrder_comment(order_comment);
//        orderdto.setOrder_date(order_date);
//        orderdto.setOrder_no(order_no);
//        orderdto.setOrder_phone(order_phone);
//        orderdto.setUsers_id(users_id);
//        orderdto.setOrder_total_price(order_total_price);
//        orderdto.setOrder_recipient(order_recipient);
//        usersService.updatepoint(users_point, users_id);
//        orderservice.insertOrder(orderdto);
//        return "insertorder";
//    }
}
