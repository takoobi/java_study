<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>게시판</title>
<meta name="description" content="3D Grid Effect: Recreation of the effect seen in the prototype app by Marcus Eckert | Demo 1" />
<meta name="keywords" content="3d, grid, effect, flip, css transform, perspective, web design" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/3DGridEffect/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/3DGridEffect/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/3DGridEffect/css/component.css" />
<script src="${pageContext.request.contextPath}/resources/3DGridEffect/js/modernizr.custom.js"></script>
=======
<title>게시판</title>
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var tag =[];
var num=2;
var end;
$(function(){
<<<<<<< HEAD
		
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
});
function start(){
    $(".box").each(function(){
        if($(this).is(".select")){
        	tag.push($(this).attr("id"));
        }
=======
	if("${category}"=="square"){
	    $.ajax({
			type:"post",
			url:"allList",
			dataType:"json",
			success:function(data){
				//console.log(JSON.stringify(data.cafe));
				
				var cafe="";
			    $.each(data.cafe, function(index, item){
			    	cafe+="<div>";
			    	cafe+= item['pk']+"      "+item['title'];
			    	cafe+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	cafe+="</div>";
			    });	
			    $("#cafe").append(cafe);
			    
				var bar="";
			    $.each(data.bar, function(index, item){
			    	bar+="<div>";
			    	bar+= item['pk']+"      "+item['title'];
			    	bar+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	bar+="</div>";
			    });	
			    $("#bar").append(bar);
			    
				var school="";
			    $.each(data.school, function(index, item){
			    	school+="<div>";
			    	school+= item['pk']+"      "+item['title'];
			    	school+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	school+="</div>";
			    });	
			    $("#school").append(school);
			    
				var penthouse="";
			    $.each(data.penthouse, function(index, item){
			    	penthouse+="<div>";
			    	penthouse+= item['pk']+"      "+item['title'];
			    	penthouse+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	penthouse+="</div>";
			    });	
			    $("#penthouse").append(penthouse);
			    
				var military="";
			    $.each(data.military, function(index, item){
			    	military+="<div>";
			    	military+= item['pk']+"      "+item['title'];
			    	military+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	military+="</div>";
			    });	
			    $("#military").append(military);
			    
				var exile="";
			    $.each(data.exile, function(index, item){
			    	exile+="<div>";
			    	exile+= item['pk']+"      "+item['title'];
			    	exile+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	exile+="</div>";
			    });	
			    $("#exile").append(exile);
			    
				var music="";
			    $.each(data.music, function(index, item){
			    	music+="<div>";
			    	music+= item['pk']+"      "+item['title'];
			    	music+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	music+="</div>";
			    });	
			    $("#music").append(music);
			    
				var broadcast="";
			    $.each(data.broadcast, function(index, item){
			    	broadcast+="<div>";
			    	broadcast+= item['pk']+"      "+item['title'];
			    	broadcast+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	broadcast+="</div>";
			    });	
			    $("#broadcast").append(broadcast);
			}
		});			
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
});
function start(){
    $(".box").each(function(){
        if($(this).is(".select")){
        	tag.push($(this).attr("id"));
        }
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
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
<<<<<<< HEAD
		
			var htmlList = "<table>";

		    $.each(result, function(index, item){
		        htmlList += '<tr>';
		        htmlList += '<td>' + item["pk"] + '<td>';
		        htmlList += '<td>' + item["email"] + '<td>';
		        htmlList += '<td>' + item["title"] + '<td>';
		        htmlList += '<td>' + item["description"] + '<td>';
		        htmlList += '<td>' + item["tag"] + '<td>';
		        htmlList += '<td>' + item["image"] + '<td>';
		        htmlList += '<td>' + item["good"] + '<td>';
		        htmlList += '<td>' + item["bad"] + '<td>';
		        htmlList += '<td>' + item["hit"] + '<td>';
		        htmlList += '<td>' + item["create_date"] + '<td>';
		        htmlList += '</tr>';
		    });	
			htmlList+="</table><br><br>";	
		    htmlList+="<br><br><br><br><br><br><br><br><br><br><br><br>";
		    htmlList+="<br><br><br><br><br><br><br><br><br><br><br><br>";
		    $("#list").append(htmlList); 
=======
			var list="";

		    $.each(result, function(index, item){
		    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>";
		    	list+="<div class='content'>";
		    	list+="<p class='opacity'>";
		    	list+= item['title'];
		    	list+="</p>";
		    	list+="</div>";
		    	list+="</a>";
		    });	
		    $("#list").append(list);
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
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
<<<<<<< HEAD
			var htmlList;

			if(result!=""){
				htmlList = "<table>";
			    $.each(result, function(index, item){
			        htmlList += '<tr>';
			        htmlList += '<td>' + item["pk"] + '<td>';
			        htmlList += '<td>' + item["email"] + '<td>';
			        htmlList += '<td>' + item["title"] + '<td>';
			        htmlList += '<td>' + item["description"] + '<td>';
			        htmlList += '<td>' + item["tag"] + '<td>';
			        htmlList += '<td>' + item["image"] + '<td>';
			        htmlList += '<td>' + item["good"] + '<td>';
			        htmlList += '<td>' + item["bad"] + '<td>';
			        htmlList += '<td>' + item["hit"] + '<td>';
			        htmlList += '<td>' + item["create_date"] + '<td>';
			        htmlList += '</tr>';
			    });	    
				htmlList+="</table><br><br>";
			    htmlList+="<br><br><br><br><br><br><br><br><br><br><br><br>";
			    htmlList+="<br><br><br><br><br><br><br><br><br><br><br><br>";	
			    
			}else{
				htmlList="더 이상 볼게 없네요~.";	
				end=0;
			}
			$("#list").append(htmlList); 
=======

			var list="";

			if(result!=""){
			    $.each(result, function(index, item){
			    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>";
			    	list+="<div class='content'>";
			    	list+="<p class='opacity'>";
			    	list+= item['title'];
			    	list+="</p>";
			    	list+="</div>";
			    	list+="</a>";
			    });			    
			}else{
				list="<div class='content'>더 이상 볼게 없네요~ㅠㅠ</div>";
				end=0;
			}
			$("#list").append(list);
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
		}
	});	
}
$(window).scroll(function(){
<<<<<<< HEAD
    if($(window).scrollTop() == $(document).height() - $(window).height()){
    	infinite_ajax_scroll();
    }
=======
	if("${category}"!="square"){
	    if($(window).scrollTop() == $(document).height() - $(window).height()){
	    	infinite_ajax_scroll();
	    }	
	}
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
});

</script>
<c:choose>
	<c:when test="${category=='cafe'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/cafe/cafe00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='bar'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/bar/bar00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='school'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/school/school00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='penthouse'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/penthouse/penthouse00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='military'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/military/military00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='exile'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/exile/exile00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='music'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/music/music00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
	<c:when test="${category=='broadcast'}">
		<style type="text/css">
			.content{
				background-image: url("${pageContext.request.contextPath}/resources/image/broadcast/broadcast00.jpg");
				background-size:340px 300px;
				opacity:0.3;
			}
		</style>	
	</c:when>
</c:choose>
<style type="text/css">
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
	.content{
		width: 340px;
		height: 300px;
		border: 1px solid black;
		float: left;
		margin:10px;
	}
	a:link,a:visited,a:hover{
		text-decoration: none;
		color: black;
	}
	.center{
		position: absolute;
		left: 50px;
	}
</style>
</head>
<body>
<<<<<<< HEAD
<input type="hidden" id="category" name="category" value="${param.category}">
<div class="container">
			<!-- Top Navigation -->
			<header class="codrops-header">
				<h1>${param.category} 게시판 리스트</h1>
				<div id="tags">
					<c:choose>
				        <c:when test="${param.category=='cafe'}">
					        <div class="box" id="worry">고민</div>
							<div class="box" id="boy">남자</div>
							<div class="box" id="girl">여자</div>
							<div class="box" id="fun">꿀잼</div>
							<div class="box" id="emp">직장인</div>
				        </c:when>
				        <c:when test="${param.category=='bar'}">
				            <div class="box" id="worry">고민</div>
							<div class="box" id="father">아버지</div>
							<div class="box" id="emp">직장인</div>
				        </c:when>
				        <c:when test="${param.category=='school'}">
				            <div class="box" id="worry">고민</div>
							<div class="box" id="middle">중딩</div>
							<div class="box" id="high">고딩</div>
							<div class="box" id="university">대딩</div>
							<div class="box" id="boy">남</div>
							<div class="box" id="girl">여</div>
							<div class="box" id="fun">꿀잼</div>
				        </c:when>
				        <c:when test="${param.category=='penthouse'}">
				            <div class="box" id="oneroom">자취</div>
							<div class="box" id="singles">독신</div>
							<div class="box" id="boast">뽐내기</div>
							<div class="box" id="recipe">레시피</div>
				        </c:when>
				        <c:when test="${param.category=='military'}">
				            <div class="box" id="boy">남자</div>
				        </c:when>
				        <c:when test="${param.category=='exile'}">
				            <div class="box" id="arrest">구속</div>
				        </c:when>
				        <c:when test="${param.category=='music'}">
							<div class="box" id="genre">장르</div>
							<div class="box" id="feeling">희노애락</div>
				        </c:when>
						<c:when test="${param.category=='broadcast'}">
				            <div class="box" id="news">좋은 뉴스</div>
							<div class="box" id="recommendation">추천 정보</div>
							<div class="box" id="gain">득템 정보</div>
							<div class="box" id="story">좋은 글</div>
				    	</c:when>
					</c:choose>
				</div>
				<nav class="codrops-demos">
				</nav>
			</header>
			<section class="grid3d vertical" id="grid3d">
				<div class="grid-wrap">
					<div class="grid">
						<p class="title">1</p>
						<p class="title">2</p>
						<p class="title">3</p>
						<p class="title">4</p>
						<p class="title">5</p>
						<p class="title">6</p>
						<p class="title">7</p>
						<p class="title">8</p>
						<p class="title">9</p>
					</div>
				</div>
				<div class="content">
					<div>
						<div class="dummy-text">확인</div>
					</div>
					<span class="loading"></span>
					<span class="icon close-content"></span>
				</div>
			</section>
			<section>
				<div id="list"></div>
			</section>
		</div><!-- /container -->
	<script src="${pageContext.request.contextPath}/resources/3DGridEffect/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/3DGridEffect/js/helper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/3DGridEffect/js/grid3d.js"></script>
	<script>
		new grid3D( document.getElementById( 'grid3d' ) );
	</script>
=======
<input type="hidden" id="category" name="category" value="${category}">
<c:if test="${category!='square'}">
	<c:choose>
		<c:when test="${category=='cafe'}">
			<h1 class="center">카페</h1>
		</c:when>
		<c:when test="${category=='bar'}">
			<h1 class="center">선술집</h1>
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
			<h1 class="center">유배지</h1>
		</c:when>
		<c:when test="${category=='music'}">
			<h1 class="center">노래방</h1>
		</c:when>
		<c:when test="${category=='broadcast'}">
			<h1 class="center">방송국</h1>
		</c:when>
	</c:choose>
	<div id="tags">
		<div class="write"><a href="write?category=${category}">글쓰기</a></div>
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
	<h1>광장</h1>
	<div id="cafe">카페</div>
	<div id="bar">선술집</div>
	<div id="school">학교</div>
	<div id="penthouse">옥탑방</div>
	<div id="military">군대</div>
	<div id="exile">유배지</div>
	<div id="music">노래방</div>
	<div id="broadcast">방송국</div>
</c:if>
>>>>>>> 2aa93bff37038693b492a6e459555645f1ab4d0c
</body>
</html>