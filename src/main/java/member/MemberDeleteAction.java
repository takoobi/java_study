package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		MemberDAO memberdao=new MemberDAO();
		String email=(String)session.getAttribute("email");
		String pw=request.getParameter("pw");
		
		//로그인을 안했을 경우 되돌아가기. 이럴 경우가 생기지 않게 로그인한 후 만들겠지만 일단 작성.
		if(email==null){
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		try{
			int check=memberdao.memberDelete(email,pw);
			
			if(check==1){
				session.invalidate();
				forward.setPath("./url.jsp");
			}else{
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 맞지 않습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				forward=null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return forward;
	}

}
