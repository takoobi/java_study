package com.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@RequestMapping(value="test")
	public ModelAndView test(){
		System.out.println("확인");
		return new ModelAndView("test");
	}
}
