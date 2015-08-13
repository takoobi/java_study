<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/intro/css/bootstrap.min.css" type="text/css">
    <link href="resources/intro/css/flat-ui.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/flat-ui.min.js"></script>

    
  <script>
  $(function(){
		var data =[];

	    $(".box").click(function(){    	
	        if($(this).hasClass("select")){
	            $(this).removeClass("select");
	        } else{
	            $(this).addClass("select");
	        }
	    	
	        $(".box").each(function(){
	        	if($(this).is(".select")){
	        		data.push($(this).attr("value"));
	        	}
	        });
	        $.post("doList", { tags : data.toString()}, function(data){        	
	        	console.log("success");
	        	console.log(data);
	        });
	        data=[];
	    });       
		    
	});
  </script>
  <style>
  	#tags {
		height: 100px;
		border: 1px solid red;
	}
	
	#list {
		border: 1px solid black;		
	}
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
                <a class="navbar-brand page-scroll" href="#page-top">Start Bootstrap</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="../FullscreenForm/index.html">회원가입</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	<h1>카페 게시판 리스트</h1>
	<div id="tags">
		<div class="box" value="worry">고민</div>
		<div class="box" value="man">남자</div>
		<div class="box" value="woman">여자</div>
		<div class="box" value="fun">꿀잼</div>
		<div class="box" value="emp">직장인</div>
	</div>
	<div id="list">
		
	</div>

</body>

</html>
