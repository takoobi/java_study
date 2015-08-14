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
import java.util.List;

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
	public List<BoardBean> doList(HttpServletRequest request){		
		List<BoardBean> boardlist;		
		String tags = request.getParameter("tags");
		
		if(tags == ""){
			System.out.println("null 이당    " + tags );
			boardlist=new ArrayList<BoardBean>();
//			BoardDAOImpl bd=new BoardDAOImpl();
			
		  	int page=1;  // 현재 페이지 번호
			int limit=10;  // 한 화면에 출력할 레코드수
			
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			

			/*int listcount=this.boardService.getListCount();*/ //총 리스트 수를 받아옴.
			int listcount=boardDao.listCount();

			
			// 페이지 번호(page)를 DAO클래스에게 전달한다.
			boardlist = boardDao.boardList(page); //리스트를 받아옴.
			
			//총 페이지 수.
	   		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
	   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	   		int endpage = maxpage;
	   		
	   		if (endpage>startpage+10-1) endpage=startpage+10-1;
	   		
	   		request.setAttribute("page", page);		  //현재 페이지 수.
	   		request.setAttribute("maxpage", maxpage); //최대 페이지 수.
	   		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수.
	   		request.setAttribute("endpage", endpage);     //현재 페이지에 표시할 끝 페이지 수.
			request.setAttribute("listcount",listcount); //글 수.
			request.setAttribute("boardlist", boardlist);
			
			return boardlist;
		} else {
			String[] tagBox = tags.split(",");
			boardlist = tagBoardList(tagBox);
		}
		
		return null;
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