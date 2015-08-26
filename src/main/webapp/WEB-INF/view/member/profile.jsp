<%@page import="com.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하는 공간, 힘이되는 공감!</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var check = [true];
//0-닉네임중복확인

$(document).ready(function(){
	//기본이미지 세팅
	if("${OneData.image}"!="original_image.jpg"){
		$('#img2').attr('src', "resources/image/profile/${OneData.image}");
	}
	
	//이미지 처리
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) { 
                $('#img').attr('src', e.target.result);
            }                    
            reader.readAsDataURL(input.files[0]);
        }
    }

    //바뀐 이미지 화면에 띄우기
    $('#image').on('change', function() {
        readURL(this);
    });
    
    //닉네임 중복확인
	$("#nickname_check").click(function(){
		if($("#nickname").val()==""){
			alert("닉네임을 입력하세요.");
			$("#nickname").val().focus;
			return false;
		}
		$.ajax({
			type:"post",
			url:"nicknameCheckAction",
			data : {
				'nickname' : $('#nickname').val()  
			},
			dataType : "json",
			success:function(data){
				if(data.result==true) 	{
					alert("사용이 불가능합니다.");
				} else {
					alert("사용이 가능합니다.");
					check[0]=true;
				}
			}
		});
	});
	
    //회원탈퇴 ajax 처리
    $("#buttonDelete2").click(function(){
    	//삭제할 지 한 번 더 확인하기
    	if (!confirm("정말 삭제하시겠습니까??")) return;
		//비밀번호 유효성 검사
	    if($("#inputPw").val()!="${OneData.pw}"){
	    	alert("비밀번호를 확인해주세요");
	    	return false;
	    }
		//ajax실행
    	$.ajax({
			type:"post",
			url:"deleteAction",
			data : {
				'email' : $('#email').val(),
				"inputPw":$("#inputPw").val()
			},
			dataType : "json",
			success:function(data){
				if(data.result=="ok") {
					alert("삭제되었습니다.");
					location.href="http://localhost:8088/LOVE/index.jsp";
				} else {
					alert("삭제할 수 없습니다. 비밀번호를 확인하세요.");
				}
			}
		});
    });
});
//유효성 검사
 function validity_check(){
	    //닉네임을 바꿨을 때 중복확인
	    if(!check[0]){
	    	alert("닉네임 중복확인을 클릭해주세요.");
	    	return false;
	    }	 
	    //비밀번호 확인
	    if($("#pw").val()!="${OneData.pw}"){
	    	alert("비밀번호를 확인해주세요");
	    	return false;
	    }
	    //성별 확인
	    if($("input:radio[name=gender]:checked").length==0){
	    	alert("성별을 선택해주세요.");
	    	return false;
	    }
 }

</script>
<style type="text/css">
table {
	margin: 0 auto;	
}
table tr{
	height: 50px;
}
body{
	background-image:url(${pageContext.request.contextPath}/resources/image/etc/etc0.jpg);
	background-size:cover;
	background-repeat:no-repeat;
	background-attachment: fixed;
	background-position: 0 0; 
	font-weight: bold;
	color: white;
}
.divDelete {
     border-radius : 5px;
     border : 5px solid gray;
     box-shadow : 0 0 5px silver;
     padding : 20px;
     color: black;
     display: none;
     font-size: 10pt;
     width: 230px;
     height: 26px;
     margin: 0 auto;
 }
 #divDelete2{
 	margin: 0 auto;
 	width: 70px;
 	height: 30px;
 }
 #divBack{
	position: absolute;
	left: 70px;
	top: 75px;
}
</style>
</head>
<body>
<!-- 뒤로가기 -->
<div id="divBack">
	<button onclick="javascript:history.back()">뒤로가기</button>
</div>
<form action="modifyAction" enctype="multipart/form-data" method="post" onsubmit="return validity_check();">
<input type="hidden" id="email" name="email" value="${OneData.email}">
<br>
<table>
	<tr>
		<td>아이디</td>
		<td>${OneData.email}</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>
			<input type="text" id="nickname" name="nickname" value="${OneData.nickname}">
			<input type="button" id="nickname_check" value="닉네임 중복확인">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" id="pw"></td>
	</tr>
	<tr>
		<td>이미지<br>(로딩이 느릴 수 있음)</td>
		<td>
			<input type="file" name="image" id="image"><br>
			<img alt="" src="${pageContext.request.contextPath}/resources/image/profile/${OneData.image}" id="img" name="img">
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<c:choose>
				<c:when test="${OneData.gender=='M'}">
					<input type="radio" value="M" name="gender" checked="checked">남
					<input type="radio" value="F" name="gender">여				
				</c:when>
				<c:when test="${OneData.gender=='F'}">
					<input type="radio" value="M" name="gender">남
					<input type="radio" value="F" name="gender" checked="checked">여				
				</c:when>
				<c:otherwise>
					<input type="radio" value="M" name="gender">남
					<input type="radio" value="F" name="gender">여				
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>상세소개</td> 
		<td><textarea rows="10" cols="40" name="description"></textarea></td>	
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정하기"></td>
	</tr>
</table>
</form>
<!-- 삭제 -->
<div id="divDelete2">
	<button id="buttonDelete" onclick="$('.divDelete').toggle()">탈퇴하기</button>
</div>
<div class="divDelete" align="center">
	<input type="password" placeholder="비밀번호" id="inputPw" name="inputPw">
	<button id="buttonDelete2">삭제</button>
</div>
</body>
</html>