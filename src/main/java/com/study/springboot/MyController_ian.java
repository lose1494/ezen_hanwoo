package com.study.springboot;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.CartProductDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_qnaDto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.dto.UsersDto;
import com.study.springboot.service.CartService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.Product_qnaService;
import com.study.springboot.service.ReviewService;
import com.study.springboot.service.UsersService;
@Controller
/* @RequestMapping("/admin") */
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
    
    @RequestMapping("/")
    public String root() {
        return "redirect:index";
    }
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
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
    public String product01(HttpServletRequest request, Model model) {
        String category = request.getParameter("product_category");
        int product_count = productservice.product_count(category);
        List<ProductDto> productlist = productservice.productlist(category);
        model.addAttribute("product_count", product_count);
        model.addAttribute("category", category);
        model.addAttribute("productlist", productlist);
        model.addAttribute("mainPage", "product/product01.jsp");
        return "index";
    }
    // 이용자 공지사항
    @RequestMapping("/Notice/notice")
    public String notice(Model model) {
        model.addAttribute("mainPage", "notice/notice.jsp");
        return "index";
    }
    // 이용자 공지사항 글
    @RequestMapping("/Notice/notice_view")
    public String notice_view(Model model) {
        model.addAttribute("mainPage", "notice/notice_view.jsp");
        return "index";
    }
    // 이용자 자주하는 질문
    @RequestMapping("/Notice/faq")
    public String faq(Model model) {
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
    public String item_search(@RequestParam("item_search") String search, @RequestParam("main_text") String text,
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
    // 상품등록
    @RequestMapping("/admin/item_register")
    public String item_register(Model model) {
        model.addAttribute("mainPage", "admin/item_register.jsp");
        return "index";
    }
    
    @RequestMapping("/admin/productRegister")
        public String productRegister( @RequestBody Map<String, String>register) {
            productservice.productRegister(register);
            return "redirect:admin/item_register";
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
    /*
     * @GetMapping("/mypage/get_cart_list")
     * 
     * @ResponseBody
     * public List<CartDto> get_cart_list( HttpServletRequest request) {
     * String users_id = (String)request.getSession().getAttribute("users_id");
     * System.out.println("12312321321" + users_id);
     * 
     * List<CartDto> cartList = cartService.cartList(users_id);
     * return cartList;
     * }
     */
    
    //상품 수정
    @RequestMapping("/admin/item_revise")
    @ResponseBody
    public String item_revise( Model model) {
          model.addAttribute("mainPage", "admin/item_revise.jsp");
            return "index";
    
    }   
    // 주문관리
    @RequestMapping("/admin/admin_order")
    public String adminorder(Model model) {
        model.addAttribute("mainPage", "admin/admin_order.jsp");
        return "index";
    }
    // 주문 상세 조회
    @RequestMapping("/admin/admin_order_detail")
    public String admin_order_detail(Model model) {
        model.addAttribute("mainPage", "admin/admin_order_detail.jsp");
        return "index";
    }
    // 리뷰 관리
    @RequestMapping("/admin/admin_review")
    public String admin_review(Model model, HttpServletRequest request) {
        
        List<ReviewDto> review_result = reviewService.review_result();
        
        model.addAttribute("review_result", review_result);
        model.addAttribute("mainPage", "admin/admin_review.jsp");
        
        return "index";
    }
    // 상품 문의 관리
    @RequestMapping("/admin/admin_inquiry")
    public String admin_inquiry(Model model) {
        
        List<Product_qnaDto> qna_list = product_qnaService.qna_list();
        model.addAttribute("qna_list", qna_list);
        model.addAttribute("mainPage", "admin/admin_inquiry.jsp");
        return "index";
    }
    // 공지사항 관리
    @RequestMapping("/admin/admin_notice")
    public String admin_notice(Model model) {
        
        /*
         * List<NoticeDto> admin_notice_list = noticeService.admin_notice_list();
         * int notice_count = noticeService.notice_count();
         * model.addAttribute("notice_count", notice_count);
         * model.addAttribute("admin_notice_list", admin_notice_list);
         * model.addAttribute("mainPage", "admin/admin_notice.jsp");
         */
        model.addAttribute("mainPage", "admin/admin_notice.jsp");
        return "index";
    }
    @GetMapping("/admin/notice_list")
    @ResponseBody
    public List<NoticeDto> notice_list(@RequestParam("notice_idx") String notice_idx,
                              @RequestParam("notice_title") String notice_title,
                              @RequestParam("notice_date") Date notice_date
            ) {
        
        
        List<NoticeDto> noticelist = noticeService.noticelist(notice_idx, notice_title, notice_date);
        return noticelist;
    }
    //공지사항 상세 페이지
    @RequestMapping("/admin/notice_detail")
    public String notice_detail ( HttpServletRequest request, Model model ) {
        String notice_idx = request.getParameter("notice_idx");
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
    @RequestMapping("/admin/admin_noticewrite2")
    public String admin_noticewrite2(Model model) {
        
        
        model.addAttribute("mainPage", "admin/admin_noticewrite2.jsp");
        return "index";
    }
    @GetMapping("/admin/notice_update")
    @ResponseBody
    public List<NoticeDto> notice_update(@RequestParam("notice_idx") String notice_idx,
                                       @RequestParam("notice_title") String notice_title,
                                       @RequestParam("notice_content") String notice_content
            ) {
        List<NoticeDto> updatelist = noticeService.updatelist(notice_idx, notice_title, notice_content);
        System.out.println(updatelist);
        return updatelist;
    }
    // 1:1문의
    @RequestMapping("/admin/admin_one2one")
    public String admin_one2one(Model model) {
        model.addAttribute("mainPage", "admin/admin_one2one.jsp");
        return "index";
    }
    // 자주하는 질문
    @RequestMapping("/admin/admin_faq")
    public String admin_faq(Model model) {
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
            Model model) {
        model.addAttribute("mainPage","mypage/mypage_cart.jsp");
        return "index";
    }
    
    @GetMapping("/mypage/get_cart_list")
    @ResponseBody
       public List<CartProductDto> get_cart_list( HttpServletRequest request) {
        String users_id = (String)request.getSession().getAttribute("users_id");
        List<CartProductDto> cartList = cartService.cartList(users_id);
          return cartList;
       }
    
    @GetMapping("/mypage/cartdb")
    @ResponseBody
        public Object cartdb(@RequestParam ("cart_count") int cart_count,
                             @RequestParam ("cart_product_name") String cart_product_name,
                             @RequestParam ("product_idx") int product_idx,
                             HttpServletRequest request) {
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
    
}
