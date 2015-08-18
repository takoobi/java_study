<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
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
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var tag =[];
var num=2;
var end;
$(function(){
		
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
		}
	});	
}
$(window).scroll(function(){
    if($(window).scrollTop() == $(document).height() - $(window).height()){
    	infinite_ajax_scroll();
    }
});

</script>
<style type="text/css">
	#tags{
		height: 100px;
		border: 1px solid red;
	}
	#list{
		border: 1px solid black;
	}
	.box{
		width: 70px;
		height: 30px;
		background-color: #9cff2f;
		margin: 0 10px;
		float: left;
		line-height: 25px;
		text-align: center;
		font-size: 10px;
	}
	.select{
		background-color: #fff616;
	}
</style>
</head>
<body>
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
</body>
</html>