package com.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	int currentBlock = 1;
	
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
		bean.setEmail("sbv200@hanmail.net");
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
		String blockNum = request.getParameter("blockNum"); 
		String pageNum = request.getParameter("pageNum");
		
		List<BoardBean> list = new ArrayList<BoardBean>();
		
        if(blockNum!=null)
        {
            currentBlock = Integer.parseInt(blockNum);
        }
        
		int pageSize = 5; //보여줄 게시글 갯수
		int blockSize = 5; //보여줄 블록 갯수
        int totalSize = boardDao.totalCount(category, result); //전체게시글 갯수
        int totalPage = (int)(Math.ceil((double)totalSize/pageSize)); //전체페이지 갯수
        int totalBlock = (int)(Math.ceil((double)totalPage/blockSize)); //전체블록 갯수
        int startPage = (currentBlock-1)*blockSize+1; //시작페이지
        int endPage = startPage + blockSize - 1; //끝페이지
        int startNum;
        int endNum;
        int currentPage;
        
        if(endPage>totalPage) endPage=totalPage;
        if(pageNum==null) pageNum="1";
        currentPage = Integer.parseInt(pageNum);
        
        startNum = (currentPage-1)*pageSize+1;
        endNum = startNum+pageSize-1;
        
        if(endNum>totalSize) endNum=totalSize;
        
        if(totalSize>0)
        {
        	list = boardDao.pagingList(category, result, startNum, endNum);
            if(list.isEmpty())
            {
                currentPage -= 1;
                //return "redirect:list?pageNum="+currentPage;
            }
        }
        int number= totalSize-startNum+1;
		
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
					+ "\"create_date\":\""+boardBean.getCreate_date()+"\"}";
		    if( i != list.size() -1){
		        json += ",";
		    }
		}
		json += "]";
		jsonObject.put("list", json);
		jsonObject.put("pageSize", pageSize);
		jsonObject.put("blockSize", blockSize);
		jsonObject.put("number", number);
		jsonObject.put("totalPage", totalPage);
		jsonObject.put("totalSize", totalSize);
		jsonObject.put("totalBlock", totalBlock);
		jsonObject.put("startPage", startPage);
		jsonObject.put("endPage", endPage);
		jsonObject.put("startNum", startNum);
		jsonObject.put("endNum", endNum);
		jsonObject.put("currentPage", currentPage);
		jsonObject.put("currentBlock", currentBlock);
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