package com.board;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class BoardController {
	
	//사용자
	//내가 쓴 글
	@RequestMapping("BoardMystory")
	public ModelAndView boardMystory(){
		return null;
	}

	//글쓰기
	@RequestMapping("BoardWrite")
	public String boardWrite(){
		return "board/board_write";
	}
	 
	//글 목록 보기
	@RequestMapping("BoardList")
	public ModelAndView boardList(){
		return null;
	}
	
	//글 삭제하기
	@RequestMapping("BoardDelete")
	public ModelAndView boardDelete(){
		return null;
	}
	 
	//글 상세보기
	@RequestMapping("BoardView")
	public ModelAndView boardView(){
		return null;
	}
}