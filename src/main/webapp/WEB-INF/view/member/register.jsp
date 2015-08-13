<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>회원가입</title>
		<meta name="description" content="Fullscreen Form Interface: A distraction-free form concept with fancy animations" />
		<meta name="keywords" content="fullscreen form, css animations, distraction-free, web design" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<link rel="stylesheet" type="text/css" href="css/cs-select.css" />
		<link rel="stylesheet" type="text/css" href="css/cs-skin-boxes.css" />
		<script src="js/modernizr.custom.js"></script>
		<style>
			h1 {
				color: #f05f40;
			}
		</style>
	</head>
	<body>
		<div class="container">

			<div class="fs-form-wrap" id="fs-form-wrap">
				<div class="fs-title">
					<h1>오늘 참 좋은 당신을 만났습니다.</h1>
					<div class="codrops-top">
						<a class="codrops-icon codrops-icon-prev back-btn" href="/"><span>뒤로가기</span></a>
						<!--<a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=19520"><span>Back to the Codrops Article</span></a>-->
						<!--<a class="codrops-icon codrops-icon-info" href="#"><span>This is a demo for a fullscreen form</span></a>-->
					</div>
				</div>
				<form id="myform" class="fs-form fs-form-full" autocomplete="off" action="test.html">
					<ol class="fs-fields">
						<li>
							<label class="fs-field-label fs-anim-upper" for="q1">닉네임을 적어주세요.</label>
							<input class="fs-anim-lower" id="q1" name="q1" type="text" placeholder="또 다른 자신입니다." required />
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="q2" data-info="We won't send you spam, we promise...">이메일 주소를 적어주세요.</label>
							<input class="fs-anim-lower" id="q2" name="q2" type="email" required autofocus/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="q5" data-info="We won't send you spam, we promise...">비밀번호를 입력하세요.</label>
							<input class="fs-anim-lower" id="q5" name="q5" type="password" required autofocus/>
						</li>
						<!--<li data-input-trigger>-->
							<!--<label class="fs-field-label fs-anim-upper" for="q3" data-info="This will help us know what kind of service you need">이야기를 나눌 때 선호하는 장소는 어디인가요?</label>-->
							<!--<div class="fs-radio-group fs-radio-custom clearfix fs-anim-lower">-->
								<!--<span><input id="q3b" name="q3" type="radio" value="conversion"/><label for="q3b" class="radio-conversion">선술집</label></span>-->
								<!--<span><input id="q3c" name="q3" type="radio" value="social"/><label for="q3c" class="radio-social">카페</label></span>-->
								<!--<span><input id="q3a" name="q3" type="radio" value="mobile"/><label for="q3a" class="radio-mobile">학교</label></span>-->
							<!--</div>-->
						<!--</li>-->
						<li>
							<label class="fs-field-label fs-anim-upper" for="q4">자기 소개를 해주세요.</label>
							<textarea class="fs-anim-lower" id="q4" name="q4" placeholder="Describe here" autofocus></textarea>
						</li>
					</ol><!-- /fs-fields -->
					<button class="fs-submit" type="submit">가입하기</button>
				</form><!-- /fs-form -->
			</div><!-- /fs-form-wrap -->


		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/selectFx.js"></script>
		<script src="js/fullscreenForm.js"></script>
		<script>
			(function() {
				var formWrap = document.getElementById( 'fs-form-wrap' );

				[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {	
					new SelectFx( el, {
						stickyPlaceholder: false,
						onChange: function(val){
							document.querySelector('span.cs-placeholder').style.backgroundColor = val;
						}
					});
				} );

				new FForm( formWrap, {
					onReview : function() {
						classie.add( document.body, 'overview' ); // for demo purposes only
					}
				} );
			})();
		</script>
	</body>
</html>