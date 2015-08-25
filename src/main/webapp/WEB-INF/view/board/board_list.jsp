<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께하는 공간, 힘이되는 공감!</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var tag =[];
var num=2;
var end;
$(function(){
	if("${category}"=="square"){
	    $.ajax({
			type:"post",
			url:"allList",
			dataType:"json",
			success:function(data){
				//console.log(JSON.stringify(data.cafe));
				
				var cafe="";
			    $.each(data.cafe, function(index, item){
			    	cafe+="<div class='divSquareList'>";
			    	cafe+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	cafe+="</div>";
			    });	
			    $("#divCafe").append(cafe);
			    
				var bar="";
			    $.each(data.bar, function(index, item){
			    	bar+="<div class='divSquareList'>";
			    	bar+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	bar+="</div>";
			    });	
			    $("#divBar").append(bar);
			    
				var school="";
			    $.each(data.school, function(index, item){
			    	school+="<div class='divSquareList'>";
			    	school+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	school+="</div>";
			    });	
			    $("#divSchool").append(school);
			    
				var penthouse="";
			    $.each(data.penthouse, function(index, item){
			    	penthouse+="<div class='divSquareList'>";
			    	penthouse+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	penthouse+="</div>";
			    });	
			    $("#divPenthouse").append(penthouse);
			    
				var military="";
			    $.each(data.military, function(index, item){
			    	military+="<div class='divSquareList'>";
			    	military+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	military+="</div>";
			    });	
			    $("#divMilitary").append(military);
			    
				var exile="";
			    $.each(data.exile, function(index, item){
			    	exile+="<div class='divSquareList'>";
			    	exile+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	exile+="</div>";
			    });	
			    $("#divExile").append(exile);
			    
				var music="";
			    $.each(data.music, function(index, item){
			    	music+="<div class='divSquareList'>";
			    	music+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	music+="</div>";
			    });	
			    $("#divMusic").append(music);
			    
				var broadcast="";
			    $.each(data.broadcast, function(index, item){
			    	broadcast+="<div class='divSquareList'>";
			    	broadcast+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+'&emsp;&emsp;'+item['create_date']+'  '+"</a>";
			    	broadcast+="</div>";
			    });	
			    $("#divBroadcast").append(broadcast);
			}
		});		
	    var backgroundNum=backgroundRandom();
		if(backgroundNum==1){
			num=imageRandom(9);
			$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/square/white/square"+num+".jpg')");
			$("body").css("color","black");
		} else{
			num=imageRandom(5);
			$("body").css("background-image", "url('${pageContext.request.contextPath}/resources/image/square/black/square"+num+".jpg')");
			$("body").css("color","white");
		}		
	}
	if("${category}"!="square"){
		ajax();
		
	    $(".box").click(function(){
	        tag=[];	
	        
	        if($(this).hasClass("select")){
	            $(this).removeClass("select");
	        } else{
	            $(this).addClass("select");
	        }
	        
	        start();
	    });  		
	}
	
	$("#buttonhome").click(function(){
		location.href="http://localhost:8088/LOVE/index.jsp";
	});
});
function start(){
    $(".box").each(function(){
        if($(this).is(".select")){
        	tag.push($(this).attr("id"));
        }
    });
    
    ajax();
}
function ajax(){
	end=5;
	num=2;
    $.ajax({
		type:"post",
		url:"doList",
		data:{
			"result" : tag.toString(),
			"category" : $('#category').val(),
			"num":1
		},
		dataType:"json",
		success:function(data){
			 $("#list").empty();
			var result = JSON.parse(data.list);
			var list="";
			//console.log(data.list);
		    $.each(result, function(index, item){
		    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>";
		    	list+="<div class='container'>";
		    	list+="<div class='content'>";
		    	list+="작성자  "+item["nickname"]+"<br><br>";
		    	list+="제목  " +item["title"]+"<br><br>";
		    	list+="올라온 날  "+item["create_date"]+"<br><br>";
		    	list+="조회수  "+item["hit"]+"<br><br>";
		    	list+="공감  "+item["good"]+"  비공감  "+item["bad"];
		    	list+="</div>";
		    	list+="<div class='background'>";
		    	list+="</div>";
		    	list+="</div>";
		    	list+="</a>";
		    });	
		    $("#list").append(list);
		}
	});	
}
function infinite_ajax_scroll(){
	if(end==0) return;
    $.ajax({
		type:"post",
		url:"doList",
		data:{
			"result" : tag.toString(),
			"category" : $('#category').val(),
			"num":num
		},
		dataType:"json",
		success:function(data){
			num+=1;
			
			var result= JSON.parse(data.list);

			var list="";

			if(result!=""){
			    $.each(result, function(index, item){
			    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>";
			    	list+="<div class='container'>";
			    	list+="<div class='content'>";
			    	list+="작성자  "+item["nickname"]+"<br><br>";
			    	list+="제목  " +item["title"]+"<br><br>";
			    	list+="올라온 날  "+item["create_date"]+"<br><br>";
			    	list+="조회수  "+item["hit"]+"<br><br>";
			    	list+="공감  "+item["good"]+"  비공감  "+item["bad"];
			    	list+="</div>";
			    	list+="<div class='background'>";
			    	list+="</div>";
			    	list+="</div>";
			    	list+="</a>";
			    });			    
			}else{
				list="<div class='container'>";
				list+="<div class='content'>더 이상 볼게 없네요~ㅠㅠ</div>";
				list+="<div class='background'>";
				list+="</div>";
				end=0;
			}
			$("#list").append(list);
		}
	});	
}
$(window).scroll(function(){
	if("${category}"!="square"){
	    if($(window).scrollTop() == $(document).height() - $(window).height()){
	    	infinite_ajax_scroll();
	    }	
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
</script>
<c:choose>
	<c:when test="${category=='cafe'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/cafe/cafe00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/cafe/cafe000.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='bar'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/bar/bar00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/bar/bar000.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='school'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/school/school00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/school/school000.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='penthouse'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/penthouse/penthouse00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/penthouse/penthouse000.jpg);
			}
		</style>	
	</c:when>
	<c:when test="${category=='military'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/military/military00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/military/military000.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='exile'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/exile/exile000.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/exile/exile00.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='music'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/music/music00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/music/music000.jpg);
			}
			.content{
				color:white;
			}
		</style>	
	</c:when>
	<c:when test="${category=='broadcast'}">
		<style type="text/css">
			body{
				background-image:url(${pageContext.request.contextPath}/resources/image/broadcast/broadcast00.jpg);
			}
			.container{		
       			background-image:url(${pageContext.request.contextPath}/resources/image/broadcast/broadcast000.jpg);
			}
			.content{
				color:black;
			}
		</style>	
	</c:when>
</c:choose>
<style type="text/css">
body{
	background-size:cover;
	background-repeat:no-repeat;
	background-attachment: fixed;
	background-position: 0 0;
	overflow-y:scroll;
	font-weight: bold;
}
#tags{
	height: 100px;
	width: 900px;
	margin: 0 auto;
}
#list{
	width: 1090px; 
	margin:0 auto;
}
.box{
    height: 70px;
    width: 70px;
    border-radius: 100%;
    margin: 20px auto;
    margin-right:6px;
    background: #fff;
    text-align: center;
    box-shadow: inset 0px 0px 15px rgba(0,0,0,0.3);
    border: 2px solid #fff;
    float: left;
    line-height: 65px;
}
.select{
	background-color: #fff616;
}
.write {
  	height: 70px;
    width: 70px;
    border-radius: 100%;
    margin: 20px auto;
    margin-right:30px;
    background: #fff;
    text-align: center;
    box-shadow: inset 0px 0px 15px rgba(0,0,0,0.3);
    border: 2px solid #fff;
    float: left;
    line-height: 65px;
}
.write a{
	color: #a52a2a !important;
  	 	font-weight: bold;
  	 	text-decoration: none;
}
.container{
	width: 250px;
	height: 300px;
	border: 1px solid black;
	float: left;
	margin:10px;
	border-radius: 20px;
	position: relative;
    background-size:250px 300px;
    margin-top: 40px;
}
.content{
	position: absolute;
	left: 40px;
	top: 50px;
	font-weight: bold;
}
a:link,a:visited,a:hover{
	text-decoration: none;
	color: black;
}
.center{
	position: absolute;
	left: 50px;
}
#divhome{
	position: absolute;
	left: 70px;
	top: 75px;
}
#divhome > #buttonhome{
	width: 30px;
	height: 30px;
}
.container{
	position: relative;
}
#divCafe{

	width: 300px;
	height:170px;
	position: absolute;
	left: 200px;
	top: 70px;
	background-image:url(${pageContext.request.contextPath}/resources/image/cafe/cafe00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divCafe a{
	color: white;
}
#divBar{

	width: 300px;
	height:170px;
	position: absolute;
	left: 550px;
	top: 70px;
	background-image:url(${pageContext.request.contextPath}/resources/image/bar/bar00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divBar a{
	color: white;
}
#divSchool{

	width: 300px;
	height:170px;
	position: absolute;
	left: 900px;
	top: 70px;
	background-image:url(${pageContext.request.contextPath}/resources/image/school/school00.jpg);
	background-size:300px 170px;
	color:green;
	border-radius:20px;
}
#divSchool a{
	color: green;
}
#divPenthouse{

	width: 300px;
	height:170px;
	position: absolute;
	left: 200px;
	top: 270px;
	background-image:url(${pageContext.request.contextPath}/resources/image/penthouse/penthouse00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divMilitary{

	width: 300px;
	height:170px;
	position: absolute;
	left: 550px;
	top: 270px;
	background-image:url(${pageContext.request.contextPath}/resources/image/military/military00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divExile{

	width: 300px;
	height:170px;
	position: absolute;
	left: 900px;
	top: 270px;
	background-image:url(${pageContext.request.contextPath}/resources/image/exile/exile00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divExile a{
	color: white;
}
#divMusic{

	width: 300px;
	height:170px;
	position: absolute;
	left: 200px;
	top: 470px;
	background-image:url(${pageContext.request.contextPath}/resources/image/music/music00.jpg);
	background-size:300px 170px;
	color:black;
	border-radius:20px;
}
#divBroadcast{

	width: 300px;
	height:170px;
	position: absolute;
	left: 550px;
	top: 470px;
	background-image:url(${pageContext.request.contextPath}/resources/image/broadcast/broadcast00.jpg);
	background-size:300px 170px;
	color:white;
	border-radius:20px;
}
#divBroadcast a{
	color: white;
}
.divSquareList{
	margin-left: 43px;
	margin-top: 3px;
}
.spanSquare{
	margin-left: 10px;
}
a{
	font-weight: bold;
}
</style>
</head>
<body>
<input type="hidden" id="category" name="category" value="${category}">
<!-- 홈버튼 -->
<div id="divhome">
	<button id="buttonhome">홈</button>
</div>
<c:if test="${category!='square'}">
	<c:choose>
		<c:when test="${category=='cafe'}">
			<h1 class="center" style="color: white;">카페</h1>
		</c:when>
		<c:when test="${category=='bar'}">
			<h1 class="center" style="color: white;">선술집</h1>
		</c:when>
		<c:when test="${category=='school'}">
			<h1 class="center">학교</h1>
		</c:when>
		<c:when test="${category=='penthouse'}">
			<h1 class="center">옥탑방</h1>
		</c:when>
		<c:when test="${category=='military'}">
			<h1 class="center">군대</h1>
		</c:when>
		<c:when test="${category=='exile'}">
			<h1 class="center" style="color: white;">유배지</h1>
		</c:when>
		<c:when test="${category=='music'}">
			<h1 class="center">노래방</h1>
		</c:when>
		<c:when test="${category=='broadcast'}">
			<h1 class="center" style="color: white;">방송국</h1>
		</c:when>
	</c:choose>
	<div id="tags">
		<c:if test="${!empty sessionScope.email}">
			<c:if test="${category!='exile'}">
				<div class="write"><a href="write?category=${category}">글쓰기</a></div>
			</c:if>
		</c:if>
		<c:choose>
	        <c:when test="${category=='cafe'}">
		        <div class="box" id="worry">고민</div>
				<div class="box" id="boy">남자</div>
				<div class="box" id="girl">여자</div>
				<div class="box" id="fun">꿀잼</div>
				<div class="box" id="emp">직장인</div>
	        </c:when>
	        <c:when test="${category=='bar'}">
	            <div class="box" id="worry">고민</div>
				<div class="box" id="father">아버지</div>
				<div class="box" id="emp">직장인</div>
	        </c:when>
	        <c:when test="${category=='school'}">
	            <div class="box" id="worry">고민</div>
				<div class="box" id="middle">중딩</div>
				<div class="box" id="high">고딩</div>
				<div class="box" id="university">대딩</div>
				<div class="box" id="boy">남</div>
				<div class="box" id="girl">여</div>
				<div class="box" id="fun">꿀잼</div>
	        </c:when>
	        <c:when test="${category=='penthouse'}">
	            <div class="box" id="oneroom">자취</div>
				<div class="box" id="singles">독신</div>
				<div class="box" id="boast">뽐내기</div>
				<div class="box" id="recipe">레시피</div>
	        </c:when>
	        <c:when test="${category=='military'}">
	            <div class="box" id="boy">남자</div>
	        </c:when>
	        <c:when test="${category=='exile'}">
	            <div class="box" id="arrest">구속</div>
	        </c:when>
	        <c:when test="${category=='music'}">
				<div class="box" id="genre">장르</div>
				<div class="box" id="feeling">희노애락</div>
	        </c:when>
			<c:when test="${category=='broadcast'}">
	            <div class="box" id="news">좋은 뉴스</div>
				<div class="box" id="recommendation">추천 정보</div>
				<div class="box" id="gain">득템 정보</div>
				<div class="box" id="story">좋은 글</div>
	    	</c:when>
		</c:choose>
	</div>
	<br>
	<div id="list">
	</div>
</c:if>
<c:if test="${category=='square'}">
	<h1 class="center">광장</h1>
	<div id="divCafe"><span class="spanSquare"><a href="cafe">카페</a></span></div>
	<div id="divBar"><span class="spanSquare"><a href="bar">선술집</a></span></div>
	<div id="divSchool"><span class="spanSquare"><a href="school">학교</a></span></div>
	<div id="divPenthouse"><span class="spanSquare"><a href="penthouse">옥탑방</a></span></div>
	<div id="divMilitary"><span class="spanSquare"><a href="military">군대</a></span></div>
	<div id="divExile"><span class="spanSquare"><a href="exile">유배지</a></span></div>
	<div id="divMusic"><span class="spanSquare"><a href="music">노래방</a></span></div>
	<div id="divBroadcast"><span class="spanSquare"><a href="broadcast">방송국</a></span></div>
</c:if>	
</body>
</html>