<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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

		    $.each(result, function(index, item){
		    	list+="<div>";
		    	list+= item['pk']+"      "+item['title'];
		    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
		    	list+="</div>";
		    	list+="<br><br><br>";
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
			    	list+="<div>";
			    	list+= item['pk']+"      "+item['title'];
			    	list+="<a href='board_view?pk="+item['pk']+"&category="+item['category']+"'>"+item['title']+"</a>";
			    	list+="</div>";
			    	list+="<br><br><br>";
			    });			    
			}else{
				list="더 이상 볼게 없네요~ㅠㅠ";
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
<input type="hidden" id="category" name="category" value="${category}">
<a href="write?category=${category}">${category} 글쓰기</a>
<c:if test="${category!='square'}">
	<h1>${category} 게시판</h1>
	<div id="tags">
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
	<div id="list">
	</div>
</c:if>
<c:if test="${category=='square'}">
	<h1>${category} 게시판</h1>
	<div id="cafe">카페</div>
	<div id="bar">선술집</div>
	<div id="school">학교</div>
	<div id="penthouse">옥탑방</div>
	<div id="military">군대</div>
	<div id="exile">유배지</div>
	<div id="music">노래방</div>
	<div id="broadcast">방송국</div>
</c:if>
</body>
</html>