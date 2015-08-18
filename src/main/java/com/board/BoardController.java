package com.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.BoardBean;


@Controller
@RequestMapping(value="board")
public class BoardController {

	@Autowired
	private BoardDAO boardDao;
	
	//글쓰기
	@RequestMapping("/write")
	public String boardWrite(){
		return "board/board_write";
	}
	
	//글쓰기 액션
	@RequestMapping("/writeAction")
	public String boardWriteAction(MultipartHttpServletRequest request) throws IOException{
		
		MultipartFile multipartFile = request.getFile("image");
		if(!multipartFile.isEmpty()){
			File file = new File("C:\\Users\\kimkoonho\\Desktop\\uploadtest", multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
		}
		
		BoardBean bean = new BoardBean();
		bean.setTitle(request.getParameter("title"));
		bean.setTag(request.getParameter("tag"));
		bean.setEmail("1234");
		bean.setImage(multipartFile.getOriginalFilename());
		bean.setDescription(request.getParameter("description"));
		bean.setCategory(request.getParameter("category"));
		
		boardDao.insert(bean);
		
		return "redirect:list?category="+request.getParameter("category");
	}

	//글 목록 보기
	@RequestMapping("/list")
	public ModelAndView boardList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("board/board_list");
		
		List<BoardBean> list = boardDao.list(request.getParameter("category"));
		mav.addObject("list", list);

		return mav;
	}
	
	//태그불러오기
	@RequestMapping(value="doList")
	public String doList(HttpServletRequest request){
		return "board/board_list";
	}
	
	//내가 쓴 글
	@RequestMapping("/mystory")
	public ModelAndView boardMystory(){
		return null;
	}
	 
	//글 삭제하기
	@RequestMapping("/delete")
	public ModelAndView boardDelete(){
		return null;
	}
	 
	//글 상세보기
	@RequestMapping("/detailView")
	public ModelAndView boardView(){
		return null;
	}
}