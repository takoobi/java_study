<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하는 공간, 힘이되는 공감!</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var number=0;
$(function(){
	//댓글 ajax 처리
	$.ajax({
		type:"post",
		url:"reply",
		data:{
			"board_key":$("#pk").val()
		},
		dataType:"json",
		success:function(data){
			//console.log(JSON.stringify(data));
			
			var list="";
			
		    $.each(data, function(index, item){
		    	var date = new Date(item["create_date"]);
		    	var formatted = formatDate(date);
		    	list+="<div>";
		    	list+= item['email']+"&ensp;&ensp;&ensp;"+formatted+"<br>";
		    	list+=item['description'];
		    	list+="</div><br>";
		    });				
		    $("#reply").prepend(list);
		}
	});
	
	//공감, 비공감
	if("${good_id_check}"=="true") $("button[name='good']").attr("id", "good_cancle");
	if("${good_id_check}"=="false") $("button[name='good']").attr("id", "good");
	if("${bad_id_check}"=="true") $("button[name='bad']").attr("id", "bad_cancle");
	if("${bad_id_check}"=="false") $("button[name='bad']").attr("id", "bad");
	
	var num=0;
	var backgroundNum=backgroundRandom();
	switch ("${param.category}"){
		case "cafe":
			if(backgroundNum==1){
				num=imageRandom(12);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/cafe/white/cafe"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(5);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/cafe/black/cafe"+num+".jpg')");
				$("body").css("color","white");
			}		
			break;
		case "bar":
			if(backgroundNum==1){
				num=imageRandom(5);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/bar/white/bar"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(8);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/bar/black/bar"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "school":
			if(backgroundNum==1){
				num=imageRandom(9);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/school/white/school"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(10);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/school/black/school"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "penthouse":
			if(backgroundNum==1){
				num=imageRandom(8);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/penthouse/white/penthouse"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(2);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/penthouse/black/penthouse"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "military":
			if(backgroundNum==1){
				num=imageRandom(11);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/military/white/military"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(6);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/military/black/military"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "exile":
			if(backgroundNum==1){
				num=imageRandom(8);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/exile/white/exile"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(2);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/exile/black/exile"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "music":
			if(backgroundNum==1){
				num=imageRandom(8);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/music/white/music"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(10);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/music/black/music"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
		case "broadcast":
			if(backgroundNum==1){
				num=imageRandom(7);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/broadcast/white/broadcast"+num+".jpg')");
				$("body").css("color","black");
			} else{
				num=imageRandom(5);
				$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/broadcast/black/broadcast"+num+".jpg')");
				$("body").css("color","white");
			}	
			break;
	}
	
});
//이미지 랜덤으로 뽑아주기
function imageRandom(number){
	//랜덤함수, 1~number까지, 소수점 잘랐음.
	return Math.floor(Math.random()*number+1); 
}
//이미지 랜덤으로 뽑아주는데 어두운 배경이면 폰트 색깔 흰색, 밝은 배경이면 폰트 색깔 검정색으로 하기 위한 함수
function backgroundRandom(){
	//랜덤함수, 1~number까지, 소수점 잘랐음.
	return Math.floor(Math.random()*2+1); 
}
//Formats d to MM/dd/yyyy HH:mm:ss format
function formatDate(d){
	function addZero(n){
		return n < 10 ? '0' + n : '' + n;
	}

    return d.getFullYear() +"/"+ addZero(d.getMonth()+1) + "/" + addZero(d.getDate()) + " " + 
           addZero(d.getHours()) + ":" + addZero(d.getMinutes()) + ":" + addZero(d.getMinutes());
}
//공감, 비공감 click 시
$(document).on( 'click', "button[class='today']", function(){
	switch($(this).attr("id")){
		case "good" :
			number=1;
			break;
		case "good_cancle":
			number=2;
			break;
		case "bad":
			number=3;
			break;
		case "bad_cancle":
			number=4;
			break;
	}

	$.ajax({
		type:"post",
		url:"emotion",
		data:{
			"number" : number,
			"category" : $('#category').val(),
			"pk":$("#pk").val()
		},
		dataType:"json",
		success:function(data){
			//alert(JSON.stringify(data));
			//공감, 비공감
			if(data.good_id_check==true) $("button[name='good']").attr("id", "good_cancle");
			if(data.good_id_check==false) $("button[name='good']").attr("id", "good");
			if(data.bad_id_check==true) $("button[name='bad']").attr("id", "bad_cancle");
			if(data.bad_id_check==false) $("button[name='bad']").attr("id", "bad");
			//공감, 비공감 개수 보여주기
			$("#goodCount").empty();
			$("#badCount").empty();
			$("#goodCount").append(data.good);
			$("#badCount").append(data.bad);
		}
	});
});

//댓글 comment 클릭 시
$(document).on( 'click', "button[id='comment']", function(){
	//댓글 유효성 검사
	if($("#description").val()==""){
		alert("내용을 입력해주세요.");
		return false;
	}
	//댓글 입력창 비워주기
	$("#reply").empty();
	//ajax 처리
	$.ajax({
		type:"post",
		url:"reply",
		data:{
			"description" : $("#description").val(),
			"board_key":$("#pk").val()
		},
		dataType:"json",
		success:function(data){
			//console.log(JSON.stringify(data));
			
			var list="";
			
		    $.each(data, function(index, item){
		    	var date = new Date(item["create_date"]);
		    	var formatted = formatDate(date);
		    	list+="<div>";
		    	list+= item['email']+"&ensp;&ensp;&ensp;"+formatted+"<br>";
		    	list+=item['description'];
		    	list+="</div><br>";
		    });				
		    $("#reply").prepend(list);
		}
	});
	
	$("#description").val("");
});
</script>
<style type="text/css">

body{
	background-size:cover;
	background-repeat:no-repeat;
	background-attachment: scroll;
	background-position: 0 0; 
	font-weight: bold;
}
#divBack{
	position: absolute;
	left: 70px;
	top: 75px;
}
#comment{
	position: absolute;
	height: 80px;
	margin-left: 10px;
}
</style>
</head>
<body>
<input type="hidden" id="category" name="category" value="${param.category}">
<input type="hidden" id="pk" name="pk" value="${boardBean.pk}">
<br><br>
<!-- 뒤로가기 -->
<div id="divBack">
	<button onclick="javascript:history.back()">뒤로가기</button>
</div>
<!-- 게시글 화면 -->
<div id="divSubject" align="center">
	<table>
		<tr height="40px">
			<td width="200px">글쓴이 : ${nickname}</td>
			<td width="200px">글쓴날 : ${boardBean.create_date}</td>
			<td width="200px">조회수 : ${boardBean.hit}</td>
		</tr>
		<tr height="40px">
			<td colspan="3">제목 : ${boardBean.title}</td>
		</tr>
		<tr>
			<td colspan="3"><p>${boardBean.description}</p></td>
		</tr>
	</table>
</div>
<!-- 로그인 했을 때 공감, 비공감 화면 -->
<c:if test="${!empty sessionScope.email}">
<br><br><br><br><br>
<div align="center">
	<table>
		<tr>	
			<td width="150px">
				<button id="" class="today" name="good">공감</button>&emsp;
				<span id="goodCount">${boardBean.good}</span>
			</td>
			<td>
				<button id="" class="today" name="bad">비공감</button>&emsp;
				<span id="badCount">${boardBean.bad}</span>	
			</td>
		</tr>
	</table>
</div>
</c:if>
<!-- 로그인 안했을 시 공감, 비공감 화면 -->
<c:if test="${empty sessionScope.email}">
<br><br><br><br><br>
<div align="center">
	공감, 비공감은 로그인을 하셔야 이용하실 수 있습니다.<br>
		공감 : <span id="goodCount">${boardBean.good}</span>
	비공감 : <span id="badCount">${boardBean.bad}</span>
</div>
</c:if>
<!-- 로그인 했을 때 댓글 화면 -->
<c:if test="${!empty sessionScope.email}">
<div align="center">
<br><br><br><br><br><br>
	댓글<br><br>
	<div id="reply"></div><br>
	<textarea rows="5" cols="50" id="description" name="description"></textarea><button id="comment">comment</button>
</div>
</c:if>
<!-- 로그인 안했을 시 댓글 화면 -->
<c:if test="${empty sessionScope}">
<div align="center">
<br><br><br><br><br><br>
	댓글<br><br>
	<div id="reply"></div><br>
	댓글은 로그인을 하셔야 이용하실 수 있습니다.
</div>
</c:if>

</body>
</html>