<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/flat-ui.js"></script>
	
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
	.post-dummy, .outer-nav{
		display: none;
	}
	
	.effect-moveleft{
		background-image: url('img/wallpaper.jpg');
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
	}
	.container {
		width: 100%;
	}
	.wrapper {
		width: 80%;
		margin: 0 auto;
		
	}
	.effect-moveleft .outer-nav a  {
		font-size: 30px;
		color: #f05f40;
	}
	.outer-nav {
		z-index: 100;
	}
	</style>

    
  <script>
  $(function(){
		var data =[];
		var nowpage;
		
		getList();		
		$('#showMenu').click(function(){
			$('.outer-nav').show();
		});
	    $(".box").click(function(){    	
	        if($(this).hasClass("select")){
	            $(this).removeClass("select");
	        } else{
	            $(this).addClass("select");
	        }
	    	
	        $(".box").each(function(){
	        	if($(this).is(".select")){
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
            var node = $('.post-dummy').clone();
            $('.title',node).append(data.title);
            node.attr('href', '../detail/' + data.pk)
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
	});
  
  
  </script>
</head>

<body>
		  
	<div id="perspective" class="perspective effect-moveleft">
		<div class="container">
			<div class="wrapper"><!-- wrapper needed for scroll -->
				<!-- Top Navigation -->				
				<header class="navbar">
					<a href="#" class="fa fa-car fa-2x" id="showMenu">
						<span>다른 장소로</span>
					</a>
					<a href="/LOVE/board/write" class="btn">글쓰기</a>
					<div class="box" >고민</div>
					<div class="box" >남자</div>
					<div class="box" >여자</div>
					<div class="box" >꿀잼</div>
					<div class="box" >직장인</div>
					
					<h1>${taglist}</h1>
				</header>
				
				<div class="row" id="list">
					
				</div>
				<a class="col-md-3 post-dummy" href="#">
					<div class="post" >
						<h2 class="title"></h2>
					</div>
				</a>				
					
				<div id="loadmoreajaxloader" style="display:none;"><center><img src="../img/ajax-loader.gif" /></center></div>
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
	<script src="../js/classie.js"></script>
	<script src="../js/menu.js"></script>
</body>

</html>
