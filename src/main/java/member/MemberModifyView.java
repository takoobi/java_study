package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberModifyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		
		MemberDAO memberdao = new MemberDAO();
		MemberBean one_member_data = new MemberBean();
		
		one_member_data=memberdao.getOneMemberData((String)session.getAttribute("email"));
		
		if(one_member_data==null){
			return null;
		}
		
		request.setAttribute("OneMemberData", one_member_data);
		forward.setRedirect(false);
		forward.setPath("./member/member_modify.jsp");
		return forward;
	}
}