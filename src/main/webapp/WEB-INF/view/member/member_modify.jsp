<%@page import="com.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var check = [true];

//0-닉네임중복확인
$(document).ready(function(){
	if("${OneData.image}"!="original_image.jpg"){
		$('#img2').attr('src', "resources/image/profile/${OneData.image}");
	}
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) { 
                $('#img').attr('src', e.target.result);
            }                    
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#image').on('change', function() {
        readURL(this);
    });
    
    // 수정 취소 후 메인 화면
    $('#cancel').click(function(){
    	alert('취소하였습니다.');
    	return 	    	
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
    

 });
//유효성 검사
 function validity_check(){
	    //닉네임을 바꿨을 때 중복확인
	    if($("#nickname").val()!="${OneData.email}"){
	    	check[0]=false;
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
</head>
<body>
<a href="../url.jsp">홈으로</a><br><body>
<form action="modifyAction" enctype="multipart/form-data" method="post" onsubmit="return validity_check();">
<input type="hidden" id="email" name="email" value="${OneData.email}">
${pageContext.request.contextPath}
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
		<td>이미지-이미지가 없을 시에 기본이미지 지정</td>
		<td>
			<input type="file" name="image" id="image"><br>
			<img alt="" src="resources/image/profile/${OneData.image}" id="img" name="img">
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
		<td><textarea rows="10" cols="10" name="description"></textarea></td>	
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정하기"></td>
		<td colspan="2"><a href="urlviewAction"><input type="button" id="cancel" value="취소하기"></td>
	</tr>
</table>
<br><br><br>
내가 쓴 글<br>
내가 쓴 댓글<br>
</form>
</body>
</html>