<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var tag =[];
var pageNum;
var blockNum;
$(function(){
		
	ajax();
	
    $(".box").click(function(){
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
    tag=[];	
}
function ajax(){
    $.ajax({
		type:"post",
		url:"doList",
		data:{
			"result" : tag.toString(),
			"category" : $('#category').val(),
			"pageNum":pageNum,
			"blockNum":blockNum
		},
		dataType:"json",
		success:function(data){
			$("#list").empty(); 
			var result = JSON.parse(data.list);
		
			var htmlList = "<table>";

			if(data.totalSize==0){
				htmlList += '<tr>';
				htmlList += '<td><b>게시물이 없습니다</b></td>';
				htmlList += '</tr>';
			}		
			if(data.totalSize!=0){
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
			}		
			htmlList+="</table><br><br>";
			
			
			/* 페이징처리 */
			if(data.totalSize>0){
		        htmlList += '<table>';
		        htmlList += '<tr>';
		        htmlList += '<td>';
		        if(data.currentBlock>1){
		        	htmlList +='<a href="#" id="first">처음</a>';
		        	htmlList +='<a href="#" id="before">이전</a>';
		        	$("#before_pageNum").val((data.startPage-1));
		        	$("#before_blockNum").val((data.currentBlock-1));
		        }
		        for(var i=data.startPage; i<=data.endPage; i++){
		        	if(data.currentPage==i) htmlList +='<font color="red" ><b>'+i+'</b></font>';
		        	if(data.currentPage!=i) htmlList +='<a href="#" class="number">'+i+'</a>';
		        }
		        if(data.currentBlock<data.totalBlock){
		        	htmlList +='<a href="#" id="next">다음</a>';
		        	$("next_blockNum").val((data.currentBlock+1));
		        	$("next_pageNum").val((data.endPage+1));
		        	htmlList +='<a href="#" id="last">마지막</a>';
		        	$("last_blockNum").val(data.totalBlock);
		        	$("last_pageNum").val(data.totalPage);
		        }
		        htmlList += '<td>';
		        htmlList += '</tr>';				
			}
		    $("#list").append(htmlList); 
		}
	});	
}
$(document).on( 'click', 'a', function(){
	if($(this).attr("class")=="number"){
		pageNum=$(this).html();
		alert(pageNum);
		start();  			
	}
	switch($(this).attr("id")){
    	case "first":
    		pageNum=$("#first_pageNum").val();
    		blockNum=$("#first_blockNum").val();
    		start();
    		break;
		case "before":
			pageNum=$("#before_pageNum").val();
    		blockNum=$("#before_blockNum").val();
    		start();
    		break;	
		case "next":
			pageNum=$("#next_pageNum").val();
			blockNum=$("#next_blockNum").val();
			start();
    		break;
		case "last":
			pageNum=$("#last_pageNum").val();
			blockNum=$("#last_blockNum").val();
			start();
    		break;
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
<input type="hidden" id="first_blockNum" name="first_blockNum" value="1">
<input type="hidden" id="first_pageNum" name="first_pageNum" value="1">
<input type="hidden" id="before_blockNum" name="before_blockNum">
<input type="hidden" id="before_pageNum" name="before_pageNum">
<input type="hidden" id="next_blockNum" name="next_blockNum">
<input type="hidden" id="next_pageNum" name="next_pageNum">
<input type="hidden" id="last_blockNum" name="last_blockNum">
<input type="hidden" id="last_pageNum" name="last_pageNum">
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
	<div id="list">
	
	</div>
</body>
</html>