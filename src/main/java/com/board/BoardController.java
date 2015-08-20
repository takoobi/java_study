package com.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.BoardBean;
import com.model.ReplyBean;


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
		
		return "redirect:"+request.getParameter("category");
	}

	//글 목록화면
	@RequestMapping("/{category}")
	public String list(@PathVariable("category") String category, Model model){
		model.addAttribute("category", category);
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
	public ModelAndView board_view(HttpServletRequest request,HttpSession session){
		int pk = Integer.parseInt(request.getParameter("pk"));
		String category = request.getParameter("category");
		String email = (String)session.getAttribute("email");
		Boolean good_id_check;
		Boolean bad_id_check;
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("board/board_view");
		
		BoardBean boardBean = boardDao.one_board(category, pk);
		mav.addObject("boardBean", boardBean);
		if(email!=null){
			if(boardBean.getGood_id()!=null){
				good_id_check=boardBean.getGood_id().contains(email);
			}else{
				good_id_check=false;
			}
			if(boardBean.getBad_id()!=null){
				bad_id_check=boardBean.getBad_id().contains(email);
			}else{
				bad_id_check=false;
			}
			mav.addObject("good_id_check", good_id_check);
			mav.addObject("bad_id_check", bad_id_check);
		}
		
		return mav;
	}

	//공감, 공감취소, 비공감, 비공감취소
	@RequestMapping("/emotion")
	public @ResponseBody Map<String, Object> emotion(HttpServletRequest request, HttpSession session){
		int number = Integer.parseInt(request.getParameter("number"));
		int pk = Integer.parseInt(request.getParameter("pk"));
		category=request.getParameter("category");
		String email=(String) session.getAttribute("email");

		//1-공감,2-공감취소,3-비공감,4-비공감취소		
		boardDao.emotion(category, number, pk, email);
		Map<String, Object> map = new HashMap<String, Object>();	
		map = boardDao.emotion_count_get(category, pk);

		String good_id = null;
		String bad_id=null;
		Boolean good_id_check=null;
		Boolean bad_id_check=null;
		
		if(map!=null){
			if(map.get("good_id")!=null){
				good_id = (String) map.get("good_id");
				good_id_check = good_id.contains(email);
			}else {
				good_id_check=false;
			}
			if(map.get("bad_id")!=null){
				bad_id = (String) map.get("bad_id");					
				bad_id_check = bad_id.contains(email);				
			}else{
				bad_id_check=false;			
			}			
		}
		
		map.remove("good_id");
		map.remove("bad_id");
		map.put("good_id_check", good_id_check);
		map.put("bad_id_check", bad_id_check);
		return map;
	}
	
	//댓글 추가하기
	@RequestMapping("/reply")
	public @ResponseBody List<ReplyBean> reply(HttpServletRequest request, HttpSession session){
		String description = request.getParameter("description");
		String board_key = request.getParameter("board_key");
		String email = (String)session.getAttribute("email");
		
		if(description!=null){
			boardDao.reply_insert(description, board_key, email);
		}
		List<ReplyBean> list = boardDao.reply_getData(board_key);

		return list;
	}
	
	//광장
	@RequestMapping("/allList")
	public @ResponseBody Map<String, Object> allList(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BoardBean> list=boardDao.get_setCount_board("cafe");
		for (BoardBean boardBean : list) {
			boardBean.setCategory("cafe");
		}
		map.put("cafe", list);
    	list=boardDao.get_setCount_board("bar");
		map.put("bar", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("bar");
		}
		list=boardDao.get_setCount_board("school");
		map.put("school", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("school");
		}
		list=boardDao.get_setCount_board("penthouse");
		map.put("penthouse", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("penthouse");
		}
		list=boardDao.get_setCount_board("military");
		map.put("military", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("military");
		}
		list=boardDao.get_setCount_board("exile");
		map.put("exile", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("exile");
		}
		list=boardDao.get_setCount_board("music");
		map.put("music", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("music");
		}
		list=boardDao.get_setCount_board("broadcast");
		map.put("broadcast", list);
		for (BoardBean boardBean : list) {
			boardBean.setCategory("broadcast");
		}
		
		return map;
	}
}