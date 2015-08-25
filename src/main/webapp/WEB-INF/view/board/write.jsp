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
	<link rel="stylesheet" type="text/css" href="css/menu-component.css" />
	<script src="js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="js/modernizr.custom.25376.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/flat-ui.js"></script>

	
	<style>
	#theSidebar {
			display: none;
		}
		#showMenu > span {
			font-size: 16px;
		}
	
	.selectTag{
		background-color: #fff616 !important;
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
	#description {
		height: 300px;
	}
	#title {
		margin-bottom:20px;
		
	}
	#form .write{
		margin-top: 20px;
	}
	</style>
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
				      	<li ><a id="pointCheck" href="/LOVE/board/write">글쓰기</a></li>
				        <li class="dropdown">
				          <a href="#" id="nickname" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.nickname} <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="#">프로필</a></li>
				            <li><a href="#">Another action</a></li>
				            <li><a href="#">Something else here</a></li>
				            <li class="divider"></li>
				            <li><a href="/LOVE/member/logout">로그아웃</a></li>
				          </ul>
				        </li>
				      </ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>		
					
				 <section class="row ">
					<form action="doWrite" enctype="multipart/form-data" method="post" id="form" class="col-md-8 col-md-offset-2">
						<input type="hidden" id="tag" name="tag">
						
						<input type="text" id="title" name="title" class="form-control" placeholder="제목"/>
				            
							<!-- <div class="box" value="emp">직장인</div> -->
						<div class="tagsinput-primary">
							<c:choose>
	            <c:when test="${category=='cafe'}">
		            <input name="tagsinput" class="tagsinput" data-role="tagsinput" value="고민, 남자, 여자, 꿀잼, 직장인" />
	            </c:when>
	            <c:when test="${category=='bar'}">
	            	<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="고민,아버지,직장인" />
	            </c:when>
	            <c:when test="${category=='school'}">
								<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="고민, 중딩,고딩,대딩,남,여,꿀잼" />
	            </c:when>
	            <c:when test="${category=='penthouse'}">
								<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="자취,독신,뽐내기,레시피" />
	            </c:when>
	            <c:when test="${category=='military'}">
	            	<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="병아리,일병,상병,병장,직업군인" />
	            </c:when>
	            <c:when test="${category=='exile'}">
	            	<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="구속," />
	            </c:when>
	            <c:when test="${category=='music'}">
								<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="최신가요,발라드,힙합" />
	            </c:when>
	            <c:when test="${category=='broadcast'}">
								<input name="tagsinput" class="tagsinput" data-role="tagsinput" value="추천,좋은글,득탬,뉴스" />
	            </c:when>
	        </c:choose>
			      </div>
			            
						<textarea  id="description" name="description" class="form-control">
			      </textarea>
			               
			      <center><input type="submit" class="btn btn-primary write" value="글쓰기"/></center>
					</form>                
			    </section>
			</div><!-- wrapper -->
		</div><!-- /container -->
		<nav class="outer-nav right vertical">
			<a href="/LOVE" class="icon-home">홈</a>
			<a href="square" class="icon-news">광장</a>
			<a href="cafe" class="icon-image">카페</a>
			<a href="bar" class="icon-upload">선술집</a>
			<a href="school" class="icon-star">학교</a>
			<a href="penthouse" class="icon-mail">옥탑방</a>
			<a href="military" class="icon-lock">군대</a>
		</nav>
	</div><!-- /perspective -->
	<script src="js/classie.js"></script>
	<script src="js/menu.js"></script>
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
