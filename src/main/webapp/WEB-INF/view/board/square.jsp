<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카페 - 소통의 공간</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../css/flat-ui.css" />
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.3.0/css/font-awesome.min.css" />	
	<link rel="stylesheet" type="text/css" href="../css/menu-component.css" />
	
	<script src="../js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="../js/modernizr.custom.25376.js"></script>
	<script src="../js/flat-ui.js"></script>
	
	<style>
		body{
			overflow-y:scroll;
		}
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
	.outer-nav{
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
	opacity: 0.8;
	z-index: -1;
	}
	.container {
		width: 100%;
		background-color: gray;
		background-size: cover;
		background-image:url('${pageContext.request.contextPath}/resources/image/square/square0.jpg');
		background-repeat:no-repeat;
		background-attachment: fixed;
		background-position: 0 0;
	}
	.effect-moveleft .outer-nav a  {
		font-size: 30px;
		color: #f05f40;
	}
	#showMenu {
		font-size: 25px;
	}
	nav {
		margin-top:10px;
	}
	#list .post {
		margin: 10px;
	}
	#list .post  .well{
		padding: 0;
	}
	#list .post  .well p{
		margin: 10px 19px;
	}
	#list .create{
		margin-right:10px;
	}
	</style>

    
  <script>
  $(function(){
		
		$('#showMenu').click(function(){
			$('.outer-nav').show();
		});
	   
	});
  
  
  </script>
</head>

<body>
		  
	<div id="perspective" class="perspective effect-moveleft">
		<div class="container">
			<div class="wrapper"><!-- wrapper needed for scroll -->
				<!-- Top Navigation -->	
				<nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <div class="navbar-header">
				        <a class="navbar-brand" href="/LOVE">
				          <!-- <img alt="Brand" src="..."> -->
				          감성천국
				        </a>
				      </div>
				    </div>
				
				    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
				        <li><a href="#" id="showMenu" class="fa fa-car fa-4x"></a></li>			        			        
				      </ul>
				      <form class="navbar-form navbar-left" role="search">
				        <div class="form-group">
				          <input type="text" class="form-control" placeholder="검색">
				        </div>
				        <button type="submit" class="btn btn-default fa fa-search"></button>
				      </form>
				      <ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.nickname} <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="#">프로필</a></li>
				            <li><a href="#">Another action</a></li>
				            <li><a href="#">Something else here</a></li>
				            <li class="divider"></li>
				            <li><a href="#">로그아웃</a></li>
				          </ul>
				        </li>
				      </ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>		
					
				<div class="row" id="list">				
					<c:forEach var="item" items="${result}">
					<div class="col-md-3 ">
						<div class="post">
							<a  href="list/${item.key}">
								<h3>
								<c:choose>
									<c:when test="${item.key == 'cafe' }">카페</c:when>
									<c:when test="${item.key == 'military' }">군대</c:when>
									<c:when test="${item.key == 'penthouse' }">옥탑방</c:when>
									<c:when test="${item.key == 'school' }">학교</c:when>
									<c:when test="${item.key == 'bar' }">선술집</c:when>
									<c:when test="${item.key == 'exile' }">유배지</c:when>
									<c:when test="${item.key == 'music' }">노래방</c:when>
									<c:when test="${item.key == 'broadcast' }">방송국</c:when>
								</c:choose>
								</h3>
							</a>
							<div class="well" >
							<c:forEach var="list" items="${item.value }">								
								<p><a href="detail/${list.pk }">
									<span class="create">${list.create_date }</span>
									<span class="title">${list.title}</span>									
								</a></p>
							</c:forEach>		
							</div>												
						</div>
					</div>
					</c:forEach>									
				</div>
				<div id="loadmoreajaxloader" style="display:none;"><center><img src="../img/ajax-loader.gif" /></center></div>
			</div><!-- wrapper -->
		</div><!-- /container -->
		<nav class="outer-nav right vertical">
			<a href="/LOVE" class="icon-home">홈</a>
			<a href="list/square" class="icon-news">광장</a>
			<a href="list/cafe" class="icon-image">카페</a>
			<a href="list/bar" class="icon-upload">선술집</a>
			<a href="list/school" class="icon-star">학교</a>
			<a href="list/penthouse" class="icon-mail">옥탑방</a>
			<a href="list/military" class="icon-lock">군대</a>
			<a href="list/broarcast" class="icon-star">방송국</a>
			<a href="list/music" class="icon-mail">노래방</a>
			<a href="list/exile" class="icon-lock">유배지</a>
		</nav>
	</div><!-- /perspective -->
	<script src="../js/classie.js"></script>
	<script src="../js/menu.js"></script>
</body>

</html>
