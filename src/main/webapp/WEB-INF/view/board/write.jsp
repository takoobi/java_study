<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/flat-ui.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.3.0/css/font-awesome.min.css" />	
	
	<script src="js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="js/modernizr.custom.25376.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/flat-ui.js"></script>

	
	<style>
	.select{
		background-color: #fff616;
	}
	#test {
		background-color: black;
		width:50px;
		height:50px;
	}
	
	</style>
</head>
<body>

<div class="container">
    <section class="row">
		<form action="doWrite" enctype="multipart/form-data" method="post" id="form" class="col-md-8">
			${param.category}
			<input type="hidden" value="${param.category}" name="category">
			<input type="hidden" id="tag" name="tag">
			
			<input type="text" id="title" name="title" class="form-control"/>제목
	            
				<!-- <div class="box" value="emp">직장인</div> -->
			<div class="tagsinput-primary">
            	<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="고민, 남자, 여자, 꿀잼, 직장인" />
          	</div>
            
			<textarea  id="description" name="description" class="form-control">
            </textarea>
               
            <input type="submit" class="form-control"/>
		</form>                
    </section>

</div>


<script type="text/javascript">    
    
    $(function(){
    	var data =[];
        
        $("#form").submit(function(){
        	$(".tag").each(function(){
        		data.push($(this).text());
        	});
        	$('#tag').attr("value",data);
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
</body>
</html>
