<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var number=0;
$(function(){
    $(".today").click(function(){
    	alert($(this).attr("id"));
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
				alert("확인");
    		}
    	});
    });  
});
</script>
</head>
<body>
<input type="hidden" id="category" name="category" value="${param.category}">
<input type="hidden" id="pk" name="pk" value="${boardBean.pk}">
<a href="javascript:history.back()">X</a><br>
제목 : ${boardBean.title}<br>
내용 : ${boardBean.description}<br>
이미지 : ${boardBean.image}<br>
공감 : ${boardBean.good}<br>
비공감 : ${boardBean.bad}<br>
조회수 : ${boardBean.hit}<br>
글쓴날 : ${boardBean.create_date}<br>

<br><br>
<c:if test="${!empty sessionScope.email}">
	<button id="good" class="today">공감</button>
	<button id="good_cancle" class="today">공감 취소</button>
	<button id="bad" class="today">비공감</button>
	<button id="bad_cancle" class="today">비공감 취소</button>
</c:if>
<c:if test="${empty sessionScope.email}">
	공감, 비공감은 로그인을 하셔야 이용하실 수 있습니다.
</c:if>
<br><br><br>
댓글<br>
<c:if test="${!empty sessionScope.email}">
	<textarea rows="5" cols="50"></textarea><button>comment</button>
</c:if>
<c:if test="${empty sessionScope}">
	댓글은 로그인을 하셔야 이용하실 수 있습니다.
</c:if>

</body>
</html>