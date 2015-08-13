<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var check = [false, false,false,false];
// 0-아이디중복확인, 1-닉네임중복확인, 2-아이디사용불가능, 3-비밀번호체크

$(function(){
	//이메일 중복확인
	$("#email_check").click(function(){
		if($("#email").val()==""){
			alert("아이디를 입력하세요.");
			return false;
		}
		$.ajax({
			type:"post",
			url:"emailCheckAction",
			data : {
				'email' : $('#email').val()  
			},
			dataType : "json",
			success:function(data){
				if(data.result==true){
					alert("사용이 불가능합니다.");
				}else{
					check[2]=true;
					alert("사용이 가능합니다");
					check[0]=true;
				}
			}
		});
	});
	
	//비밀번호확인
	$("#pw2").keyup(function(){
       if($("#pw").val()==$("#pw2").val()){
    	  $("#pw_check").html("비밀번호가 일치합니다.");
    	  check[3]=true;
       } else {
    	   $("#pw_check").html("비밀번호가 일치하지 않습니다.");
    	   check[3]=false;
       }
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
					check[1]=true;
				}
			}
		});
	});
});

function validity_check(){
	if($("#email").val()==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(check[0]==false){
		alert("아이디 중복확인을 해주세요.");
		return false;
	}
	if($("#pw").val()=="" || $("#pw").val().length<5){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if($("#pw2").val()=="" || $("#pw").val().length<5){
		alert("비밀번호확인을 입력하세요.");
		return false;
	}
	if($("#nickname").val()==""){
		alert("닉네임을 입력하세요.");
		return false;
	}
	if(check[1]==false){
		alert("닉네임 중복확인을 누르세요.");
		return false;
	}
	if(check[2]==false){
		alert("사용이 불가능한 아이디입니다.");
		return false;
	}
	if(check[3]==false){
		alert("비밀번호를 확인하세요.");
		return false;
	}
}

</script>
</head>
<body>
<form action="addAction" enctype="application/x-www-form-urlencoded" method="post" onsubmit="return validity_check();">
<table>
	<tr>
		<td>아이디(이메일)*</td>
		<td>
			<input type="text" name="email" id="email" placeholder="email">
			<input type="button" id="email_check" value="아이디 중복확인">
		</td>
	</tr>
	<tr>
		<td>비밀번호*</td>
		<td><input type="password" name="pw" id="pw">&emsp;최소 5자리 이상입니다.</td>
	</tr>
	<tr>
		<td>비밀번호확인*<br><br></td>
		<td><input type="password" name="pw2" id="pw2">&emsp;<span id="pw_check"></span><br><br></td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td><textarea rows="10" cols="10" name="description"></textarea></td>	
	</tr>
	<tr>
		<td>닉네임*</td>
		<td>
			<input type="text" name="nickname" id="nickname">
			<input type="button" id="nickname_check" value="닉네임 중복확인">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="가입하기"></td>
	</tr>
</table>
</form>
</body>
</html>