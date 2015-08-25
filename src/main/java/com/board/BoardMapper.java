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
import com.model.Reply;
import com.model.Tag;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
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
	public String writePage(Model model){
		model.addAttribute("category", category);
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
	
	//광장  페이지
	@RequestMapping(value="square",method=RequestMethod.GET)
	public String square(Model model){
		List<String> list = new ArrayList<String>();
		Map<String, Object> result = new HashMap<String, Object>();
		list = boardDao.getCategory();
		
		//result.put("category", list);
		for(String item : list){
			result.put(item, boardDao.recentBoard(item));
		}
		model.addAttribute("result",result);
		
		return "board/square";
	}
	
	
	//글쓰기 액션
	@RequestMapping(value="doWrite", method=RequestMethod.POST)
	public String doWrite(MultipartHttpServletRequest request, HttpSession session) throws IOException{				
		String[] tags = request.getParameter("tag").replaceAll("\\s", "").split(",");
		//String category = (String)session.getAttribute("category");
		boardBean = new BoardBean();	
		tag = new Tag();
		boardBean.setTitle(request.getParameter("title"));
		boardBean.setDescription(request.getParameter("description"));
		boardBean.setCategory(category);
		boardBean.setMember_pk((Integer) session.getAttribute("member_pk"));
		
		boardDao.boardInsert(boardBean);
		
		for(String item : tags){
			tag.setBoard_pk(boardDao.getBoardPk());
			tag.setName(item);
			tag.setMember_pk((Integer) session.getAttribute("member_pk"));
			tag.setCategory(category);			
			boardDao.tagInsert(tag);
		}
			
		return "redirect:list/"+category;		
	}
	
	//댓글달기
	@RequestMapping(value="doReply", method=RequestMethod.POST)
	@ResponseBody
	public Object doReply(@RequestParam String content, @RequestParam int member_pk,
			@RequestParam int board_pk){				
		Reply reply = new Reply();
		reply.setBoard_pk(board_pk);
		reply.setMember_pk(member_pk);
		reply.setContent(content);
		boardDao.replyInsert(reply);
		
		return reply;		
	}	
	
	@RequestMapping(value="gbUpdate", method=RequestMethod.GET)
	@ResponseBody
	public Object gbUpdate(@RequestParam("board_pk") int board_pk,
			@RequestParam("status") String status,@RequestParam int member_pk,
			@RequestParam("category") String category ){	
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("board_pk", board_pk);
		data.put("member_pk", member_pk);
		data.put("category", category);
		data.put("status", status);
		
		if(boardDao.getMember_pkGB(data) == null){
			if(category.equals("board")){
				boardDao.gbUpdate(data);
			} else {
				boardDao.gbReply(data);
			}
			boardDao.gbInsert(data);
			if(status.equals("good")){			
				boardDao.goodUpdate(data);
			} else {
				boardDao.badUpdate(data);
			}
		} else {
			if(category.equals("board")){
				boardDao.gbUpdate(data);
			} else {
				boardDao.gbReply(data);
			}
			if(status.equals("good")){			
				boardDao.goodUpdate(data);
			} else {
				boardDao.badUpdate(data);
			}
		};	
				
		
		return null;
	}
	
	@RequestMapping(value="gbCheck", method=RequestMethod.GET)
	@ResponseBody
	public Object gbCheck(@RequestParam("board_pk") int board_pk,
			@RequestParam("status") String status,@RequestParam int member_pk, 
			@RequestParam("category") String category ){				
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("board_pk", board_pk);
		data.put("member_pk", member_pk);
		data.put("category", category);
		data.put("status", status);
		return boardDao.gbCheck(data);
	}
/*	create table goodbad(
			board_pk number(10),
			member_pk number(10),
			category varchar2(10),	
			good varchar2(5),
			bad varchar2(5)
		);*/
	//글 상세보기
	@RequestMapping(value="detail/{pk}", method=RequestMethod.GET)
	public String boardView(@PathVariable("pk") int pk, Model model){
		List<Object> list = new ArrayList<Object>();
		boardDao.updateCount(pk);
		BoardBean board = boardDao.getBoard(pk);
		
		list = boardDao.getReply(pk);
		
		model.addAttribute("board",board);
		model.addAttribute("reply",list);
		
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
			
			boardlist = boardDao.boardPkOfTag(obj);
			
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