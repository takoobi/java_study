package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.me")
public class MemberFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/MemberAdd.me")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_add.jsp");
		}
		if(command.equals("/MemberAddAction.me")){
			action=new MemberAddAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(command.equals("/MemberLogin.me")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_login.jsp");
		} 
		if(command.equals("/MemberLoginAction.me")){
			action=new MemberLoginAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(command.equals("/MemberModify.me")){
			action=new MemberModifyView();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberDeleteAction.me")){
			action=new MemberDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberDelete.me")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_delete.jsp");
		} 
		if(command.equals("/MemberLogout.me")){
			action=new MemberLogoutAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberModifyAction.me")){
			action=new MemberModifyAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberFind.me")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_find.jsp");
		} 
		if(command.equals("/MemberFindAction.me")){
			action=new MemberFindAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberNicknameCheckAction.me")){
			action = new MemberNicknameCheckAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberEmailCertificationAction.me")){
			action = new MemberEmailCertificationAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(command.equals("/MemberEmailCheckAction.me")){
			action = new MemberEmailCheckAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request,response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}