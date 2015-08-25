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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css" />	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu-component.css" />
	
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="${pageContext.request.contextPath}/js/modernizr.custom.25376.js"></script>
	<script src="${pageContext.request.contextPath}/js/flat-ui.js"></script>
	
	<style>
		#showMenu > span {
			font-size: 16px;
		}	
	
	.effect-moveleft{
		background-image: url('${pageContext.request.contextPath}/img/wallpaper.jpg');
		background-size: cover;
		background-attachment: fixed;

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
	section {
		color: black;
	}
	
	#input {
		height: 200px;
	}
	.editor-link {
		background-color: #16a085;
		color: snow;
	}
	
	#showMenu {
		font-size: 25px;
	}
	nav {
		margin-top:10px;
	}
	#reply .input, #reply .content {
		margin-bottom: 7px;
	}
	#reply{
		margin-bottom:20px;
	}
	#member_pk {
		display: none;
	}
	#reply .profile {
		width:50px;
		height:50px;
		border-radius: 50px;
		margin-right:10px;
	}
	</style>
    <script>    
    
    
    /* (function () {
	$('#reply').each(function(){
	    this.contentEditable = true;
	});
    $("#reply").keypress(function (key) {
    	var content;
        if (key.keyCode == 64) { //64 = '@' 입력시 닉네임 검색
        	content = $(this).html();
        	console.log(content);
       		$(this).keyup(function(key){
       			var tmp = $(this).text().split('@'); //'@' 를 기준으로 앞의 문자열 제거 
       			var nickname = tmp[tmp.length-1];
       			$.get('/LOVE/member/nicknameSearch',{nickname:nickname}, function(data){
       				$('#nicknameSearch').html('');
   					$.each(data, function(index, item){
							$('#nicknameSearch').append('<span class="nickname">'+item+'</span>');
		                });
       			}, 'json');
       			
       		});             
        } else if (key.keyCode == 13){
        	
        	$(this).unbind('keyup');
        }
    }); 
    

}); */
    
    
    'use strict';
	var datas;
	
	$(function(){
		var TRIGGER = '@'
			,QUERY = ''
			,SEARCH = false
			,SELECT_POS = 0
			,EDITOR = $('#input')
			,LIST = $('#list')
		;
		LIST.css({
			'position': 'absolute',
			'width': EDITOR.width(),
			'max-height': 300,
			// 'overflow': 'scroll',
			'top': EDITOR.position().top + EDITOR.height() + 2,
			'left': EDITOR.position().left
		});
		
		// 단어 검색
		function getWords(query) {
			$.get('/LOVE/member/nicknameSearch',{nickname:query}, function(data){
				datas=data;
   			}, 'json');
			return datas; 
			 //return datas.filter(searchWordFromArray(query));
		}

		// 커서를 마지막으로 이동
		// From: http://stackoverflow.com/questions/1125292/how-to-move-cursor-to-end-of-contenteditable-entity/3866442#3866442
		function setEndOfContenteditable(contentEditableElement)
		{
		    var range,selection;
		    if(document.createRange)//Firefox, Chrome, Opera, Safari, IE 9+
		    {
		        range = document.createRange();//Create a range (a range is a like the selection but invisible)
		        range.selectNodeContents(contentEditableElement);//Select the entire contents of the element with the range
		        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
		        selection = window.getSelection();//get the selection object (allows you to change selection)
		        selection.removeAllRanges();//remove any selections already made
		        selection.addRange(range);//make the range you have just created the visible selection
		    }
		    else if(document.selection)//IE 8 and lower
		    { 
		        range = document.body.createTextRange();//Create a range (a range is a like the selection but invisible)
		        range.moveToElementText(contentEditableElement);//Select the entire contents of the element with the range
		        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
		        range.select();//Select the range (make it the visible selection
		    }
		}

		function initList() {
			LIST.empty();
			LIST.addClass('hide');
			SELECT_POS = 0;
			SEARCH = false;
		}
		
		EDITOR.keypress(function(e){
			if(e.which == 13) {
				if(SEARCH) {
					var selectEl = $('a:eq('+SELECT_POS+')', LIST),
						html = '<a class="editor-link" contenteditable="false" href="#">' + selectEl.text() + '</a> ';
					initList();
					EDITOR.html(EDITOR.html().replace(TRIGGER + QUERY, html));
					setEndOfContenteditable(EDITOR.get(0));
					return false;
					// EDITOR.click();
				}
				
			}
		});
		
		EDITOR.keyup(function(e){
			// console.log(e.which);
			var text = EDITOR.text(), trigger_pos = text.lastIndexOf(TRIGGER);
			if(trigger_pos > -1) {
				var trigger_end = text.indexOf(' ', trigger_pos),
					trigger_end = (trigger_end == -1) ? text.length : trigger_end,
					words = [];
				QUERY = text.substring(trigger_pos + 1, trigger_end).trim();

				if(QUERY != '') words = getWords(QUERY);
				console.log(words);
				if(words.length > 0) {
					SEARCH = true;
					LIST.empty();
					var html = ''
					$.each(words, function(i,word) {
						html += '<a class="list-group-item" href="#">' + word + '</a>';
					});
					LIST.html(html);
					LIST.removeClass('hide');

					if(e.which == 38) { // up
						if(SELECT_POS > 0) SELECT_POS--;
					} else if (e.which == 40) { // down
						if(SELECT_POS < words.length - 1) SELECT_POS++;
					} else if (e.which == 13) { // enter
						
						return false;
					}

					$('a', LIST).removeClass('active');
					$('a:eq(' + SELECT_POS + ')', LIST).addClass('active');

				} else {
					initList();
				}
			} else {
				initList();
			}
			
		});
		
		$('#reply .submit').click(function(){
			var tmp = location.pathname.split('/');			
			var datas = {
					member_pk:$('#member_pk').text(),
					board_pk: tmp[tmp.length-1],
					content: $('#reply .input').html() 
			};
			$.post('../doReply',datas, function(data){
				console.log(data);
				$('#reply .input').html(''); 
				
			},'json'); 
			/* $.ajax({
				type: "POST",
				url: "doReply",
				dataType: "json",
				data: JSON.stringify(datas),
				contentType: "application/json; charset=UTF-8",
				success: function(data){
					console.log(data);
				}
			}) */
		});
	});

    </script>
