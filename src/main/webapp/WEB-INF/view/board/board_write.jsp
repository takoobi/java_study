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
$(function(){
	var data =[];

    $(".box").click(function(){
        if($(this).hasClass("select")){
            $(this).removeClass("select");
        } else{
            $(this).addClass("select");
        }
    });
   
    $("#form").submit(function(){
        $(".box").each(function(){
            if($(this).is(".select")){
            	data.push($(this).attr("value"));
            }
        });
        
        $("#tag").attr("value",data);

    	return validity_check();
    });
});

function validity_check(){
	if($("#title").val()==""){
		alert("제목을 입력하세요.");
		return false;
	}
	if($("#tag").val()==""){
		alert("태그를 선택하세요.");
		return false;
	}
	if($("#description").val()==""){
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
}
</script>
<style type="text/css">
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
<form action="writeAction" enctype="multipart/form-data" method="post" id="form">
${param.category}
<input type="hidden" value="${param.category}" name="category">
<input type="hidden" id="tag" name="tag">

<table>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="email" id="email"  value="${sessionScope.email}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" id="title"></td>
	</tr>
	<tr>
		<td>태그</td>
		<td>
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
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="25" cols="50" name="description" id="description"></textarea></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td><input type="file" name="image" id="image"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="확인"></td>
	</tr>
</table>
</form>
</body>
</html>