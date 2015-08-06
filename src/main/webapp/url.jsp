<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 아이디 : ${sessionScope.email}<br>
닉네임 : ${sessionScope.nickname}<br>
<a href="MemberLogout.me">로그아웃하기</a>&ensp;1.클릭을 하면 세션이 지워진다.&ensp;2.db처리가 필요없다.&ensp;3.세션을 지워주고 다시 페이지로 돌아온다.<br><br>

관리자-회원가입<br>
&emsp;<a href="MemberList.me">회원목록보기</a><br>

<br>
사용자-회원가입<br>
&emsp;<a href="MemberAdd.me">회원가입하기</a><br>
&emsp;<a href="MemberModify.me">회원정보수정</a>&ensp;1.로그인 필수&ensp;2.db처리(id이용)&ensp;3.비밀번호가 맞을 시 수정이 가능하게끔 만들기&ensp;4.이미지 변경 시 원본이미지를 이미지폴더에서 삭제해줘야한다.<br> 
&emsp;<a href="MemberDelete.me">회원탈퇴하기</a>&ensp;1.로그인 필수&ensp;2.비밀번호<br>
&emsp;<a href="MemberLogin.me">로그인하기</a>&ensp;1.아이디&ensp;2.비밀번호<br>
&emsp;<a href="MemberFind.me">비밀번호 찾기</a><br>

<br>
사용자-게시판<br>
&emsp;<a href="BoardMystory.bo">내가 쓴 글</a>&ensp;1.로그인 필수<br>
&emsp;<a href="BoardWrite.bo?category=cafe">카페 글쓰기</a>&ensp;1.로그인 필수&ensp;1.이메일&ensp;2.닉네임&ensp;3.제목&ensp;4.내용&ensp;5.태그&ensp;6.이미지<br>
&emsp;<a href="BoardWrite.bo?category=bar">선술집 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=school">학교 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=penthouse">옥탑방 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=military">군대 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=exile">유배지 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=music">노래방 글쓰기</a><br>
&emsp;<a href="BoardWrite.bo?category=broadcast">방송국 글쓰기</a><br>
&emsp;<a href="BoardList.bo">글목록보기</a><br>
&emsp;<a href="BoardDelete.bo">글삭제</a>&ensp;1.로그인 필수<br>
&emsp;<a href="BoardView.bo">글상세보기</a><br>
</body>
</html>