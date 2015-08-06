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
		
		//�α����� ������ ��� �ǵ��ư���. �̷� ��찡 ������ �ʰ� �α����� �� ��������� �ϴ� �ۼ�.
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
				out.println("alert('��й�ȣ�� ���� �ʽ��ϴ�.');");
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
