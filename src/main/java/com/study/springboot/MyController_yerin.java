package com.study.springboot;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2one_answerDto;
import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderlistDto;
import com.study.springboot.dto.PointDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_qnaDto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.dto.UsersDto;
import com.study.springboot.service.CartService;
import com.study.springboot.service.One2oneService;
import com.study.springboot.service.One2one_answerService;
import com.study.springboot.service.OrderlistService;
import com.study.springboot.service.PointService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.Product_qnaService;
import com.study.springboot.service.ReviewService;
import com.study.springboot.service.UsersService;
import com.study.springboot.service.WishlistService;

@Controller
public class MyController_yerin {
	
	@Autowired private UsersService usersService;
	@Autowired private PointService pointService;
	@Autowired private CartService cartService;
	@Autowired private WishlistService wishlistService;
	@Autowired private One2oneService one2oneService;
	@Autowired private Product_qnaService qnaService;
	@Autowired private ReviewService reviewService;
	@Autowired private ProductService productService;
	@Autowired private One2one_answerService answerService;
	@Autowired private OrderlistService orderService;
	
	int num_page_size = 5;
	
		
    //마이페이지
	@RequestMapping("/mypage/mypage_main")
	public String mypage_main(Model model, HttpServletRequest request) {
		
		String users_id = (String) request.getSession().getAttribute("users_id");
		if(users_id == null) {
			request.getSession().setAttribute("alert", "로그인이 필요합니다.");
			request.setAttribute("url", "/member/login");
			return "alert";
		} else {
			UsersDto member = usersService.userDetail(users_id);
			int pointSum = pointService.pointSum(users_id);
			int cartCount = cartService.cartCount(users_id);
			int wishCount = wishlistService.wishCount(users_id);
			
			model.addAttribute("member", member);
			model.addAttribute("pointSum", pointSum);
			model.addAttribute("cartCount", cartCount);
			model.addAttribute("wishCount", wishCount);
			model.addAttribute("mainPage", "mypage/mypage_main.jsp");
			return "index";
		}		
	}

