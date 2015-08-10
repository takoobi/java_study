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
&emsp;<a href="MemberList">회원목록보기</a>&emsp;MemberList<br>
<br>
사용자-회원<br>
&emsp;<a href="MemberAdd">회원가입하기</a>&emsp;MemberAdd<br>
&emsp;<a href="MemberModify">회원정보수정</a>&emsp;MemberModify<br>
&emsp;<a href="MemberDelete">회원탈퇴하기</a>&emsp;MemberDelete<br>
&emsp;<a href="MemberLogin">로그인하기</a>&emsp;MemberLogin<br>
&emsp;<a href="MemberLogout">로그아웃하기</a>&emsp;MemberLogout<br>
&emsp;<a href="MemberFind">비밀번호 찾기</a>&emsp;MemberFind<br>
<br>
사용자-게시판<br>
&emsp;<a href="BoardMystory">내가 쓴 글</a>&emsp;BoardMystory<br>
&emsp;<a href="BoardWrite?category=cafe">카페 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=bar">선술집 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=school">학교 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=penthouse">옥탑방 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=military">군대 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=exile">유배지 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=music">노래방 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardWrite?category=broadcast">방송국 글쓰기</a>&emsp;BoardWrite<br>
&emsp;<a href="BoardList">글목록보기</a>&emsp;BoardList<br>
&emsp;<a href="BoardDelete">글삭제</a>&emsp;BoardDelete<br>
&emsp;<a href="BoardView">글상세보기</a>&emsp;BoardView<br>
</body>
</html>