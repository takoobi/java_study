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
&emsp;닉네임 : ${sessionScope.nickname}<br>
<br>
관리자-회원<br>
&emsp;<a href="member/list">회원목록보기</a>&emsp;member/list&emsp;X<br>
<br>
사용자-회원<br>
&emsp;<a href="member/add">회원가입하기</a>&emsp;member/add&emsp;O<br>
&emsp;<a href="member/modify">회원정보수정</a>&emsp;member/modify&emsp;O<br>
&emsp;<a href="member/delete">회원탈퇴하기</a>&emsp;member/delete&emsp;O<br>
&emsp;<a href="member/login">로그인하기</a>&emsp;member/login&emsp;O<br>
&emsp;<a href="member/logout">로그아웃하기</a>&emsp;member/logout&emsp;O<br>
&emsp;<a href="member/find">비밀번호 찾기</a>&emsp;member/find&emsp;O&emsp;임시비밀번호를 만들어줘야 한다.<br>
<br>
사용자-게시판<br>
&emsp;<a href="board/mystory">내가 쓴 글</a>&emsp;board/mystory&emsp;X<br>
&emsp;<a href="board/write?category=cafe">카페 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=bar">선술집 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=school">학교 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=penthouse">옥탑방 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=military">군대 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=exile">유배지 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=music">노래방 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/write?category=broadcast">방송국 글쓰기</a>&emsp;board/write&emsp;O<br>
&emsp;<a href="board/list?category=square">광장</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=cafe">카페</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=bar">선술집</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=school">학교</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=penthouse">옥탑방</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=military">군대</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=exile">유배지</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=music">노래방</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/list?category=broadcast">방송국</a>&emsp;board/list&emsp;X<br>
&emsp;<a href="board/delete">글삭제</a>&emsp;board/delete&emsp;X<br>
&emsp;<a href="board/view">글상세보기</a>&emsp;board/view&emsp;X<br>
</body>
</html>