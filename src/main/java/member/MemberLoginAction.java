package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		ActionForward forward = new ActionForward();
		MemberDAO memberdao=new MemberDAO();
		
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		int check=memberdao.memberCheck(email,pw);
		if(check==1){
			String nickname = memberdao.getNickname(email);
			session.setAttribute("email", email);
			session.setAttribute("nickname", nickname);
			forward.setRedirect(true);
			forward.setPath("./url.jsp");
			return forward;
		}else if(check==0){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return null;
	}
}