</head>

<body>
		  
	<div id="perspective" class="perspective effect-moveleft">
		<div class="container">
			<div class="wrapper"><!-- wrapper needed for scroll -->
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
				          <input type="text" class="form-control" placeholder="Search">
				        </div>
				        <button type="submit" class="btn btn-default fa fa-search"></button>
				      </form>
				      <ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				        	<span id="member_pk">${ sessionScope.member_pk }</span>
				          <a href="#" class="dropdown-toggle" id="nickname" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.nickname} <span class="caret"></span></a>
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
				<div class="row">
					<div class="col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
					
						<article id="content" class="well">
							<h1>${ board.title }</h1>
							<div>${board.description }</div>
						</article>	
							
						<div id="reply">		
						
							<div class="reply-content">
								<c:forEach var="item" items="${reply}">									
									<div class="well">
									  
										<p><img class="profile" src="/LOVE/upload/${item.IMAGE }" alt="프사" />${item.NICKNAME } <span>${item.CREATE_DATE }</span></p>
										<div class="well content">${item.CONTENT }</div>
									</div>
								</c:forEach>
							</div>
							
							
							<div class="well">
								<p>댓글달기</p>		
								<div class="input well" contenteditable="true" id="input"></div>	
							</div>		
							
							<button class="btn btn-primary submit">글쓰기</button>											
								
							<div id="list" class="panel panel-default hide">
								<div class="list-group"></div>
							</div>							
						</div>	
					</div>	
				</div>					
													
					
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
