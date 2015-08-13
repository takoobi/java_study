<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카페 - 소통의 공간</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/flat-ui.css" />
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.3.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="css/style2.css" />
	
	<link rel="stylesheet" type="text/css" href="css/menu-component.css" />
	
	<script src="js/jquery.js"></script>
	<!-- csstransforms3d-shiv-cssclasses-prefixed-teststyles-testprop-testallprops-prefixes-domprefixes-load --> 
	<script src="js/modernizr.custom.25376.js"></script>
	<style>
		#theSidebar {
			display: none;
		}
		#showMenu > span {
			font-size: 16px;
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
</head>

<body>
	<div id="perspective" class="perspective effect-rotateleft">
		<nav class="outer-nav right vertical">
			<a href="#" class="icon-home">Home</a>
			<a href="#" class="icon-news">광장</a>
			<a href="#" class="icon-image">Images</a>
			<a href="#" class="icon-upload">Uploads</a>
			<a href="#" class="icon-star">Favorites</a>
			<a href="#" class="icon-mail">Messages</a>
			<a href="#" class="icon-lock">Security</a>
		</nav>
		<div class="container">
			<div class="wrapper"><!-- wrapper needed for scroll -->
			
				<button id="menu-toggle" class="menu-toggle"><span>Menu</span></button>
				
				<div id="theSidebar" class="sidebar">
					<button class="close-button fa fa-fw fa-close"></button>
					
				</div>
				<div id="theGrid" class="main">
					<section class="grid">
						<header class="top-bar">
							<a href="#" class="fa fa-car fa-2x" id="showMenu">
								<span>다른 장소로</span>
							</a>
							<div class="box" value="worry">고민</div>
							<div class="box" value="man">남자</div>
							<div class="box" value="woman">여자</div>
							<div class="box" value="fun">꿀잼</div>
							<div class="box" value="emp">직장인</div>
							<div class="filter">
								<span>Filter by:</span>
								<span class="dropdown">Popular</span>
							</div>
						</header>
						<a class="grid__item" href="#">
							<h2 class="title title--preview">Hope for Amy Walters</h2>
							<div class="loader"></div>
							<span class="category">Life &amp; Death</span>
							<div class="meta meta--preview">
								<img class="meta__avatar" src="img/authors/4.png" alt="author04" /> 
								<span class="meta__date"><i class="fa fa-calendar-o"></i> 6 Apr</span>
								<span class="meta__reading-time"><i class="fa fa-clock-o"></i> 2 min read</span>
							</div>
						</a>
						<footer class="page-meta">
							<span>Load more...</span>
						</footer>
					</section>
					<section class="content">
						<div class="scroll-wrap">							
							<article class="content__item">
								<span class="category category--full">Society</span>
								<h2 class="title title--full">The Hunger of a Teenager</h2>
								<div class="meta meta--full">
									<img class="meta__avatar" src="img/authors/3.png" alt="author03" />
									<span class="meta__author">Carol Freeman</span>
									<span class="meta__date"><i class="fa fa-calendar-o"></i> 6 Apr</span>
									<span class="meta__reading-time"><i class="fa fa-clock-o"></i> 2 min read</span>
									<span class="meta__misc meta__misc--seperator"><i class="fa fa-comments-o"></i> 39 comments</span>
									<span class="meta__misc"><i class="fa fa-heart"></i> 328 favorites</span>
									<nav class="article-nav">
										<button><i class="fa fa-angle-left"></i> <span>Previous</span></button>
										<button><span>Next</span> <i class="fa fa-angle-right"></i></button>
									</nav>
								</div>
								<p>Conscience is the inner perception of objections to definite wish impulses that exist in us; but the emphasis is put upon the fact that this rejection does not have to depend on anything else, that it is sure of itself. </p>
								<p>This becomes even plainer in the case of a guilty conscience, where we become aware of the inner condemnation of such acts which realized some of our definite wish impulses. Confirmation seems superfluous here; whoever has a conscience must feel in himself the justification of the condemnation, and the reproach for the accomplished action. But this same character is evinced by the attitude of savages towards taboo. Taboo is a command of conscience, the violation of which causes a terrible sense of guilt which is as self-evident as its origin is unknown[89].</p>
								<p>It is therefore probable that conscience also originates on the basis of an ambivalent feeling from quite definite human relations which contain this ambivalence.</p>
								<p>It probably originates under conditions which are in force both for taboo and the compulsion neurosis, that is, one component of the two contrasting feelings is unconscious and is kept repressed by the compulsive domination of the other component. This is confirmed by many things which we have learned from our analysis of neurosis. In the first place the character of compulsion neurotics shows a predominant trait of painful conscientiousness which is a symptom of reaction against the temptation which lurks in the unconscious, and which develops into the highest degrees of guilty conscience as their illness grows worse. Indeed, one may venture the assertion that if the origin of guilty conscience could not be discovered through compulsion neurotic patients, there would be no prospect of ever discovering it. This task is successfully solved in the case of the individual neurotic, and we are confident of finding a similar solution in the case of races. </p>
								<p>If I judge my readers’ impressions correctly, I dare say that after hearing all that was said about taboo they are far from knowing what to understand by it and where to store it in their minds. This is surely due to the insufficient information I have given and to the omission of all discussions concerning the relation of taboo to superstition, to belief in the soul, and to religion. On the other hand I fear that a more detailed description of what is known about taboo would be still more confusing; I can therefore assure the reader that the state of affairs is really far from clear. We may say, however, that we deal with a series of restrictions which these primitive races impose upon themselves; this and that is forbidden without any apparent reason; nor does it occur to them to question this matter, for they subject themselves to these restrictions as a matter of course and are convinced that any transgression will be punished automatically in the most severe manner. There are reliable reports that innocent transgressions of such prohibitions have actually been punished automatically. For instance, the innocent offender who had eaten from a forbidden animal became deeply depressed, expected his death and then actually died. The prohibitions mostly concern matters which are capable of enjoyment such as freedom of movement and unrestrained intercourse; in some cases they appear very ingenious, evidently representing abstinences and renunciations; in other cases their content is quite incomprehensible, they seem to concern themselves with trifles and give the impression of ceremonials. Something like a theory seems to underlie all these prohibitions, it seems as if these prohibitions are necessary because some persons and objects possess a dangerous power which is transmitted by contact with the object so charged, almost like a contagion. The quantity of this dangerous property is also taken into consideration. Some persons or things have more of it than others and the danger is precisely in accordance with the charge. The most peculiar part of it is that any one who has violated such a prohibition assumes the nature of the forbidden object as if he had absorbed the whole dangerous charge. This power is inherent in all persons who are more or less prominent, such as kings, priests and the newly born, in all exceptional physical states such as menstruation, puberty and birth, in everything sinister like illness and death and in everything connected with these conditions by virtue of contagion or dissemination.</p>
								<p>First of all it must be said that it is useless to question savages as to the real motivation of their prohibitions or as to the genesis of taboo. According to our assumption they must be incapable of telling us anything about it since this motivation is ‘unconscious’ to them. But following the model of the compulsive prohibition we shall construct the history of taboo as follows: Taboos are very ancient prohibitions which at one time were forced upon a generation of primitive people from without, that is, they probably were forcibly impressed upon them by an earlier generation. These prohibitions concerned actions for which there existed a strong desire. The prohibitions maintained themselves from generation to generation, perhaps only as the result of a tradition set up by paternal and social authority. But in later generations they have perhaps already become ‘organized’ as a piece of inherited psychic property. Whether there are such ‘innate ideas’ or whether these have brought about the fixation of the taboo by themselves or by co-operating with education no one could decide in the particular case in question. The persistence of taboo teaches, however, one thing, namely, that the original pleasure to do the forbidden still continues among taboo races. They therefore assume an _ambivalent attitude_ toward their taboo prohibitions; in their unconscious they would like nothing better than to transgress them but they are also afraid to do it; they are afraid just because they would like to transgress, and the fear is stronger than the pleasure. But in every individual of the race the desire for it is unconscious, just as in the neurotic.</p> <p>It seems like an obvious contradiction that persons of such perfection of power should themselves require the greatest care to guard them against threatening dangers, but this is not the only contradiction revealed in the treatment of royal persons on the part of savages. These races consider it necessary to watch over their kings to see that they use their powers in the right way; they are by no means sure of their good intentions or of their conscientiousness. A strain of mistrust is mingled with the motivation of the taboo rules for the king. “The idea that early kingdoms are despotisms”, says Frazer[59], “in which the people exist only for the sovereign, is wholly inapplicable to the monarchies we are considering. On the contrary, the sovereign in them exists only for his subjects: his life is only valuable so long as he discharges the duties of his position by ordering the course of nature for his people’s benefit. So soon as he fails to do so, the care, the devotion, the religious homage which they had hitherto lavished on him cease and are changed into hatred and contempt; he is ignominiously dismissed and may be thankful if he escapes with his life. Worshipped as a god one day, he is killed as a criminal the next. But in this changed behaviour of the people there is nothing capricious or inconsistent. On the contrary, their conduct is quite consistent. If their king is their god he is or should be, also their preserver; and if he will not preserve them he must make room for another who will. So long, however, as he answers their expectations, there is no limit to the care which they take of him, and which they compel him to take of himself. A king of this sort lives hedged in by ceremonious etiquette, a network of prohibitions and observances, of which the intention is not to contribute to his dignity, much less to his comfort, but to restrain him from conduct which, by disturbing the harmony of nature, might involve himself, his people, and the universe in one common catastrophe. Far from adding to his comfort, these observances, by trammelling his every act, annihilate his freedom and often render the very life, which it is their object to preserve, a burden and sorrow to him.”</p>
								<p>Excerpts from <a href="http://www.gutenberg.org/ebooks/41214">Totem and Taboo</a> by Sigmund Freud.</p>
							</article>
							
						</div>
						<button class="close-button"><i class="fa fa-close"></i><span>Close</span></button>
					</section>
				</div>
			</div><!-- wrapper -->
		</div><!-- /container -->
		</div>
		
		<script src="js/classie.js"></script>
		<script src="js/main.js"></script>
		<script src="js/menu.js"></script>

	

</body>

</html>
