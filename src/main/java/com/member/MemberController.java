package com.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model.MemberBean;

@Controller
@RequestMapping(value="member")
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	//회원가입화면
	@RequestMapping(value="/signupPage")
	public String signupPage(){
		return "member/register";
	}
	//회원가입화면
	@RequestMapping(value="/add")
	public String add(){
		return "member/member_add";
	}

	//이메일중복확인
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/emailCheckAction")
	public void emailCheckAction(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String email = request.getParameter("email");
		
		boolean result = memberDao.emailCheck(email);
		PrintWriter out=response.getWriter();
		
		JSONObject ob =new JSONObject();
	
		ob.put("result", result);

		out.print(ob);
	}
	

	
	//닉네임중복확인
	@SuppressWarnings("unchecked")
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
	public String addAction(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException{
		
		MemberBean bean = new MemberBean();
		bean.setEmail(request.getParameter("email"));
		bean.setPw(request.getParameter("pw"));
		bean.setNickname(request.getParameter("nickname"));
		bean.setTitle(request.getParameter("title"));
		
		memberDao.insert(bean);
		
		PrintWriter out=response.getWriter();  
		
		response.setContentType("text/html; charset=utf-8");
        out.println("<script>");
        out.println("alert('회원가입이 완료되었습니다.');");
        out.println("location.href='http://localhost:8088/LOVE/index.jsp'");
        out.println("</script>");
        out.close();   
        
        return null;
		//return "redirect:/index.jsp";
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
	public String modifyAction(MultipartHttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
		//선언 및 생성
		MultipartFile multipartFile = request.getFile("image");
		MemberBean bean = new MemberBean();
		String savePath = request.getSession().getServletContext().getRealPath("/")+"resources/image/profile";
		
		//조건 처리
		if(!multipartFile.isEmpty()){
			File file = new File(savePath, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			bean.setImage(multipartFile.getOriginalFilename());
		} else{
			bean.setImage("original_image.jpg");
		}
		
		//값 넣기
		bean.setEmail(request.getParameter("email"));
		bean.setPw(request.getParameter("pw"));
		bean.setNickname(request.getParameter("nickname"));
		bean.setDescription(request.getParameter("description"));
		bean.setGender(request.getParameter("gender"));
		
		//db처리
		memberDao.update(bean);
		
		//java파일에서 자바스크립트 사용하기
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out=response.getWriter();	  
        out.println("<script>");
        out.println("alert('수정했습니다.');");
        out.println("location.href='http://localhost:8088/LOVE/index.jsp'");
        out.println("</script>");
		return null;		
	}
	//회원탈퇴화면
	@RequestMapping(value="/delete")
	public String delete(){
		return "member/member_delete";
	}
	//회원탈퇴하기
	@RequestMapping(value="/deleteAction")
	public @ResponseBody Map<String, String> deleteAction(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		//선언 및 생성
		Map<String, String> map = new HashMap<String,String>();
		String email=(String)session.getAttribute("email");
		String pw=request.getParameter("inputPw");
		
		//db처리
		int check=memberDao.delete(email,pw);
		
		//조건 처리
		if(check==1){
			session.invalidate();
			map.put("result", "ok");
		}else{
			map.put("result", "no");
		}
				
		return map;
	}
	
	//로그인화면
	@RequestMapping(value="/login")
	public String login(){
		return "member/member_login";
	}
	//로그인하기
	@RequestMapping(value="/loginAction")
	public @ResponseBody Map<String, String> loginAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		//선언 및 생성
		Map<String, String> map = new HashMap<String, String>();
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");

		//db처리
		int check=memberDao.loginCheck(email,pw);
		
		//조건 생성
		if(check==1){
			String nickname = memberDao.getNickname(email);
			session.setAttribute("email", email);
			session.setAttribute("nickname", nickname);
<<<<<<< HEAD
			return "redirect:/index.jsp";
=======
			map.put("result", "ok");
>>>>>>> e7ef97728d55cdadaf0dd080c2b18965cde291c1
		}else if(check==0){
			map.put("result", "noPw");
		}else{
			map.put("result", "noId");
		}
		return map;
	}
	
	//로그아웃하기
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	//비밀번호찾기화면
	@RequestMapping(value="/find")
	public String find(){
		return "member/member_find";
	}
	//비밀번호찾기
	@RequestMapping(value="/findAction")
	public @ResponseBody Map<String, String> findAction(HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException{
		//선언 및 생성
		Map<String, String> map = new HashMap<String, String>();
		
		//받을 값
		String email=request.getParameter("email");
		
		//db처리
		String result=memberDao.find(email);
		
		//조건 생성
		if(!result.equals("무존재")){
	        //난수 발생
	        int temporaryPassword=0;
	        temporaryPassword=(int)(Math.random()*90000)+10000; // 10000~99999
	                
	        // 메일 관련 정보
	        String host = "smtp.gmail.com";
	        String username = "sbv20000@gmail.com";
	        String password = "rlarnsgh91";
	          
	        // 메일 내용
	        String recipient = email;
	        String subject = "임시비밀번호 입니다!";
	        String body = String.valueOf(temporaryPassword);
	          
	        //properties 설정
	        Properties props = new Properties();
	        props.put("mail.smtps.auth", "true");
	        
	        //임시비밀번호 db처리
	        memberDao.temporaryPassword(email, temporaryPassword);
	        
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
	        
	        // 임시 비밀번호 발송 팝업
<<<<<<< HEAD
	     // 발송 확인 팝업창
	        response.setContentType("text/html; charset=utf-8");
	        String[] str = email.split("@");			
			String emailResult = str[1];
	        PrintWriter out=response.getWriter();	        
	        	        
			out.println("<script>");
			out.println("alert('입력하신 이메일 주소로 임시비밀 번호가 발송되었습니다.');");
			out.println("history.go(-2)");
			out.println("window.open('http://www."+ emailResult +"', 'child', 'width=1000, height=500', true);");
			out.println("</script>");
			out.close();			
	        
			//return "redirect:/index.jsp";
=======
	        String[] str = email.split("@");            
            String emailResult = str[1];     

	        //보낼 데이터 담기
	        map.put("result", "ok");
	        map.put("emailResult", emailResult);
	        return map;
>>>>>>> e7ef97728d55cdadaf0dd080c2b18965cde291c1
		} else{
			map.put("result", "no");
			return map;
		}
	}
}
