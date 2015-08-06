package member;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email=request.getParameter("email");
		ActionForward forward=new ActionForward();
		MemberDAO memberdao=new MemberDAO();
		
		String result;
		result=memberdao.memberFind(email);
		
		if(!result.equals("������")){
			// ���� ���� ����
	        String host = "smtp.naver.com";
	        final String username = "sbv200";       //���̹� �̸��� �ּ��� @ naver.com���ּҸ� �����մϴ�.
	        final String password = "rlarnsgh91";   //���̹� �̸��� ��й�ȣ�� �����մϴ�.
	        int port=465;
	         
	        // ���� ����
	        String recipient = "sbv200@daum.net";    //������ �߼��� �̸��� �ּҸ� ������ �ݴϴ�.
	        String subject = "���̹��� ����� �߼� �׽�Ʈ�Դϴ�.";
	        String body = "���� ��";
	         
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
			out.println("alert('��ϵ� �̸����� �����ϴ�');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		return null;
	}
}