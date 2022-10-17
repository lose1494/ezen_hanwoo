package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.UsersDto;
import com.study.springboot.service.UsersService;

@Controller
public class MyController_minwoo {

	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/member/login")
	public String login (Model model) {
		model.addAttribute("mainPage","member/login.jsp");
		return "index";
	}

	@RequestMapping("/member/join")
	public String join  (Model model) {
		model.addAttribute("mainPage","member/join.jsp");
		return "index";
	}


	@RequestMapping("/member/joinAction") 
	public String memberJoin (Model model, @ModelAttribute UsersDto usersInfo ) {	 
		System.out.println(usersInfo);
	
		int result = 0;
		try { 
			result = usersService.memberJoin( usersInfo ); 
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		System.out.println("result:" + result); 
		
		if( result == 1 ) {
			model.addAttribute("mainPage", "/main.jsp");
			System.out.println("dd");
		} else {
			return "<script>alert('회원가입 실패!');history.back();</script>";
		}
		return "redirect:/index";
	}

	@RequestMapping("/member/join2")
	public String join2 (Model model) {
		model.addAttribute("mainPage","member/join2.jsp");
		return "index";
	}

	@RequestMapping("/member/idFind")
	public String idFind (Model model) {
		model.addAttribute("mainPage","member/idFind.jsp");
		return "index";
	}

	@PostMapping("/member/join")
	@ResponseBody
	public int id_check_result ( Model model, @RequestBody String userId ){
	System.out.println("ID:" + userId); 
	int count = 0;
		count = usersService.id_check_result(userId);
		System.out.println("result  : " + count); 
		model.addAttribute("result", count);
		return count;
	}

}
