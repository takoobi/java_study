package com.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.member.model.MemberBean;


@Controller
public class MemberController {
	static SqlSession session = null;
	private String id;
	private MemberBean member;
	
	@RequestMapping(value="test")
	public ModelAndView test(){
		System.out.println("확인");
		return new ModelAndView("test");
	}
}
