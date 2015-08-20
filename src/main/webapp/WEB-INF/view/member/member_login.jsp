<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="../url.jsp">홈으로</a><br><body>
<form action="loginAction" method="post">
<table>
	<tr>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td><input type="password" name="pw"></td>
		<td rowspan="2"><input type="submit" value="로그인"></td>
	</tr>
</table>
</form>
</body>
</html>