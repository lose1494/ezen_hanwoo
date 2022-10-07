package com.study.springboot;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.UsersDto;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.UsersService;


@Controller
public class MyController_ian {
  
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private UsersService usersService;
	
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
	
	//이용자 공지사항
	@RequestMapping("/Notice/notice")
	public String notice (Model model) {
		model.addAttribute("mainPage", "notice/notice.jsp");
		return "index";
	}
	
	//이용자 공지사항 글
	@RequestMapping("/Notice/notice_view")
	public String notice_view (Model model) {
		model.addAttribute("mainPage", "notice/notice_view.jsp");
		return "index";
	}
	
	//이용자 자주하는 질문
	@RequestMapping("/Notice/faq")
	public String faq (Model model) {
		model.addAttribute("mainPage", "notice/faq.jsp");
		return "index";
	}
	
	//관리자 페이지 메인
	@RequestMapping("/admin/admin_main")
	public String userList (Model model) {
		String list = "all";
		String text = "";
		List<UsersDto> userList = usersService.search_result(list, text);
		int list_Count = usersService.list_Count();
		model.addAttribute("list_Count", list_Count);
		model.addAttribute("search_result", userList);
		model.addAttribute("mainPage", "admin/admin_main.jsp");
		return "index";
	}
	
	//회원 검색
	@RequestMapping("/admin/member_search")
	public String member_search (@RequestParam("search_list") String list,
								 @RequestParam("search_text") String text,
								  Model model ) {
		System.out.println(list);
		List<UsersDto> search_result = usersService.search_result(list, text);
		model.addAttribute("search_result", search_result);
		model.addAttribute("list", list);
		model.addAttribute("text", text);
		model.addAttribute("mainPage", "admin/admin_main.jsp");
		return "index";
	}
	
	//회원상세조회
	@RequestMapping("/admin/admin_maindetail")
	public String admin_maindetail (Model model) {
		List<UsersDto> users_list = usersService.userList();
		model.addAttribute("userList", users_list);	
		model.addAttribute("mainPage", "admin/admin_maindetail.jsp");
		return "index";
	}
	
	//상품관리
	@RequestMapping("/admin/admin_item")
	public String adminitem (Model model) {
		model.addAttribute("mainPage", "admin/admin_item.jsp");
		return "index";
	}
	
	//상품등록
	@RequestMapping("/admin/item_register")
	public String item_register (Model model) {
		model.addAttribute("mainPage", "admin/item_register.jsp");
		return "index";
	}
	
	//상품 상세조회
	@RequestMapping("/admin/item_check")
	public String item_check (Model model) {
		model.addAttribute("mainPage", "admin/item_check.jsp");
		return "index";
	}
	
	//상품 수정
	@RequestMapping("/admin/item_revise")
	public String item_revise (Model model) {
		model.addAttribute("mainPage", "admin/item_revise.jsp");
		return "index";
	}
	
	//주문관리
	@RequestMapping("/admin/admin_order")
	public String adminorder (Model model) {
		model.addAttribute("mainPage", "admin/admin_order.jsp");
		return "index";
	}

	//주문 상세 조회
	@RequestMapping("/admin/admin_order_detail")
	public String admin_order_detail (Model model) {
		model.addAttribute("mainPage", "admin/admin_order_detail.jsp");
		return "index";
	}
	
	//리뷰 관리
	@RequestMapping("/admin/admin_review")
	public String admin_review (Model model) {
		model.addAttribute("mainPage", "admin/admin_review.jsp");
		return "index";
	}
	
	//상품 문의 관리
	@RequestMapping("/admin/admin_inquiry")
	public String admin_inquiry (Model model) {
		model.addAttribute("mainPage", "admin/admin_inquiry.jsp");
		return "index";
	}
	
	//공지사항 관리
	@RequestMapping("/admin/admin_notice")
	public String admin_notice (Model model) {

		List<NoticeDto> admin_notice_list = noticeService.admin_notice_list(); 
		model.addAttribute("admin_notice_list", admin_notice_list);
		model.addAttribute("mainPage", "admin/admin_notice.jsp");
		return "index";
	}

	//공지사항 글쓰기
	@RequestMapping("/admin/admin_noticewrite")
	public String admin_noticewrite (Model model) {
		model.addAttribute("mainPage", "admin/admin_noticewrite.jsp");
		return "index";
	}
	
	//ck5 파일업로드
	@PostMapping(value = "/image/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");

		MultipartFile uploadFile = request.getFile("upload");

		String originalFileName = uploadFile.getOriginalFilename();

		String ext = originalFileName.substring(originalFileName.indexOf("."));

		String newFileName = UUID.randomUUID() + ext;

		String realPath = request.getServletContext().getRealPath("/");

		String savePath = realPath + "upload/" + newFileName;
  
		String uploadPath = "./upload/" + newFileName; 

		File file = new File(savePath);

		uploadFile.transferTo(file);

		mav.addObject("uploaded", true);
		mav.addObject("url", uploadPath);

		return mav;
	}
	
	//글쓰기 등록
	@RequestMapping("/notice_writeAction")
	@ResponseBody
	public String notice_writeAction(
			@RequestParam("type") String notice_title,
			@RequestParam("editor") String notice_content,
			NoticeDto dto1 ) {
		
		dto1.setNotice_title(notice_title);
		dto1.setNotice_content(notice_content);
		
		int result= noticeService.notice_write( dto1 );
		System.out.println(result);
		
		if( result != 1) {
			System.out.println("글쓰기 실패했습니다.");
			return"<script>alert('글쓰기 실패');history.back();</script>";		
		} else {
			System.out.println("글쓰기 등록이 되었습니다.");
			return"<script>alert('글쓰기 성공');location.href='/admin/admin_notice';</script>";		
		}
		
	}

	
	//1:1문의
	@RequestMapping("/admin/admin_one2one")
	public String admin_one2one (Model model) {
		model.addAttribute("mainPage", "admin/admin_one2one.jsp");
		return "index";
	}
	
	//자주하는 질문
	@RequestMapping("/admin/admin_faq")
	public String admin_faq (Model model) {
		model.addAttribute("mainPage", "admin/admin_faq.jsp");
		return "index";
	}  
	
	//상품상세페이지 리뷰등록
	@RequestMapping("/product/product_review_popup")
	public String product_review_popup() {
		return "product/product_review_popup";
	}  
	
}

	