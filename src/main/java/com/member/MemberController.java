package com.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model.MemberBean;

@Controller
@RequestMapping(value="member")
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	//회원가입화면
	@RequestMapping(value="/add")
	public String add(){
		return "member/member_add";
	}

	//이메일중복확인
	@RequestMapping(value="/emailCheckAction")
	public void emailCheckAction(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String email = request.getParameter("email");
		
		boolean result = memberDao.emailCheck(email);
		PrintWriter out=response.getWriter();
		
		JSONObject ob =new JSONObject();
	
		ob.put("result", result);

		out.print(ob);
	}
	
	//인증번호발송
	@RequestMapping(value="/emailCertificationAction")
	public void emailCertificationAction(HttpServletRequest request, HttpServletResponse response) throws MessagingException, IOException{
		
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
	}
	
	//닉네임중복확인
	@RequestMapping(value="/nicknameCheckAction")
	public void nicknameCheckAction(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String nickname = request.getParameter("nickname");
		
		boolean result = memberDao.nicknameCheck(nickname);
		PrintWriter out=response.getWriter();
		
		JSONObject ob =new JSONObject();

		ob.put("result", result);
		
		out.print(ob);
	}

	//회원추가하기
	@RequestMapping(value="/addAction")
	public String addAction(MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		
		MultipartFile multipartFile = request.getFile("image");
		if(!multipartFile.isEmpty()){
			File file = new File("C:\\Users\\kimkoonho\\Desktop\\uploadtest", multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
		}
		
		MemberBean bean = new MemberBean();
		bean.setEmail(request.getParameter("email"));
		bean.setPw(request.getParameter("pw"));
		bean.setNickname(request.getParameter("nickname"));
		bean.setImage(multipartFile.getOriginalFilename());
		bean.setDescription(request.getParameter("description"));
		bean.setGender(request.getParameter("gender"));
		
		memberDao.insert(bean);
		
		return "redirect:/url.jsp";
	}
	
	//회원정보수정화면
	@RequestMapping(value="/modify")
	public String modify(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		
		MemberBean one_data = new MemberBean();
		
		one_data=memberDao.getOneData((String)session.getAttribute("email"));
		
		if(one_data==null){
			return "redirect:/url.jsp";
		}
		
		request.setAttribute("OneData", one_data);
		
		return "member/member_modify";
	}
	
	//회원정보수정하기
	@RequestMapping(value="/modifyAction")
	public String modifyAction(MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		MultipartFile multipartFile = request.getFile("image");
		if(!multipartFile.isEmpty()){
			File file = new File("C:\\Users\\kimkoonho\\Desktop\\uploadtest", multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
		}
		
		MemberBean bean = new MemberBean();
		bean.setEmail(request.getParameter("email"));
		bean.setPw(request.getParameter("pw"));
		bean.setNickname(request.getParameter("nickname"));
		bean.setImage(multipartFile.getOriginalFilename());
		bean.setDescription(request.getParameter("description"));
		bean.setGender(request.getParameter("gender"));
		
		memberDao.update(bean);
		
		return "redirect:/url.jsp";		
	}
	//회원탈퇴화면
	@RequestMapping(value="/delete")
	public String delete(){
		return "member/member_delete";
	}
	//회원탈퇴하기
	@RequestMapping(value="/deleteAction")
	public String deleteAction(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		String email=(String)session.getAttribute("email");
		String pw=request.getParameter("pw");
		
		if(email==null){
			return "redirect:/url.jsp";
		}
		try{
			int check=memberDao.delete(email,pw);
			
			if(check==1){
				session.invalidate();
			}else{
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 맞지 않습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return "redirect:/url.jsp";
	}
	
	//로그인화면
	@RequestMapping(value="/login")
	public String login(){
		return "member/member_login";
	}
	//로그인하기
	@RequestMapping(value="/loginAction")
	public String loginAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");

		int check=memberDao.loginCheck(email,pw);
		if(check==1){
			String nickname = memberDao.getNickname(email);
			session.setAttribute("email", email);
			session.setAttribute("nickname", nickname);
			return "redirect:/url.jsp";
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
	
	//로그아웃하기
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/url.jsp";
	}
	
	//비밀번호찾기화면
	@RequestMapping(value="/find")
	public String find(){
		return "member/member_find";
	}
	//비밀번호찾기
	@RequestMapping(value="/findAction")
	public String findAction(HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException{
		String email=request.getParameter("email");

		String result=memberDao.find(email);
		
		if(!result.equals("무존재")){
			// 메일 관련 정보
	        String host = "smtp.naver.com";
	        final String username = "sbv200";       //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
	        final String password = "rlarnsgh91rlarns";   //네이버 이메일 비밀번호를 기재합니다.
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
			return "redirect:/url.jsp";
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
	}
}
