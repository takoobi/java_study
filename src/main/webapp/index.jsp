<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>따글 - 따뜻한 글</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/flat-ui.css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/creative.css" type="text/css">  


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/main/js/flat-ui.min.js"></script> --%>


    <!-- Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.fittext.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/main/js/creative.js"></script>
    
<!-- JQuery -->
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#find").click(function(){
		alert("잠시만 기다려주세요.");
	    $.ajax({
			type:"post",
			url:"member/findAction",
			data:{
				"email" : $('#email_find').val(),
			},
			dataType:"json",
			success:function(data){
				if(data.result=='ok'){
					alert("입력하신 이메일 주소로 임시비밀 번호가 발송되었습니다.");
					window.open('http://www.'+ data.emailResult, 'child', 'width=1000, height=500', true);
					$(".css_test").css('display','none');
				}
				if(data.result=='no'){
					alert("아이디가 존재하지 않습니다.");
				}
			}
		});	
	});
	
	//로그인 ajax처리
	$("#buttonLogin").click(function(){
		login();
	});
	//로그인 시 엔터를 눌렀을 경우, 비밀번호를 입력한 뒤 비밀번호 input에 커서가 있어야 한다.
	$("#pw").keypress(function(event) {
	  if ( event.which == 13 ) {
	     login();
	  }
	});
});
//로그인 ajax
function login(){
	//이메일, 비밀번호 유효성 검사
	if($("#email").val()==''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if($("#pw").val()==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	//ajax 처리
    $.ajax({
		type:"post",
		url:"member/loginAction",
		data:{
			"email" : $('#email').val(),
			"pw":$("#pw").val()
		},
		dataType:"json",
		success:function(data){
			if(data.result=='ok'){
				location.href="board/square";
			}
			if(data.result=='noId'){
				alert("아이디가 존재하지 않습니다.");
			}
			if(data.result=='noPw'){
				$("#pw").val("");
				alert("비밀번호가 틀립니다.");	
			}
		}
	});				
}
//로그인창에서 x를 눌렀을 때 이메일, 비밀번호값 초기화시켜주기
function spanCancle(){
	$("#email").val("");
	$("#pw").val("");
}
</script>	
<style>
    .modal-content {
      background-color: #edeff1;
      margin-top: 100px;
    }
    #myModalLabel {
      color: #675f5f;
    }
    h2 {
      font-size: 30px;
    }
    h3 {
      font-size: 25px;
    }
    .css_test {
         border-radius : 5px;
         border : 5px solid gray;
         box-shadow : 0 0 5px silver;
         padding : 20px;
         color: black;
         display: none;
         font-size: 10pt;
     }
  </style>
</head>
<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- <a class="navbar-brand page-scroll" href="#page-top">Start Bootstrap</a> -->
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="${!empty sessionScope.email}">
                		<li>
                			<a class="page-scroll">ID = ${sessionScope.email}</a>
                		</li>
                		<li>
                			<a class="page-scroll" href="member/modify">회원정보수정</a>
                		</li>
                		<li>
                			<a class="page-scroll" href="member/logout">로그아웃</a>
                		</li>
                	</c:if>
                	<c:if test="${empty sessionScope.email}">
	                	<li>
	                        <a class="page-scroll" href="member/signupPage">회원가입</a>
	                    </li>
                	</c:if>                	
<!--                     <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>가슴이 시켜 머물다.</h1>
                <hr>
                <p>공감할 수 있는 공간이 있는 곳.</p>
                <!-- Button trigger modal -->
                <c:if test="${empty sessionScope.email}">
	                <button type="button" class="btn btn-primary btn-xl page-scroll login-action" data-toggle="modal" data-target="#myModal">
	                  로그인
	                </button>                    
                </c:if>
            </div>            
        </div>
        

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
          <div class="modal-dialog">
            <div class="modal-content col-lg-8 col-lg-offset-2">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" onclick="spanCancle()">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">로그인</h4>
              </div>
              <div class="modal-body">               
                <div class="login-form  text-center">
                  <div class="form-group">
                    <input type="text" class="form-control login-field" value="" placeholder="Enter your name" id="email" name="email" />
                    <label class="login-field-icon fui-user" for="login-name"></label>
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control login-field" value="" placeholder="Password" id="pw" name="pw" />
                    <label class="login-field-icon fui-lock" for="login-pass"></label>
                  </div>              
                  <div class="modal-footer">           
                  	<button class="btn btn-primary btn-lg btn-block" id="buttonLogin">링크 온</button>       
                    <a class="login-link" href="#" onclick="$('.css_test').toggle()">암호가 기억 안나는겐가...</a>
                    <br>
                    <div class="css_test" align="center">
	                   	가입하신 이메일을 제대로 입력하셔야 찾을 수 있습니다.<br><br>
	                   	<input type="text" placeholder="아이디(email)" id="email_find" name="email_find"><br><br>
	                   	<input type="button" value="찾기" id="find">
 					</div>
                  </div>   
                </div>
              </div>
            </div>
          </div>
        </div>
        
    </header>
	<br><br>
    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/cafe" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/cafe/cafe0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    카페
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/bar" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/bar/bar0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    선술집
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/school" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/school/school0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    학교
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/square" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/square/square0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    광장
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/penthouse" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/penthouse/penthouse0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    옥탑방
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/military" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/military/military0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    군대
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/exile" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/exile/exile0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    유배지
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/music" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/music/music0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    노래방
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="board/list/broadcast" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/broadcast/broadcast0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;border-radius:20px;">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-name">
                                    방송국
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    
    <section id="services">
<!--         <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">서비스</h2>
                    <hr class="primary">
                </div>
            </div>
        </div> -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-3x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>공감</h3>
                        <p class="text-muted">그들의 사연을 공감하세요</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-3x fa-share-alt wow bounceIn text-primary"></i>
                        <h3>공유</h3>
                        <p class="text-muted">마음이 움직이는 이야기를 공유해보세요.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-3x fa-smile-o wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>재미</h3>
                        <p class="text-muted">즐기세요. 이곳은 당신을 위한 공간입니다.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-3x fa-bookmark wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>장소</h3>
                        <p class="text-muted">따글의 카테고리 구분은 장소입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">따글 - 따뜻한 글</h2>
                    <hr class="primary">
                    <p>-------------------------------------------------------------------------</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>
                    	방유석 010-4967-1129<br>
                    	권 현 010-8081-1181<br>
                    	이정민 010-4513-6730<br>
                    	김군호 010-5575-7928
                    </p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">sbv200@hanmail.net</a></p>
                </div>
            </div>
        </div>
    </section>  
</body>
</html>