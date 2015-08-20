<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션 관리<br>
&emsp;로그인 아이디 : ${sessionScope.email}<br>
<br>
관리자-회원<br>
<br>
사용자-회원<br>
&emsp;<a href="member/add">회원가입하기</a>O<br>
&emsp;<a href="member/modify">회원정보수정</a>O<br>
&emsp;<a href="member/delete">회원탈퇴하기</a>O<br>
&emsp;<a href="member/login">로그인하기</a>O<br>
&emsp;<a href="member/logout">로그아웃하기</a>O<br>
&emsp;<a href="member/find">비밀번호 찾기</a>O임시비밀번호를 만들어줘야 한다.<br>
<br>
사용자-게시판<br>
&emsp;<a href="board/write?category=cafe">카페 글쓰기</a>O<br>
&emsp;<a href="board/write?category=bar">선술집 글쓰기</a>O<br>
&emsp;<a href="board/write?category=school">학교 글쓰기</a>O<br>
&emsp;<a href="board/write?category=penthouse">옥탑방 글쓰기</a>O<br>
&emsp;<a href="board/write?category=military">군대 글쓰기</a>O<br>
&emsp;<a href="board/write?category=exile">유배지 글쓰기</a>O<br>
&emsp;<a href="board/write?category=music">노래방 글쓰기</a>O<br>
&emsp;<a href="board/write?category=broadcast">방송국 글쓰기</a>O<br>
&emsp;<a href="board/square">광장</a>O<br>
&emsp;<a href="board/cafe">카페</a>O<br>
&emsp;<a href="board/bar">선술집</a>O<br>
&emsp;<a href="board/school">학교</a>O<br>
&emsp;<a href="board/penthouse">옥탑방</a>O<br>
&emsp;<a href="board/military">군대</a>O<br>
&emsp;<a href="board/exile">유배지</a>O<br>
&emsp;<a href="board/music">노래방</a>O<br>
&emsp;<a href="board/broadcast">방송국</a>O<br>
</body>
</html>