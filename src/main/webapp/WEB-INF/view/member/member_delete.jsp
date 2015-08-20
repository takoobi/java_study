<%@page import="com.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 화면</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
//수정 취소 후 메인 화면
$(document).ready(function(){	
	$('#cancel').click(function(){
		alert('취소하였습니다.');
		return 		
	});
});
</script>
</head>
<body>
<a href="../url.jsp">홈으로</a><br><body>
<form action="deleteAction" method="post">
	<input type="hidden" name="email" value="${sessionScope.email}">
	사용자 아이디 : ${sessionScope.email}<br>
	비밀번호 : <input type="password" name="pw">
	<input type="submit" id="delete" value="삭제하기">
</form>
<table>
	<tr>
		<td>잠깐!! 생각이 바뀌었어요!!&emsp;&emsp;&emsp;&emsp;<a href="urlviewAction"><input type="button" id="cancel" value="급 취소!!"></td>
	</tr>
</table>
</body>
</html>