	@RequestMapping("/mypage/mypage_point")
	public String mypage_point(@RequestParam(value="page",defaultValue="1") String page,							
							Model model, HttpServletRequest request) {
		
		String users_id = (String) request.getSession().getAttribute("users_id");
		List<PointDto> pointList = pointService.pointList(users_id, page, num_page_size);
		int pointCount = pointService.pointCount(users_id);
		int sum = pointService.pointSum(users_id);		
		int pageNum = (int)Math.ceil((double)pointCount/num_page_size);
		

		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pointSum", sum);
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
	public String mypage_order(Model model, HttpServletRequest request) {
	    String users_id = (String) request.getSession().getAttribute("users_id");
	    List<OrderlistDto> orderlist = orderService.orderList(users_id);
	    
	    model.addAttribute("orderlist", orderlist);
		model.addAttribute("mainPage", "mypage/mypage_orderlist.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/mypage_orderDetail")
	public String mypage_orderDetail(Model model) {
		
		return "mypage/mypage_orderDetail";
	}
	
	@RequestMapping("/mypage/mypage_one2one")
	public String mypage_one2one(@RequestParam(value="page",defaultValue="1") String page,
			Model model, HttpServletRequest request) {
		String users_id = (String) request.getSession().getAttribute("users_id");
		
		List<One2one_answerDto> one2oneList = answerService.one2oneList(users_id, page, num_page_size);
		int one2oneCount = one2oneService.one2oneCount(users_id);
		int pageNum = (int)Math.ceil((double)one2oneCount/num_page_size);
		
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("one2oneList", one2oneList);
		model.addAttribute("mainPage", "mypage/mypage_one2one.jsp");

		return "index";
	}
	
	@RequestMapping("/mypage/mypage_productQna")
	public String mypage_productQna(@RequestParam(value="page",defaultValue="1") String page,
			HttpServletRequest request, Model model) {
		String users_id = (String) request.getSession().getAttribute("users_id");
		String sort = "qna_id";
		int qnaCount = qnaService.qnaCount(sort, users_id);
		int pageNum = (int)Math.ceil((double)qnaCount/num_page_size);
		List<Product_qnaDto> qnaList = qnaService.qnaList(sort, users_id, page, num_page_size);
		List<Product_qnaDto> joinTest = qnaService.joinTest();
		System.out.println(joinTest);
		
		model.addAttribute("joinTest", joinTest);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("mainPage", "mypage/mypage_productQna.jsp");
		return "index";
	}
	
	@RequestMapping("*/deleteQna")
	@ResponseBody
	public String deleteQna(@RequestParam("qna_idx") int qna_idx, 
							HttpServletRequest request, Model model) {
		int deleteQna = qnaService.deleteQna(qna_idx);
		String referer = request.getHeader("referer").substring(21);
		System.out.println(referer);
		
		
		if (deleteQna != 1) {
			System.out.println("문의 삭제 실패");		
			return "<script>alert('작성 실패');history.back();</script>";
		}else {
			System.out.println("문의 삭제 성공");
			return "<script>alert('삭제되었습니다.');location.href='"+referer+"';</script>";
		}
	}
	
	@RequestMapping("/mypage/mypage_review")
	public String mypage_review(@RequestParam(value="page",defaultValue="1") String page,
			HttpServletRequest request, Model model) {
		String users_id = (String) request.getSession().getAttribute("users_id");
		String standard = "review_id";
		String sort = "review_date";
		int reviewCount = reviewService.reviewCount(standard, users_id, null);
		int pageNum = (int)Math.ceil((double)reviewCount/num_page_size);
		List<ReviewDto> reviewList = reviewService.reviewList(standard, users_id, page, num_page_size, sort, null);
		
		System.out.println(reviewCount);
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("mainPage", "mypage/mypage_review.jsp");
		return "index";
	}
	
	@RequestMapping("*/deleteReview")
	public String deleteReview(@RequestParam("review_idx") int review_idx, 
							   @RequestParam("review_image") String review_image,
							HttpServletRequest request, Model model) {
		int deleteReview = reviewService.deleteReview(review_idx, review_image);
		String referer = request.getHeader("referer").substring(21);
		System.out.println(referer);
		request.getSession().setAttribute("url", referer);
		
		if (deleteReview != 1) {
			System.out.println("리뷰 삭제 실패");		
			request.getSession().setAttribute("alert", "삭제에 실패했습니다.");			
			return "alert";
		}else {
			System.out.println("리뷰 삭제 성공");
			request.getSession().setAttribute("alert", "삭제되었습니다.");
			return "alert";
		}
	}
	
	@RequestMapping("/mypage/mypage_memberEdit")
	public String mypage_memberEdit(Model model) {
		
		model.addAttribute("mainPage", "mypage/mypage_memberEdit.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/password")
	@ResponseBody
	public String password(@RequestParam("pw") String pw,
						   HttpServletRequest request, Model model) {
		String users_pw = (String) request.getSession().getAttribute("users_pw");
		System.out.println(users_pw);
		System.out.println(pw);
		if( !pw.equals(users_pw) ) {
			return "<script>alert('비밀번호가 올바르지 않습니다.');history.back();</script>";
		}else {
			return "<script>location.href='/mypage/mypage_memberEdit_1';</script>";
		}
	}
	
	@RequestMapping("/mypage/mypage_memberEdit_1")
	public String mypage_memberEdit_1(HttpServletRequest request, Model model) {
		
		String users_id = (String)request.getSession().getAttribute("users_id");
		UsersDto member = usersService.userDetail(users_id);
		
		model.addAttribute("member", member);
		model.addAttribute("mainPage", "mypage/mypage_memberEdit_1.jsp");
		return "index";
	}
	
	@RequestMapping("/mypage/userUpdate")
	@ResponseBody
	public String userUpdate(@RequestParam("id") String id,
							 @RequestParam("pw") String pw,
							 @RequestParam("email") String email,
							 @RequestParam("phone") String phone,
							 @RequestParam("address1") String address1,
							 @RequestParam("address2") String address2,
							 @RequestParam("address3") String address3,
							 UsersDto dto,
							 HttpServletRequest request) {
		dto.setUsers_id(id);
		dto.setUsers_pw(pw);
		dto.setUsers_email(email);
		dto.setUsers_phone(phone);
		dto.setUsers_address1(address1);
		dto.setUsers_address2(address2);
		dto.setUsers_address3(address3);
		System.out.println(pw);
		
		int result = usersService.updateUser(dto);
		if( result != 1 ) {
			System.out.println("정보수정 실패");
			return "<script>alert('변경에 실패했습니다.');history.back();</script>";
		}else {
			System.out.println("정보 변경 성공");
			request.getSession().setAttribute("users_pw", pw);
			return "<script>alert('회원정보가 변경되었습니다.');"
					+ "location.href='/mypage/mypage_memberEdit';</script>";
		}	
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
	
	//회원탈퇴
	@RequestMapping("/mypage/userDelete")
	@ResponseBody
	public String userDelete(@RequestParam("pw") String pw,
							 HttpServletRequest request,
							 Model model) {
		String users_id = (String)request.getSession().getAttribute("users_id");
		int result = usersService.deleteUser(users_id, pw);
		int point = pointService.deletePoint(users_id);
		if( result == 1 && point == 1 ) {
			System.out.println("회원 탈퇴 성공");
			request.getSession().invalidate();
			return "<script>alert('회원 탈퇴가 완료되었습니다.');location.href='/index';</script>";
		}else {
			System.out.println("탈퇴 실패");
			return "<script>alert('탈퇴에 실패했습니다.');history.back();</script>";
		}	
		
	}

	//상품 상세
	@RequestMapping("/product/product01_1")
	public String product01_1(@RequestParam("product_idx") int product_idx,
							  @RequestParam(value="revPage",defaultValue="1") String revPage,
							  @RequestParam(value="qnaPage",defaultValue="1") String qnaPage,
							  @RequestParam(value="sort",defaultValue="review_date") String sort,
							  HttpServletRequest request,
											Model model) {
		ProductDto proDe = productService.productDetail(product_idx);
		model.addAttribute("dto", proDe);
		
		String standard = "product_idx";
		int reviewCount = reviewService.reviewCount(standard, String.valueOf(product_idx), null);
		int revPageNum = (int)Math.ceil((double)reviewCount/num_page_size);
		List<ReviewDto> reviewList = reviewService.reviewList(standard, String.valueOf(product_idx), 
															revPage, num_page_size, sort, null);
		double reviewAvg = reviewService.reviewAvg(product_idx);
		if( revPageNum == 0 ) {
			revPageNum = 1;
		}
		List<ReviewDto> reviewGraph = reviewService.reviewGraph(product_idx);
		

		int qnaCount = qnaService.qnaCount(standard, String.valueOf(product_idx));
		int qnaPageNum = (int)Math.ceil((double)qnaCount/num_page_size);
		List<Product_qnaDto> qnaList = qnaService.qnaList(standard, String.valueOf(product_idx), qnaPage, num_page_size);
		if( qnaPageNum == 0 ) {
			qnaPageNum = 1;
		}
		
		model.addAttribute("qnaPage", qnaPage);
		model.addAttribute("qnaPageNum", qnaPageNum);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaCount", qnaCount);
		
		model.addAttribute("revPage", revPage);
		model.addAttribute("revPageNum", revPageNum);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("avgScore", reviewAvg);
		model.addAttribute("starGraph", reviewGraph);
		String users_id = (String) request.getSession().getAttribute("users_id");
        
        if(users_id != null) {
            UsersDto user = usersService.userDetail(users_id);
            model.addAttribute("user", user);
        } 
		model.addAttribute("mainPage", "product/product01_1.jsp");
		return "index";
        
	}
	
	@RequestMapping("/product/reviewSearch")
	@ResponseBody
	public List<ReviewDto> reviewSearch(@RequestParam("product_idx") int product_idx,
			  @RequestParam(value="revPage",defaultValue="1") String revPage,
			  @RequestParam(value="sort",defaultValue="review_date") String sort,
			  @RequestParam("word") String word,
			  HttpServletRequest request,
							Model model) {
		String standard = "product_idx";
		int reviewCount = reviewService.reviewCount(standard, String.valueOf(product_idx), word);
		int revPageNum = (int)Math.ceil((double)reviewCount/num_page_size);
		List<ReviewDto> reviewList = reviewService.reviewList(standard, 
				String.valueOf(product_idx), revPage, num_page_size, sort, word);
		
		model.addAttribute("revPage", revPage);
		model.addAttribute("revPageNum", revPageNum);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("mainPage", "product/product01_1.jsp");
		return reviewService.reviewList(standard, 
				String.valueOf(product_idx), revPage, num_page_size, sort, word);
	}
	
	@RequestMapping("/product/reviewWrite")
	@ResponseBody
	public String reviewWrite(@RequestParam("product_idx") int product_idx,
						   @RequestParam("review_star_rating") int review_star_rating,
						   @RequestParam("review_title") String review_title,
						   @RequestParam("review_content") String review_content,
						   @RequestParam(value="file", required=false) MultipartFile file,
						   ReviewDto dto,
						   Model model, HttpServletRequest request) {
		System.out.println(review_star_rating);
		String users_id = (String) request.getSession().getAttribute("users_id");
		dto.setReview_id(users_id);
		dto.setReview_title(review_title);
		dto.setReview_content(review_content);
		dto.setReview_star_rating(review_star_rating);
		dto.setProduct_idx(product_idx);
	 	
		System.out.println(file.getOriginalFilename());
	 	if( file.getOriginalFilename() != "" ) {
			 String image = reviewService.restore(file, users_id);
		 	 System.out.println(image);
		 	if( image != null ) {
				if( image.length() > 0 ) {
					dto.setReview_image(image);
					System.out.println("업로드 성공!");
				}else {
					System.out.println("업로드 실패!");	
				}
			 }else {
				System.out.println("업로드 실패!");
			 }
		 }
		
		int result = reviewService.insertReview(dto);
		if (result != 1) {
			return "<script>alert('작성에 실패했습니다.');history.back();</script>";
		} else {
			return "<script>alert('문의가 접수되었습니다.');opener.location.reload();window.close();</script>";
		}
		
	}
	
	//상품상세페이지 문의
	@RequestMapping("/product/product_qna_popup")
	public String product_qna_popup(@RequestParam("product_idx") int product_idx,
			Model model, HttpServletRequest request) {
		String users_id = (String) request.getSession().getAttribute("users_id");
		if(users_id == null) {
			request.getSession().setAttribute("alert", "로그인이 필요합니다.");
			request.setAttribute("url", "/member/login");
			return "alert";
		} else {
			UsersDto user = usersService.userDetail(users_id);
			ProductDto product = productService.productDetail(product_idx);
			model.addAttribute("user", user);
			model.addAttribute("product", product);
			return "product/product_qna_popup";
		}
		
	} 
	
	@RequestMapping("/product/qnaWrite")
	@ResponseBody
	public String qnaWrite(@RequestParam("product_idx") int product_idx,
						   @RequestParam("qna_title") String qna_title,
						   @RequestParam("qna_content") String qna_content,
						   @RequestParam(value="qna_secret", defaultValue="0") int qna_secret,
						   @RequestParam(value="qna_pw", required = false) String qna_pw,
						   Product_qnaDto dto,
						   Model model, HttpServletRequest request) {
		System.out.println(qna_pw);
		String qna_status = "답변대기중";
		String users_id = (String) request.getSession().getAttribute("users_id");
		dto.setQna_id(users_id);
		dto.setQna_title(qna_title);
		dto.setQna_content(qna_content);
		dto.setQna_secret(qna_secret);
		dto.setQna_pw(qna_pw);
		dto.setQna_status(qna_status);
		dto.setProduct_idx(product_idx);
		
		int result = qnaService.insertQna(dto);
		if (result != 1) {
			return "<script>alert('작성에 실패했습니다.');history.back();</script>";
		} else {
			return "<script>alert('문의가 접수되었습니다.');opener.location.reload();window.close();</script>";
		}
	}
	
	@RequestMapping("/product/qnapwCheck")
	@ResponseBody
	public Product_qnaDto qnapwCheck(
									 @RequestParam("qna_idx") int qna_idx,
									 @RequestParam("user_pw") String user_pw) {
		Product_qnaDto qnaDetail = qnaService.qnaDetail(qna_idx);
		return qnaDetail;
	}
	
	
	//주문
	@RequestMapping("/product/order01")
	public String order01(
			Model model, HttpServletRequest request) {
		
	    Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
	    
//	    List<CartProductDto> orderList = (List<CartProductDto>)flashMap.get("orderList");
//	    System.out.println(orderList);
		String users_id = (String) request.getSession().getAttribute("users_id");
		if(users_id == null) {
			request.getSession().setAttribute("alert", "로그인이 필요합니다.");
			request.setAttribute("url", "/member/login");
			return "alert";
		} else {
			
			UsersDto user = usersService.userDetail(users_id);
			
			model.addAttribute("user", user);
//			model.addAttribute("orderList", orderList);
			model.addAttribute("mainPage", "product/order01.jsp");
			return "index";
		}		
		
	}
	
	@RequestMapping("/product/paymentOrder")
	@ResponseBody
	public String paymentOrder(@RequestParam("no") String no,
                	        @RequestParam("total_price") String total_price,
                	        @RequestParam("comment") String comment,
                	        @RequestParam("name") String name,
                	        @RequestParam("address1") String address1,
                	        @RequestParam("address2") String address2,
                	        @RequestParam("address3") String address3,
                	        @RequestParam("phone") String phone,
                	        @RequestParam("product_name") String product_name,
                	        @RequestParam("use_point") int use_point,
                	        @RequestParam("get_point[]") ArrayList<Integer> get_point,
                	        @RequestParam("product_idx[]") ArrayList<Integer> product_idx,
                	        @RequestParam("product_count[]") ArrayList<Integer> product_count,
                	        @RequestParam("product_price[]") ArrayList<String> product_price,
                	        @RequestParam("pay_method") String pay_method,
                	        @RequestParam("users_point") int users_point,
	        OrderlistDto order, OrderDetailDto detail, PointDto point,
	        HttpServletRequest request) {
	    System.out.println(users_point);
	    String users_id = (String)request.getSession().getAttribute("users_id");
	    
	    order.setOrder_no(no);
	    order.setUsers_id(users_id);
	    order.setOrder_total_price(total_price);
	    order.setOrder_comment(comment);
	    order.setOrder_product_name(product_name);
	    order.setOrder_recipient(name);
	    order.setOrder_address1(address1);
	    order.setOrder_address2(address2);
	    order.setOrder_address3(address3);
	    order.setOrder_phone(phone);
	    orderService.insertOrder(order);

        point.setPoint_users_id(users_id);
        point.setPoint_point(-use_point);
        point.setPoint_content("상품구매시 사용");
        pointService.insertPoint(point);
        
        for(int i=0; i<product_idx.size(); i++) {
            detail.setOrder_no(no);
            detail.setProduct_idx(product_idx.get(i));
            detail.setProduct_count(product_count.get(i));
            detail.setProduct_price(product_price.get(i));
            detail.setPay_method(pay_method);
            orderService.insertOrderDetail(detail);
            
            point.setPoint_users_id(users_id);
            point.setPoint_point(get_point.get(i));
            point.setPoint_content("상품 구매(주문번호 : "+no+")");
            pointService.insertPoint(point);
            
            cartService.deleteCart(product_idx.get(i), users_id);
      
	    }
        
        usersService.updatePoint(users_point, users_id);
	    	   
	    return "넘어온당";
	}
	@RequestMapping("/product/order02")
	public String order02(@RequestParam("order_no") String order_no,
	        Model model,HttpServletRequest request) {
	    
	    String users_id = (String) request.getSession().getAttribute("users_id");
	    String col = "order_no";
	    
        if(users_id == null) {
            request.getSession().setAttribute("alert", "로그인이 필요합니다.");
            request.setAttribute("url", "/member/login");
            return "alert";
        } else {           
            OrderlistDto order = orderService.orderDto(order_no);
            UsersDto user = usersService.userDetail(users_id);
            OrderDetailDto orderDetail = orderService.detailList(order_no).get(0);
            System.out.println(order);
            
            model.addAttribute("user", user);
            model.addAttribute("pay", orderDetail);
            model.addAttribute("ord", order);
		model.addAttribute("mainPage", "product/order02.jsp");
		return "index";
        }
	}
	
	//1:1 문의
	@RequestMapping("/customer/one2one")
	public String one2one(Model model, HttpServletRequest request) {
		String users_id = (String) request.getSession().getAttribute("users_id");
		if(users_id == null) {
			request.getSession().setAttribute("alert", "로그인이 필요합니다.");
			request.setAttribute("url", "/member/login");
			return "alert";
		}

		UsersDto member = usersService.userDetail(users_id);
		model.addAttribute("member", member);
		model.addAttribute("mainPage", "customer/one2one.jsp");
		return "index";
	}
	
	//파일업로드 설정
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000); //200MB
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}
	
	
	 @RequestMapping(value="/customer/one2oneWrite", method=RequestMethod.POST) 
	 @ResponseBody
	 public String one2oneWrite(@RequestParam("one2one_title") String one2one_title,
			 					@RequestParam("one2one_content") String one2one_content,
			 					@RequestParam(value="image", required=false) MultipartFile file,
			 					@RequestParam(value="one2one_email", required=false) String one2one_email,
			 					@RequestParam(value="one2one_phone", required=false) String one2one_phone,
			 					One2oneDto dto,	HttpServletRequest request,	Model model) {

		 String one2one_id = (String) request.getSession().getAttribute("users_id");
		 dto.setOne2one_id(one2one_id);
		 dto.setOne2one_title(one2one_title);
		 dto.setOne2one_content(one2one_content);
		 dto.setOne2one_email(one2one_email);
		 dto.setOne2one_phone(one2one_phone);
		 
		 if( file.getOriginalFilename() != "" ) {
			 String image = one2oneService.restore(file, one2one_id);
		 	 System.out.println(image);
		 	if( image != null ) {
				if( image.length() > 0 ) {
					dto.setOne2one_image(image);
					System.out.println("업로드 성공!");
				}else {
					System.out.println("업로드 실패!");	
				}
			 }else {
				System.out.println("업로드 실패!");
			 }
		 }
	 	 
		 int result = one2oneService.insertOne2one(dto);
		 
		 if( result != 1 ) {
				System.out.println("글작성을 실패했습니다.");
				return "<script>alert('작성 실패');history.back();</script>";
			}else {
				System.out.println("글작성을 성공했습니다.");
				return "<script>alert('문의가 접수되었습니다.');location.href='/mypage/mypage_one2one';</script>";
			}
		 
	 }
	 
	@RequestMapping("/customer/one2oneView")
	public String one2oneView(@RequestParam("one2one_idx") int one2one_idx,
							Model model) {
	    
		One2oneDto one2oneDetail = one2oneService.one2oneDetail(one2one_idx);
		One2one_answerDto answer = answerService.one2oneAnswer(one2one_idx);
		model.addAttribute("dto", one2oneDetail);
		model.addAttribute("answer", answer);
		model.addAttribute("mainPage", "customer/one2one_view.jsp");
		
		return "index";
	}
	 
	//검색
	@RequestMapping("/product/search_result")
	public String search_result(Model model) {
		model.addAttribute("mainPage", "product/search_result.jsp");
		model.addAttribute("searchList", null);
		
		return "index";
	}
	

	@RequestMapping("/product/search_product")
	public String search_product(@RequestParam("word") String word,
								 @RequestParam("sort") String sort,
								 @RequestParam(value="page",defaultValue="1") String page,
								 HttpServletRequest request, Model model) {

		num_page_size = 6;
		int productCount = productService.productCount(word);
		int pageNum = (int)Math.ceil((double)productCount/num_page_size); 
		List<ProductDto> searchProduct = productService.searchProduct(word, sort, page, num_page_size);
		
		model.addAttribute("page", page);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchList", searchProduct);
		model.addAttribute("searchCount", productCount);
		model.addAttribute("sort", sort);		
		model.addAttribute("word", word);
		model.addAttribute("mainPage", "product/search_result.jsp");
		
		return "index";
	}
	
	//로그인
	@RequestMapping("/member/loginAction")
	public String loginAction(@RequestParam("users_id") String users_id,
							  @RequestParam("users_pw") String users_pw,
							  @RequestParam(value="autoLogin", required=false) String autoLogin,
							  HttpServletRequest request, HttpServletResponse response,
								Model model) {
		
		int result = usersService.login(users_id, users_pw);
		System.out.println("result:" + result);
		
		if( result == 1 ) {
		    if ( users_id.equals("admin")) {
                System.out.println("alert:" + "관리자로그인되었습니다.");
                
                request.getSession().setAttribute("alert", "관리자로그인되었습니다.");
                request.getSession().setAttribute("url", "/admin/admin_main");
                request.getSession().setAttribute("users_id", users_id);
                
                return "alert";
            }
			System.out.println("alert:" + "로그인되었습니다.");
			request.getSession().setAttribute("alert", "로그인되었습니다.");
			request.getSession().setAttribute("url", "/index");
			request.getSession().setAttribute("users_id", users_id);
			request.getSession().setAttribute("users_pw", users_pw);
			
			if( "autoLogin".equals(autoLogin) ) {
			    Cookie setId = new Cookie("users_id", users_id);
			    Cookie setPw = new Cookie("users_pw", users_pw);
			    setId.setPath("/");
	            setPw.setPath("/");
			    setId.setMaxAge(60*60*24*7); // 기간을 하루로 지정(60초 * 60분 * 24시간)
			    setPw.setMaxAge(60*60*24*7);
		        response.addCookie(setId); // response에 Cookie 추가
		        response.addCookie(setPw);
			}
			
			return "alert"; 				 
		}else {
			System.out.println("alert:" + "로그인 실패하였습니다.");
			
			model.addAttribute("alert", "로그인 실패하였습니다.");
			model.addAttribute("url", "/member/login");
			
			return "alert"; //index.jsp 디스패치
		}
		 
	}
	
	//로그아웃
	@RequestMapping("/member/logoutAction")
	public String logout(HttpServletRequest request, HttpServletResponse response, 
	        Model model) {
		
		request.getSession().invalidate();	
		Cookie setId = new Cookie("users_id", null);
        Cookie setPw = new Cookie("users_pw", null);
        setId.setPath("/");
        setPw.setPath("/");
        setId.setMaxAge(0);
        setPw.setMaxAge(0);
        response.addCookie(setId); // response에 Cookie 추가
        response.addCookie(setPw);
		
		request.getSession().setAttribute("alert", "로그아웃되었습니다.");
		
		return "redirect:/index";  
	}
	
	
	    


}
