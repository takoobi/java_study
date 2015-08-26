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
	
	.selectTag{
		background-color: #fff616 !important;
	}
	.post-dummy, .outer-nav{
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
		background-image:url('${pageContext.request.contextPath}/resources/image/military/military00.jpg');
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
	#list .title{
		margin-top:-10px;
		white-space: pre-wrap;
		word-break:break-all;
	}
	</style>

    
  <script>
  $(function(){
		var data =[];
		var nowpage;
		
		getList();	//해당 카테고리 처음엔 모든 글의 리스트 읽어옴
		$('#showMenu').click(function(){
			$('.outer-nav').show();
		});
	    $(".box").click(function(){    	
	        if($(this).hasClass("selectTag")){
	            $(this).removeClass("selectTag");
	        } else{
	            $(this).addClass("selectTag");
	        }
	        $(".box").each(function(){
	        	if($(this).is(".selectTag")){
	        		data.push($(this).text());
	        	}
	        });
	        $('#list').html('');
	        getList();
	        data=[];
	    });  
	    
	    function getList(){
	    	$.get("../doList/1", { tags : data.toString()}, function(data){  
	    		nowpage = data.page;
                $.each(data.boardlist, function(index, item){
                  bbsAppend(item);
                });
	        },'json');
	    }
	    
	    var bbsAppend = function(data) {
	    	console.log(data);
            var node = $('.post-dummy').clone();
            $('.title',node).append(data.title);
            $('.nickname',node).append(data.nickname);
            $('.date',node).append(data.create_date);
            $('.hit',node).append(data.hit);
            $.get('/LOVE/member/Info',{pk:data.member_pk},function(data){
            	$('.nickname',node).append(data.nickname);
            });
            node.attr('href', '../detail/' + data.pk);
            node.removeClass('post-dummy');
            $('#list').append(node);
        };   
	    
        $(window).scroll(function(){
    	    if($(window).scrollTop() == $(document).height() - $(window).height()){
    	    	$('div#loadmoreajaxloader').show();
    			if(nowpage > 0){
    				$.get("../doList/"+(nowpage+1)*1 , { tags : data.toString()}, function(data){
    					if(data.boardlist.length > 0){
    						nowpage=data.page;
    						$.each(data.boardlist, function(index, item){
    							bbsAppend(item);
    		        });
    						$('div#loadmoreajaxloader').hide();
    					}else{
    						$('div#loadmoreajaxloader').html('<center>더 이상 글이 없습니다.</center>');
    						nowpage = -1;
    					}                    
        	  },'json');
    			}
    			
    	    }
    	});    
        //수정해야댐
      $('#pointCheck').click(function(e){   
    	  var flag;
    	  var nickname = $('#nickname').text();
    	  $.get('/LOVE/member/pointCheck',{nickname:nickname},function(data){
    		  if(data.result === "true"){
    			  return false;
    		  }
    	  },'json');
      })
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
				      	<li ><a id="pointCheck" href="/LOVE/board/write" >글쓰기</a></li>
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
					
				<div class="row" >
					<div class="col-md-12 well">
							<c:forEach var="tag" items="${taglist }">								
								<button class="btn btn-primary box">${tag }</button>
							</c:forEach>					
					</div>
					<div id="list"></div>
				</div>
				<a class="col-md-3 post-dummy " href="#">
					<div class="well" >
						<h2 class="title"></h2>
						<p class="nickname"></p>
						<p class="date"></p>
						<p class="hit"></p>
					</div>
				</a>				
					
				<div id="loadmoreajaxloader" style="display:none;"><center><img src="../img/ajax-loader.gif" /></center></div>
			</div><!-- wrapper -->
		</div><!-- /container -->
		<nav class="outer-nav right vertical">
			<a href="/LOVE" class="icon-home">홈</a>
			<a href="../square" class="icon-news">광장</a>
			<a href="cafe" class="icon-image">카페</a>
			<a href="bar" class="icon-upload">선술집</a>
			<a href="school" class="icon-star">학교</a>
			<a href="penthouse" class="icon-mail">옥탑방</a>
			<a href="military" class="icon-lock">군대</a>
			<a href="broarcast" class="icon-star">방송국</a>
			<a href="music" class="icon-mail">노래방</a>
			<a href="exile" class="icon-lock">유배지</a>
		</nav>
	</div><!-- /perspective -->
	<script src="../js/classie.js"></script>
	<script src="../js/menu.js"></script>
</body>

</html>
