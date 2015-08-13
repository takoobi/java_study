<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="deleteAction" method="post">
	<input type="hidden" name="email" value="${sessionScope.email}">
	사용자 아이디 : ${sessionScope.email}<br>
	비밀번호 : <input type="password" name="pw">
	<input type="submit" value="삭제하기">
</form>
</body>
</html>