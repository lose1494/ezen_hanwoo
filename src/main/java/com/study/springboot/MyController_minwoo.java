package com.study.springboot;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@PostMapping("/member/idCheck")
	@ResponseBody
	public int id_check_result ( Model model, @RequestBody String userId ){
	System.out.println("ID:" + userId); 
	int count = 0;
		count = usersService.id_check_result(userId);
		System.out.println("count  : " + count); 
		model.addAttribute("result", count);
		return count;
	}

	@RequestMapping("/member/joinAction") 
	public String joinAction (@RequestBody Map<String, String> param ) {	 
		System.out.println(param); 
	
		int result = 0;
		result = usersService.joinAction( param ); 
		System.out.println("query result:" + result); 
		if( result == 1 ) {
			return "redirect:login";
		} else {
			return "redirect:join";
		}
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

	@RequestMapping("/member/find")
	@ResponseBody
	public Map<String, String> find (Model model, @RequestBody Map<String, String> param) {
        /*
         * System.out.println(param);
         * System.out.println(usersService.find(param));
         */
	      
	    return  usersService.find(param);
	}
	

}
