package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberDAO memberdao = new MemberDAO();
		MemberBean memberbean = new MemberBean();
		
		String realFolder="";
		String saveFolder="/memberImage";
		int fileSize=5*1024*1024;
		
		realFolder=request.getSession().getServletContext().getRealPath(saveFolder);
		boolean result=false;
		
		MultipartRequest multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
		
		memberbean.setEmail(multi.getParameter("email"));
		memberbean.setPw(multi.getParameter("pw"));
		memberbean.setNickname(multi.getParameter("nickname"));
		memberbean.setImage(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		memberbean.setDescription(multi.getParameter("description"));
		memberbean.setGender(multi.getParameter("gender"));
		
		memberdao.memberUpdate(memberbean);

		forward.setRedirect(true);
		forward.setPath("./url.jsp");
		return forward;
	}

}
