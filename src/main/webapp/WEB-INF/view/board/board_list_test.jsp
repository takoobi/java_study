<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var tag = [];
var num = 2;
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
				$.each(data.cafe, function(){
					
				}){
					
				}
				
			}
		})
	}
});





</script>
</head>
<body>

</body>
</html>