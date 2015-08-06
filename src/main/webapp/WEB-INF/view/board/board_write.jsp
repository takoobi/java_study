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
            data.pop($(this).attr("value"));
        } else{
            $(this).addClass("select");
            data.push($(this).attr("value"));
        }
    });
    
    $("#form").submit(function(){
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
<form action="BoardWriteAction" enctype="multipart/form-data" method="post" id="form">
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