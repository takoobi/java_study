package com.member;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.member.model.MemberBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.ActionForward;
import member.MemberDAO;


@Controller
public class MemberController {
	static SqlSession session = null;
	private String id;
	private MemberBean member;
	
	@RequestMapping(value="test")
	public ModelAndView test(){
		System.out.println("확인");
		return new ModelAndView("test");
	}
	
	@RequestMapping(value="MemberAdd")
	member/member_add
	@RequestMapping(value="MemberAddAction")
	
	String realFolder="";
	String saveFolder="/memberImage";
	int fileSize=5*1024*1024;
	
	realFolder=request.getSession().getServletContext().getRealPath(saveFolder);
	boolean result=false;
	
	MultipartRequest multi=null;
	multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
	
	memberbean.setEmail(multi.getParameter("email"));
	memberbean.setPw(multi.getParameter("pw"));
	memberbean.setNickname(multi.getParameter("nickname"));
	memberbean.setImage(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	memberbean.setDescription(multi.getParameter("description"));
	memberbean.setGender(multi.getParameter("gender"));
	
	result=memberdao.memberInsert(memberbean);
	if(result==false){
		return null;
	}
	member/MemberList
	@RequestMapping(value="MemberLogin")
	String email=request.getParameter("email");
	String pw=request.getParameter("pw");
	int check=memberdao.memberCheck(email,pw);
	if(check==1){
		String nickname = memberdao.getNickname(email);
		session.setAttribute("email", email);
		session.setAttribute("nickname", nickname);
		forward.setRedirect(true);
		forward.setPath("./.jsp");
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
	member/member_login
	@RequestMapping(value="MemberLoginAction")
	url
	@RequestMapping(value="MemberModify")
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
	
	@RequestMapping(value="MemberDeleteAction")
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
	@RequestMapping(value="MemberDelete")
	member/member_delete
	@RequestMapping(value="MemberLogout")
	HttpSession session = request.getSession();
	ActionForward forward = new ActionForward();
	
	session.invalidate();
	forward.setRedirect(true);
	forward.setPath("./url.jsp");
	return forward;
	
	@RequestMapping(value="MemberModifyAction")
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
	url
	@RequestMapping(value="MemberFind")
	member/member_find
	@RequestMapping(value="MemberFindAction")
	String email=request.getParameter("email");
	ActionForward forward=new ActionForward();
	MemberDAO memberdao=new MemberDAO();
	
	String result;
	result=memberdao.memberFind(email);
	
	if(!result.equals("무존재")){
		// 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = "sbv200";       //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
        final String password = "rlarnsgh91";   //네이버 이메일 비밀번호를 기재합니다.
        int port=465;
         
        // 메일 내용
        String recipient = "sbv200@daum.net";    //메일을 발송할 이메일 주소를 기재해 줍니다.
        String subject = "네이버를 사용한 발송 테스트입니다.";
        String body = "내용 무";
         
        Properties props = System.getProperties();
          
          
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
           
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
           
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("sbv200@naver.com"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
		forward.setRedirect(true);
		forward.setPath("./url.jsp");
		return forward;
	} else{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('등록된 이메일이 없습니다');");
		out.println("history.go(-1)");
		out.println("</script>");
		out.close();
	}
	return null;
	@RequestMapping(value="MemberNicknameCheckAction")
	MemberDAO memberdao=new MemberDAO();
	String nickname = request.getParameter("nickname");
	
	boolean result = memberdao.memberNicknameCheck(nickname);
	PrintWriter out=response.getWriter();
	
	JSONObject ob =new JSONObject();

	ob.put("result", result);
	
	out.print(ob);
	
	@RequestMapping(value="MemberEmailCertificationAction")
	
	String email=request.getParameter("email");
	
	//난수 발생
	int random_numbers=0;
	random_numbers=(int)(Math.random()*90000)+10000; // 10000~99999
			
	// 메일 관련 정보
    String host = "smtp.gmail.com";
    String username = "sbv20000@gmail.com";
    String password = "rlarnsgh91";
      
    // 메일 내용
    String recipient = email;
    String subject = "인증번호 입니다!";
    String body = String.valueOf(random_numbers);
      
    //properties 설정
    Properties props = new Properties();
    props.put("mail.smtps.auth", "true");
    
    // 메일 세션
    Session session = Session.getDefaultInstance(props);
    MimeMessage msg = new MimeMessage(session);
  
    // 메일 관련
    msg.setSubject(subject);
    msg.setText(body);
    msg.setFrom(new InternetAddress(username));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
  
    // 발송 처리
    Transport transport = session.getTransport("smtps");
    transport.connect(host, username, password);
    transport.sendMessage(msg, msg.getAllRecipients());
    transport.close();
    
    PrintWriter out=response.getWriter();
	
	JSONObject ob =new JSONObject();

	ob.put("random_numbers", random_numbers);

	out.print(ob);
	@RequestMapping(value="MemberEmailCheckAction")
	MemberDAO memberdao=new MemberDAO();
	String email = request.getParameter("email");
	
	boolean result = memberdao.memberEmailCheck(email);
	PrintWriter out=response.getWriter();
	
	JSONObject ob =new JSONObject();

	ob.put("result", result);

	out.print(ob);	
}
