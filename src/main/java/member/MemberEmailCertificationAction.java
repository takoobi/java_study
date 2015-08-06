package member;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


public class MemberEmailCertificationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		
		return null;
	}

}
