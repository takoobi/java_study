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
		    	list+= item['email']+"      "+item['description']+"      "+formatted;
		    	list+="</div>";
		    });				
		    $("#reply").prepend(list);
		}
	});
});

//Formats d to MM/dd/yyyy HH:mm:ss format
function formatDate(d){
	function addZero(n){
		return n < 10 ? '0' + n : '' + n;
	}

    return d.getFullYear() +"/"+ addZero(d.getMonth()+1) + "/" + addZero(d.getDate()) + " " + 
           addZero(d.getHours()) + ":" + addZero(d.getMinutes()) + ":" + addZero(d.getMinutes());
}

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
			$("#good").empty();
			$("#good").append(data.good);
			$("#bad").empty();
			$("#bad").append(data.bad);
			if(data.good_id_check){
				$("#emotion_good").empty();
				$("#emotion_good").append("<button id='good_cancle' class='today'>공감 취소</button>");
			}else{
				$("#emotion_good").empty();
				$("#emotion_good").append("<button id='good' class='today'>공감</button>");					
			}
			if(data.bad_id_check){
				$("#emotion_bad").empty();
				$("#emotion_bad").append("<button id='bad_cancle' class='today'>비공감 취소</button>");
			}else{
				$("#emotion_bad").empty();
				$("#emotion_bad").append("<button id='bad' class='today'>비공감</button>");					
			}
		}
	});
});

$(document).on( 'click', "button[id='comment']", function(){
	
	if($("#description").val()==""){
		alert("내용을 입력해주세요.");
		return false;
	}

	$("#reply").empty();
	
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
		    	list+= item['email']+"      "+item['description']+"      "+formatted;
		    	list+="</div>";
		    });				
		    $("#reply").prepend(list);
		}
	});
	
	$("#description").val("");
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
공감 : <p id="good">${boardBean.good}</p><br>
비공감 : <p id="bad">${boardBean.bad}</p><br>
조회수 : ${boardBean.hit}<br>
글쓴날 : ${boardBean.create_date}<br>

<br><br>
<c:if test="${!empty sessionScope.email}">
	<div id="emotion_good">
		<c:if test="${good_id_check==true}">
			<button id="good_cancle" class="today">공감 취소</button>
		</c:if>
		<c:if test="${good_id_check==false}">
			<button id="good" class="today">공감</button>
		</c:if>
	</div>
	<div id="emotion_bad">
		<c:if test="${bad_id_check==true}">
			<button id="bad_cancle" class="today">비공감 취소</button>	
		</c:if>
		<c:if test="${bad_id_check==false}">
			<button id="bad" class="today">비공감</button>
		</c:if>
	</div>
</c:if>
<c:if test="${empty sessionScope.email}">
	공감, 비공감은 로그인을 하셔야 이용하실 수 있습니다.
</c:if>
<br><br><br>
<div id="reply"></div>
댓글<br>
<c:if test="${!empty sessionScope.email}">
	<textarea rows="5" cols="50" id="description" name="description"></textarea><button id="comment">comment</button>
</c:if>
<c:if test="${empty sessionScope}">
	댓글은 로그인을 하셔야 이용하실 수 있습니다.
</c:if>

</body>
</html>