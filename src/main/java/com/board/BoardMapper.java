package com.board;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.BoardBean;
import com.model.BoardFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("board/")
public class BoardMapper {
	private BoardFile fileBean = null;

	@Autowired
	private BoardDAO boardDao;
	
	//글쓰기
	@RequestMapping("writePage")
	public String writePage(){
		return "board/write";
	}
	
	//글쓰기 액션
	@RequestMapping("doWrite")
	public String doWrite(MultipartHttpServletRequest request) throws IOException{
		
		BoardBean bean = new BoardBean();
		bean.setTitle(request.getParameter("title"));
		bean.setTag(request.getParameter("tag"));
		bean.setDescription(request.getParameter("description"));
		
		System.out.println(request.getParameter("description"));

		boardDao.boardInsert(bean);
		
		return "redirect:BoardList";
	}
	//내가 쓴 글
	@RequestMapping("BoardMystory")
	public ModelAndView boardMystory(){
		return null;
	}
	 
	//글 목록 보기
	@RequestMapping("listPage")
	public String listPage(){
		return "board/cafe_list";
		
	}
	
	@RequestMapping("doList")
	@ResponseBody
	public Map doList(HttpServletRequest request){		
		List<BoardBean> boardlist;		
		String tags = request.getParameter("tags");		
		Map<String, Object> obj;
		
		if(tags == ""){
			boardlist=new ArrayList<BoardBean>();	
			obj = new HashMap<String, Object>();
		  	int page=1;  // 현재 페이지 번호
			
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}	

			// 페이지 번호(page)를 DAO클래스에게 전달한다.
			boardlist = boardDao.boardList(page); //리스트를 받아옴.			
			
	   		obj.put("boardlist", boardlist);
	   		obj.put("page", page);
	   		
			return obj;
		} else {
			String[] tagBox = tags.split(",");
			boardlist = tagBoardList(tagBox);
			
			obj = new HashMap<String, Object>();
			
			obj.put("boardlist", boardlist);
			return obj;
		}
		
	}		
	
		
		
	public List<BoardBean> tagBoardList(String[] tagBox){
		List<BoardBean> list = boardDao.selectAll();
		List<BoardBean> result = new ArrayList<BoardBean>();
		for(BoardBean bean : list){
			String[] tmp = bean.getTag().split(",");
			for(String tag : tmp){
				if(tagDiff(tagBox, tag)){
					result.add(bean);
					break;
				};
			}			
		}	
		return result;
	}
		
		
	public boolean tagDiff(String[] tagBox, String tag){
		for(String item : tagBox){
			if(item.equals(tag)){
				return true;
			}			
		}
		return false;
	}
	
	@RequestMapping("ajaxImage")
	@ResponseBody
	public Object ajaxImage(MultipartHttpServletRequest request, HttpSession session) throws IOException{
		fileBean = new BoardFile();
		String realPath = session.getServletContext().getRealPath("/");
		String imagePath = realPath+"resources\\upload";
		
		MultipartFile multipartFile = request.getFile("fileToUpload");
		if(!multipartFile.isEmpty()){
			File file = new File(imagePath, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			fileBean.setPath(file.getAbsolutePath());
			fileBean.setName(multipartFile.getOriginalFilename());
			fileBean.setSize(multipartFile.getSize());
			fileBean.setMessage("uploadSuccess");
		}	
		
		return fileBean;
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