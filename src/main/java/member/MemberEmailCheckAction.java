package member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class MemberEmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberDAO memberdao=new MemberDAO();
		String email = request.getParameter("email");
		
		boolean result = memberdao.memberEmailCheck(email);
		PrintWriter out=response.getWriter();
		
		JSONObject ob =new JSONObject();
	
		ob.put("result", result);

		out.print(ob);
		
		return null;
	}

}
