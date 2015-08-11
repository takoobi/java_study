<%@page import="com.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("member", request.getAttribute("OneData"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modifyAction" enctype="multipart/form-data" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="email" value="${member.email}"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw"></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td><input type="file" name="image"></td>
	</tr>
	<tr>
		<td>프로필 상세 소개</td>
		<td><textarea rows="10" cols="10" name="description">${member.description}</textarea></td>	
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<c:if test="${member.gender=='M'}">
				<input type="radio" value="M" name="gender" checked="checked">남
				<input type="radio" value="F" name="gender">여
			</c:if>
			<c:if test="${member.gender=='F'}">
				<input type="radio" value="M" name="gender">남
				<input type="radio" value="F" name="gender" checked="checked">여
			</c:if>
		</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>
			<input type="text" name="nickname" value="${member.nickname}">
			<input type="button" id="nickname_check" value="닉네임 중복확인">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정하기"></td>
	</tr>
</table>
</form>
</body>
</html>