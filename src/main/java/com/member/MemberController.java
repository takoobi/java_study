package com.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	@Autowired
	private MemberDAO memberDao;
	
	//회원가입
	@RequestMapping("/insert")
	public String memberInsert(){
		return "member/member_add";
	}
	
	     
	
}
