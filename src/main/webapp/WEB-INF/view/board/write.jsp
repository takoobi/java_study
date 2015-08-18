<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>게시판</title>
    <meta name="description" content="Trumbowyg is a very small jQuery plugin for creating a powerful WYSIWYG editor">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="google-site-verification" content="ECeSHLIckOv9unlORi9lLtDUy7rk_CI5-AF9AU3upJE">

    <link rel="stylesheet" href="resources/editor/ui/trumbowyg.min.css">
    <link rel="stylesheet" href="resources/editor/plugins/colors/ui/trumbowyg.colors.min.css">
    <link rel="stylesheet" href="resources/editor/main.css" />
	
	<style>
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
	#test {
		background-color: black;
		width:50px;
		height:50px;
	}
	</style>
</head>
<body>

<main class="main">
    <section class="section wrapper" id="demonstration">
        <h2 class="section-title">Demonstration</h2>
        <h3 class="section-subtitle">See for yourself</h3>
			<form action="doWrite" enctype="multipart/form-data" method="post" id="form">
				${param.category}
				<input type="hidden" value="${param.category}" name="category">
				<input type="hidden" id="tag" name="tag">
				
				<input type="text" id="title" name="title"/>제목
				<input type="text" id="email" name="email"/>이메일
		            <div class="box" value="worry">고민</div>
					<div class="box" value="man">남자</div>
					<div class="box" value="woman">여자</div>
					<div class="box" value="fun">꿀잼</div>
					<div class="box" value="emp">직장인</div>
	            
				<textarea id="trumbowyg-demo" name="description">
                </textarea>
                
                <input type="submit" />
			</form>                
    </section>

</main>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.1.min.js"><\/script>')</script>
<script src="resources/editor/trumbowyg.js"></script>
<script src="resources/editor/plugins/colors/trumbowyg.colors.min.js"></script>
<script src="resources/editor/plugins/upload/trumbowyg.upload.js"></script>
<script src="resources/editor/langs/ko.min.js"></script>
<script type="text/javascript">
    $('#trumbowyg-demo').trumbowyg({
    	lang: 'ko',
        btnsDef: {
            // Customizables dropdowns
            image: {
                dropdown: ['insertImage', 'upload'],
                ico: 'insertImage'
            }
        },
        btns: ['viewHTML',
            '|', 'formatting',
            '|', 'btnGrp-design',
            '|', 'link',
            '|', 'image',
            '|', 'btnGrp-justify',
            '|', 'btnGrp-lists',
            '|', 'foreColor', 'backColor',
            '|', 'horizontalRule']
    });
    
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
        		if($(this).is('.select')){
            		data.push($(this).attr("value"));
        		}
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
