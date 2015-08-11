<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>
<body>
<<<<<<< HEAD:src/main/webapp/WEB-INF/view/login.jsp
	<h1>로그인 화면</h1>
=======

>>>>>>> 8ffbc75cd4f7d88e8aa2410cd65c8cf77426a8c3:src/main/webapp/WEB-INF/view/board/board_list.jsp
=======
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	var data =[];

    $(".box").click(function(){
        if($(this).hasClass("select")){
            $(this).removeClass("select");
            data.pop($(this).attr("value"));
        } else{
            $(this).addClass("select");
            data.push($(this).attr("value"));
        }
        
        $.post("doList",{result:data.toString()},function(data){
        	console.log("success");
        });
    });
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
	<h1>${param.category} 게시판 리스트</h1>
	<div id="tags">
		<c:choose>
	        <c:when test="${param.category=='cafe'}">
		        <div class="box" value="worry">고민</div>
				<div class="box" value="man">남자</div>
				<div class="box" value="woman">여자</div>
				<div class="box" value="fun">꿀잼</div>
				<div class="box" value="emp">직장인</div>
	        </c:when>
	        <c:when test="${param.category=='bar'}">
	            <div class="box" value="worry">고민</div>
				<div class="box" value="father">아버지</div>
				<div class="box" value="emp">직장인</div>
	        </c:when>
	        <c:when test="${param.category=='school'}">
	            <div class="box" value="worry">고민</div>
				<div class="box" value="middle">중딩</div>
				<div class="box" value="high">고딩</div>
				<div class="box" value="university">대딩</div>
				<div class="box" value="man">남</div>
				<div class="box" value="woman">여</div>
				<div class="box" value="fun">꿀잼</div>
	        </c:when>
	        <c:when test="${param.category=='penthouse'}">
	            <div class="box" value="oneroom">자취</div>
				<div class="box" value="singles">독신</div>
				<div class="box" value="boast">뽐내기</div>
				<div class="box" value="recipe">레시피</div>
	        </c:when>
	        <c:when test="${param.category=='military'}">
	            <div class="box" value="man">남자</div>
	        </c:when>
	        <c:when test="${param.category=='exile'}">
	            <div class="box" value="arrest">구속</div>
	        </c:when>
	        <c:when test="${param.category=='music'}">
				<div class="box" value="genre">장르</div>
				<div class="box" value="feeling">희노애락</div>
	        </c:when>
			<c:when test="${param.category=='broadcast'}">
	            <div class="box" value="news">좋은 뉴스</div>
				<div class="box" value="recommendation">추천 정보</div>
				<div class="box" value="gain">득템 정보</div>
				<div class="box" value="story">좋은 글</div>
	    	</c:when>
		</c:choose>
	</div>
	<div id="list">
		<c:forEach var="boardbean" items="${list}">
			<tr>
				<td>${boardbean.title}</td>
				<td>${boardbean.description}</td>
				<td>${boardbean.image}</td>
				<td>${boardbean.good}</td>
				<td>${boardbean.bad}</td>
				<td>${boardbean.hit}</td>
				<td>${boardbean.email}</td>
				<td>${boardbean.create_date}</td>
			</tr>
			<br>
		</c:forEach>
	</div>
>>>>>>> 2a3ab83e111b9e53295edbddfdf4d799da0bd3c2
</body>
</html>