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
	
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var num=0;
			var backgroundNum=backgroundRandom();
			switch ("${category}"){
				case "cafe":
					if(backgroundNum==1){
						num=imageRandom(12);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/cafe/white/cafe"+num+".jpg')");
					} else{
						num=imageRandom(5);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/cafe/black/cafe"+num+".jpg')");
					}		
					break;
				case "bar":
					if(backgroundNum==1){
						num=imageRandom(5);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/bar/white/bar"+num+".jpg')");
					} else{
						num=imageRandom(8);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/bar/black/bar"+num+".jpg')");
					}	
					break;
				case "school":
					if(backgroundNum==1){
						num=imageRandom(9);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/school/white/school"+num+".jpg')");
					} else{
						num=imageRandom(10);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/school/black/school"+num+".jpg')");
					}	
					break;
				case "penthouse":
					if(backgroundNum==1){
						num=imageRandom(8);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/penthouse/white/penthouse"+num+".jpg')");
					} else{
						num=imageRandom(2);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/penthouse/black/penthouse"+num+".jpg')");
					}	
					break;
				case "military":
					if(backgroundNum==1){
						num=imageRandom(11);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/military/white/military"+num+".jpg')");
					} else{
						num=imageRandom(6);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/military/black/military"+num+".jpg')");
					}	
					break;
				case "exile":
					if(backgroundNum==1){
						num=imageRandom(8);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/exile/white/exile"+num+".jpg')");
					} else{
						num=imageRandom(2);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/exile/black/exile"+num+".jpg')");
					}	
					break;
				case "music":
					if(backgroundNum==1){
						num=imageRandom(8);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/music/white/music"+num+".jpg')");
					} else{
						num=imageRandom(10);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/music/black/music"+num+".jpg')");
					}	
					break;
				case "broadcast":
					if(backgroundNum==1){
						num=imageRandom(7);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/broadcast/white/broadcast"+num+".jpg')");
					} else{
						num=imageRandom(5);
						$(".container").css("background-image", "url('${pageContext.request.contextPath}/resources/image/broadcast/black/broadcast"+num+".jpg')");
					}	
					break;
				}
		});
		//이미지 랜덤으로 뽑아주기
		function imageRandom(number){
			//랜덤함수, 1~number까지, 소수점 잘랐음.
			return Math.floor(Math.random()*number+1); 
		}
		//이미지 랜덤으로 뽑아주는데 어두운 배경이면 폰트 색깔 흰색, 밝은 배경이면 폰트 색깔 검정색으로 하기 위한 함수
		function backgroundRandom(){
			//랜덤함수, 1~number까지, 소수점 잘랐음.
			return Math.floor(Math.random()*2+1); 
		}
	</script>
	
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
	
	.reply-dummy {
		display:none;
	}
	.taglist{
		margin-bottom:14px;
	}
	
	#showMenu,
	.navbar-default .navbar-brand {
	 	color:#f05f40;
	}
	.well, .searchbtn, .searchform, .navbar-default {
		background-color: rgba(208, 204, 164, 0.51);
	}
	.search input[placeholder],  .search [placeholder], .search *[placeholder]{
		color:#34495e !important;
	}
	.searchbtn:hover{
		background-color: #48c9b0;
	}
	.taglist {
		width:100%;
		border:0;
	}
	.box {
		background-color: rgba(72, 201, 176, 0.51);
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
	var nicknames=[];
	
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
					
					nicknames.push(selectEl.text());
					
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
			var tmp = location.pathname.split('/');			//board pk 얻기
			console.log(nicknames);
			var datas = {
					member_pk:$('#member_pk').text(),
					board_pk: tmp[tmp.length-1],
					content: $('#reply .input').html(),
					nicknames:nicknames.toString()
			};
			$.post('../doReply',datas, function(data){	
				console.log(data);
				$('#reply .input').html(''); 	
				replyAppend(data);
			},'json');
			
		});
		
		
		var replyAppend = function(data) {
        var node = $('.reply-dummy').clone();
        $('.profile',node).attr('src', '/LOVE/upload/'+data.member.image);
        $('.nickname',node).append(data.member.nickname);
        $('.date',node).append(data.reply.create_date);
        $('.content',node).append(data.reply.content);
        $('.good .var',node).append(data.reply.good);
        $('.bad .var',node).append(data.reply.bad);
        node.removeClass('reply-dummy');
        $('#reply .reply-content').append(node);
    };
		
		
		
		$('#content .gb').click(function(){
			var tmp = location.pathname.split('/');
			var value = $(this).attr('value');
			var datas = {
					member_pk:$('#member_pk').text(),
					board_pk: tmp[tmp.length-1],
					status: $(this).attr('value'),
					category: 'board'
			}
			$.get('../gbCheck',datas,function(data){
				if(data === 'true'){
					alert('한번 이상 못누릅니다.');
				} else {
					gbUpdate(datas,value);
				}
			})
			
		});
		$('#reply .gb').click(function(){
			var tmp = location.pathname.split('/');
			var value = $(this).attr('value');
			var datas = {
					member_pk:$('#member_pk').text(),
					board_pk: tmp[tmp.length-1],
					status: $(this).attr('value'),
					category: 'reply'
			}
			$.get('../gbCheck',datas,function(data){
				console.log(data);
				if(data === 'true'){
					alert('한번 이상 못누릅니다.');
				} else {
					gbReply(datas,value);
				}
			})
		});
		function gbReply(datas, value){
			$.get('../gbUpdate',datas,function(data){
				if(value === 'good'){
					var cnt = $('#reply .good span').text();
					$('#reply .good span').text(cnt*1+1);
				}else if(value === 'bad'){
					var cnt = $('#reply .bad span').text();
					$('#reply .bad span').text(cnt*1+1);
				}
			});
		}
		function gbUpdate(datas, value){
			$.get('../gbUpdate',datas,function(data){
				if(value === 'good'){
					var cnt = $('#content .good span').text();
					$('#content .good span').text(cnt*1+1);
				}else if(value === 'bad'){
					var cnt = $('#content .bad span').text();
					$('#content .bad span').text(cnt*1+1);
					//유배지로 보내기 위한 수치  = 2
					if($('#content .bad span').text()*1 > 1){
						var tmp = location.pathname.split('/');
						$.get('../goExile',{board_pk:tmp[tmp.length-1]}, function(data){
							alert('이 글은 비공감이 많아 유배지로 보냅니다.');
							location.href='http://localhost:8088/LOVE/board/square';
						});
					}
				}
			});
		}
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
				      <form class="navbar-form navbar-left search" role="search">
				        <div class="form-group">
				          <input type="text" class="form-control searchform" placeholder="검색">
				        </div>
				        <button type="submit" class="btn btn-default fa fa-search searchbtn"></button>
				      </form>
				      <ul class="nav navbar-nav navbar-right">
				     		<li ><a id="pointCheck" href="/LOVE/board/write" >글쓰기</a></li>
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
							<div class="taglist">
								<c:forEach var="tag" items="${ tags }">
									<div class="btn btn-primary box">${tag }</div>
								</c:forEach>
							</div>
							<div class="desc well">${board.description }</div>
							<button class="btn btn-info gb good" value="good"><span>${board.good }</span>&nbsp&nbsp공감</button>
							<button class="btn btn-danger gb bad" value="bad"><span>${board.bad }</span>&nbsp&nbsp비공감</button>
						</article>	
							
						<div id="reply">		
						
							<div class="reply-content">
								<c:forEach var="item" items="${reply}">									
									<div class="well">									  
										<p><img class="profile" src="/LOVE/upload/${item.IMAGE }" alt="프사" />${item.NICKNAME } <span>${item.CREATE_DATE }</span></p>
										<div class="well content">${item.CONTENT }</div>
										<button class="btn btn-info gb good" value="good"><span>${item.GOOD }</span>&nbsp&nbsp공감</button>
										<button class="btn btn-danger gb bad" value="bad"><span>${item.BAD }</span>&nbsp&nbsp비공감</button>
									</div>
								</c:forEach>
							</div>
							
							
							<div class="well reply-dummy">									  
								<p>
									<img class="profile" src="/LOVE/upload/" alt="프사" />
									<span class="nickname"></span> 
									<span class="date"></span>
								</p>
								<div class="well content"></div>
								<button class="btn btn-info gb good" value="good"><span class="var"></span>&nbsp&nbsp공감</button>
								<button class="btn btn-danger gb bad" value="bad"><span class="var"></span>&nbsp&nbsp비공감</button>
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
			<a href="/LOVE" class="icon-home">홈</a>
			<a href="../sqaure" class="icon-news">광장</a>
			<a href="../list/cafe" class="icon-image">카페</a>
			<a href="../list/bar" class="icon-upload">선술집</a>
			<a href="../list/school" class="icon-star">학교</a>
			<a href="../list/penthouse" class="icon-mail">옥탑방</a>
			<a href="../list/military" class="icon-lock">군대</a>
			<a href="../list/broarcast" class="icon-star">방송국</a>
			<a href="../list/music" class="icon-mail">노래방</a>
			<a href="../list/exile" class="icon-lock">유배지</a>
		</nav>
	</div><!-- /perspective -->
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/menu.js"></script>
</body>

</html>
