package com.board;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.ActionForward;
import board.BoardBean;
import board.BoardDAO;

@Controller
public class BoardController {
	@RequestMapping(value="BoardWrite")
	board/board_write
	@RequestMapping(value="BoardAddAction")
	BoardDAO boarddao = new BoardDAO();
	BoardBean boardbean = new BoardBean();
	ActionForward forward = new ActionForward();
	HttpSession session=request.getSession();
	
	String realFolder="";
	String saveFolder="/memberImage";
	int fileSize=5*1024*1024;
	
	realFolder=request.getSession().getServletContext().getRealPath(saveFolder);
	boolean result=false;
	
	MultipartRequest multi=null;
	multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
	
	boardbean.setEmail((String) session.getAttribute("email"));
	boardbean.setNickname((String)session.getAttribute("nickname"));
	boardbean.setTitle(multi.getParameter("title"));
	boardbean.setDescription(multi.getParameter("description"));
	boardbean.setTag(multi.getParameter("tag"));
	boardbean.setImage(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	
	result = boarddao.boardInsert(boardbean, multi.getParameter("category"));
	if(result==false){
		return null;
	}
	
	forward.setRedirect(true);
	forward.setPath("./BoardList.bo");
	@RequestMapping(value="BoardList")
	@RequestMapping(value="")
}
