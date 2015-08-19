<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카페 - 소통의 공간</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css" />	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu-component.css" />
	
	<script src="js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="${pageContext.request.contextPath}/js/modernizr.custom.25376.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/flat-ui.js"></script>
	
	<style>
		#theSidebar {
			display: none;
		}
		#showMenu > span {
			font-size: 16px;
		}
	
	.box{
		width: 70px;
		height: 30px;
		background-color: #9cff2f;
		margin: 0 10px;
		float: left;
		line-height: 25px;
		text-align:s center;
		font-size: 10px;
	}
	.select{
		background-color: #fff616;
	}
	  
	.post {
		border: 1px solid black;
		height: 300px;
		margin-bottom: 30px;
	}
	.post-dummy{
		display: none;
	}
	
	.effect-moveleft{
		background-image: url('${pageContext.request.contextPath}/img/wallpaper.jpg');
		background-size: cover;
	}
	.effect-moveleft:after { /* add the transparent pattern overlay */ 
	background: gray;
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	opacity: 0.5;
	z-index: -1;
	}
	.container {
		width: 100%;
		background-color: gray;
		background-size: cover;
		opacity: 0.7;
	}
	.effect-moveleft .outer-nav a  {
		font-size: 30px;
		color: #f05f40;
	}
	section {
		color: black;
	}
	</style>
    
  
</head>

<body>
		  
	<div id="perspective" class="perspective effect-moveleft">
		<div class="container">
			<div class="wrapper"><!-- wrapper needed for scroll -->
				
				<section id="content">
					<h1>${ board.title }</h1>
					<div>${board.description }</div>
				</section>				
					
			</div><!-- wrapper -->
		</div><!-- /container -->
		<nav class="outer-nav right vertical">
			<a href="#" class="icon-home">홈</a>
			<a href="#" class="icon-news">광장</a>
			<a href="#" class="icon-image">카페</a>
			<a href="#" class="icon-upload">선술집</a>
			<a href="#" class="icon-star">학교</a>
			<a href="#" class="icon-mail">옥탑방</a>
			<a href="#" class="icon-lock">군대</a>
		</nav>
	</div><!-- /perspective -->
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/menu.js"></script>
</body>

</html>
