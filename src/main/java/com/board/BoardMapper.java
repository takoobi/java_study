package com.board;

import java.io.File;
import java.io.IOException;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.BoardBean;
import com.model.BoardFile;
import com.model.Tag;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("board/")
public class BoardMapper {
	private BoardBean boardBean;
	private Tag tag;
	private String category;

	@Autowired
	private BoardDAO boardDao;
	
	//글쓰기 페이지
	@RequestMapping("write")
	public String writePage(){
		return "board/write";
	}
	
	//게시판 페이지
	@RequestMapping(value="list/{category}",method=RequestMethod.GET)
	public String view(@PathVariable("category") String category, Model model){
		this.category = category;
		List<String> list = boardDao.getTagList(category);		
		model.addAttribute("taglist",list);
		return "board/"+category;
	}
	
	
	//글쓰기 액션
	@RequestMapping("doWrite")
	public String doWrite(MultipartHttpServletRequest request) throws IOException{				
		String[] tags = request.getParameter("tag").replaceAll("\\s", "").split(",");
		//String category = (String)session.getAttribute("category");
		boardBean = new BoardBean();	
		tag = new Tag();
		System.out.println(category);
		boardBean.setTitle(request.getParameter("title"));
		boardBean.setDescription(request.getParameter("description"));
		boardBean.setCategory(category);
		
		boardDao.boardInsert(boardBean);

		for(String item : tags){
			tag.setBoard_pk(boardDao.getBoardPk());
			tag.setName(item);
			tag.setMember_pk(1);
			tag.setCategory(category);			
			boardDao.tagInsert(tag);
		}
			
		return "redirect:list/"+category;		
	}
	//내가 쓴 글
	@RequestMapping("BoardMystory")
	public ModelAndView boardMystory(){
		return null;
	}
	 

	//글 상세보기
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public String boardView(@PathVariable("id") int id, Model model){
		Map map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("id", id);
		BoardBean board = boardDao.getBoard(map);
		
		model.addAttribute("board",board);
		
		return "board/detail";
	}
	
	@RequestMapping(value="doList/{page}",method=RequestMethod.GET)
	@ResponseBody
	public Map doList(@PathVariable("page") int page, @RequestParam String tags){		
		List<BoardBean> boardlist;		
		Map<String, Object> obj;
		
		//String category = (String)session.getAttribute("category");
		
		if(tags == ""){	//태그가 없을경우 전체 글을 읽어옴
			boardlist=new ArrayList<BoardBean>();	
			obj = new HashMap<String, Object>();
			
			obj.put("category", category);
			obj.put("page", page);	
			// 페이지 번호(page)를 DAO클래스에게 전달한다.
			boardlist = boardDao.boardList(obj); 
	   		obj.put("boardlist", boardlist);	   		
	   		
			return obj;
		} else {	// 태그가 있을 경우 태그에 해당하는 글을 읽어옴
			boardlist=new ArrayList<BoardBean>();	
			obj = new HashMap<String, Object>();	
			String[] tagBox = tags.split(",");			
			
			obj.put("tags", tagBox);
			obj.put("category", category);
			obj.put("page", page);	
			
			boardlist = boardDao.BoardPkOfTag(obj);
			
			obj.put("boardlist", boardlist);
			return obj;
		}
		
	}	
	
	/*@RequestMapping("ajaxImage")
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
	}*/
	//글 삭제하기
	@RequestMapping("BoardDelete")
	public ModelAndView boardDelete(){
		return null;
	}
	 
	
}