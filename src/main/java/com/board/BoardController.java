package com.board;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.model.BoardBean;


@Controller
public class BoardController {

	@Autowired
	private BoardDAO boardDao;
	
	//글쓰기
	@RequestMapping("BoardWrite")
	public String boardWrite(){
		return "board/board_write";
	}
	
	//글쓰기 액션
	@RequestMapping("BoardWriteAction")
	public String boardWriteAction(MultipartHttpServletRequest request) throws IOException{
		MultipartFile multipartFile = request.getFile("image");
		if(!multipartFile.isEmpty()){
			File file = new File("C:\\Users\\kimkoonho\\Desktop\\uploadtest", multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
		}
		
		BoardBean bean = new BoardBean();
		bean.setTitle(request.getParameter("title"));
		bean.setTag(request.getParameter("tag"));
		bean.setEmail(request.getParameter("email"));
		bean.setImage(multipartFile.getOriginalFilename());
		bean.setDescription(request.getParameter("description"));

		boardDao.boardInsert();
		
		return "redirect:BoardList";
	}
	//내가 쓴 글
	@RequestMapping("BoardMystory")
	public ModelAndView boardMystory(){
		return null;
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