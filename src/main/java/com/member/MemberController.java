package com.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//관리자
	//회원목록보기
	@RequestMapping("MemberList")
	public ModelAndView memberList(){
		return null;
	}

	//사용자
	//회원가입하기
	@RequestMapping("MemberAdd")
	public String memberAdd(){
		return "member/member_add";
	}
	
	//회원정보수정
	@RequestMapping("MemberModify")
	public ModelAndView memberModify(){
		return null;
	}
	
	//회원탈퇴하기
	@RequestMapping("MemberDelete")
	public ModelAndView memberDelete(){
		return null;
	}
	
	//로그인하기
	@RequestMapping("MemberLogin")
	public ModelAndView memberLogin(){
		return null;
	}
	 
	//로그아웃하기
	@RequestMapping("MemberLogout")
	public ModelAndView memberLogout(){
		return null;
	}
	
	//비밀번호찾기
	@RequestMapping("MemberFind")
	public ModelAndView memberFind(){
		return null;
	}
}