package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		return forward;
	}

}
