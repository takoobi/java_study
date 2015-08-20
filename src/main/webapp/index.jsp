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

    <title>우글우글</title>

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
    <script src="${pageContext.request.contextPath}/resources/main/js/flat-ui.min.js"></script>


    <!-- Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.fittext.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/main/js/creative.js"></script>
  <script>
    
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
                			<a class="page-scroll" href="member/logout">로그아웃</a>
                		</li>
                	</c:if>                	
                    <li>
                        <a class="page-scroll" href="member/signupPage">회원가입</a>
                    </li>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">로그인</h4>
              </div>
              <div class="modal-body">               
                <div class="login-form  text-center">
                <form action="member/loginAction" method="post">
                  <div class="form-group">
                    <input type="text" class="form-control login-field" value="" placeholder="Enter your name" id="email" name="email" />
                    <label class="login-field-icon fui-user" for="login-name"></label>
                  </div>

                  <div class="form-group">
                    <input type="password" class="form-control login-field" value="" placeholder="Password" id="pw" name="pw" />
                    <label class="login-field-icon fui-lock" for="login-pass"></label>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" >링크 온</button>
                    <a class="login-link" href="#">암호가 기억 안나는겐가...</a>
                  </div>       
                  </form>                             
                </div>
              </div>
            </div>
          </div>
        </div>
        
    </header>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/cafe/cafe0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/bar/bar0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/school/school0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/square/square0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/penthouse/penthouse0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/military/military0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/exile/exile0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/music/music0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                    <a href="#" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/image/broadcast/broadcast0.jpg" class="img-responsive" alt="" style="height: 242px; width: 450px;">
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
                        <i class="fa fa-3x fa-pencil wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>일기</h3>
                        <p class="text-muted">당신의 일상을 기록하고 기억하세요.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-3x fa-bookmark wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>장소</h3>
                        <p class="text-muted">따글따글의 카테고리 구분은 장소입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">따글따글</h2>
                    <hr class="primary">
                    <p>-------------------------------------------------------------------------</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>010-5575-7928</p>
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
