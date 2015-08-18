package com.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
	
	String category="";
	
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

	//글 목록화면
	@RequestMapping("/list")
	public String list(){
		return "board/board_list";
	}
	
	//태그불러오기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/doList")
	public void doList(HttpServletRequest request, HttpServletResponse response){
		String result = request.getParameter("result");
		category = request.getParameter("category");
		int num = Integer.parseInt(request.getParameter("num"));
		int startNum = (num-1)*6+1;
		int endNum = startNum+5;
		List<BoardBean> list = new ArrayList<BoardBean>();
        
        list = boardDao.pagingList(category, result, startNum, endNum);
		
		JSONObject jsonObject = new JSONObject();
		String json="[";
		for(int i=0; i<list.size(); i++){
			BoardBean boardBean = (BoardBean) list.get(i);
			json+="{\"pk\":\""+boardBean.getPk()+"\","
					+ "\"email\":\""+boardBean.getEmail()+"\","
					+ "\"title\":\""+boardBean.getTitle()+"\","
					+ "\"description\":\""+boardBean.getDescription()+"\","
					+ "\"tag\":\""+boardBean.getTag()+"\","
					+ "\"image\":\""+boardBean.getImage()+"\","
					+ "\"good\":\""+boardBean.getGood()+"\","
					+ "\"bad\":\""+boardBean.getGood()+"\","
					+ "\"hit\":\""+boardBean.getHit()+"\","
					+ "\"create_date\":\""+boardBean.getCreate_date()+"\","
					+ "\"category\":\""+category+"\"}";
		    if( i != list.size() -1){
		        json += ",";
		    }
		}
		json += "]";
		jsonObject.put("list", json);
		//System.out.println(jsonObject);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out; 
		try{
			out = response.getWriter();
			out.print(jsonObject.toJSONString());
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	//글 상세보기
	@RequestMapping("/board_view")
	public ModelAndView board_view(HttpServletRequest request){
		int pk = Integer.parseInt(request.getParameter("pk"));
		String category = request.getParameter("category");
		ModelAndView mav= new ModelAndView();
		mav.setViewName("board/board_view");
		
		BoardBean boardBean = boardDao.one_board(category, pk);
		mav.addObject("boardBean", boardBean);
		return mav;
	}

	//공감, 공감취소, 비공감, 비공감취소
	@RequestMapping("/emotion")
	public void emotion(HttpServletRequest request, HttpSession session){
		int number = Integer.parseInt(request.getParameter("number"));
		int pk = Integer.parseInt(request.getParameter("pk"));
		category=request.getParameter("category");
		String id=(String) session.getAttribute("email");

		//1-공감,2-공감취소,3-비공감,4-비공감취소		
		boardDao.emotion(category, number, pk, id);
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
	

}