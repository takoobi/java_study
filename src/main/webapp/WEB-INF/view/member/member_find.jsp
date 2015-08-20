<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<a href="../url.jsp">홈으로</a><br><body><br>
<form action="findAction" enctype="application/x-www-form-urlencoded" method="post" submit="find();">
	가입하신 이메일 주소를 입력해주세요.<br><br>
	<input type="email" spaceholder="email" name="email"/></span><br><br>	
	<input type="submit" value="전송">(전송버튼 클릭 후 잠시만 기다려주세요.)
</form>
</body>
</html>