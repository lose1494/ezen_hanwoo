<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="/css/member/login.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
		  $('#header').load("/header.html");
		  $('#footer').load("/footer.html");
		});
	  </script>
</head>

<body>
	<div id="header"></div>
    <div class="header-top">
       <h1>로그인</h1>
		

		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input class="box1" placeholder="아이디" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input class="box1" placeholder="비밀번호" type="password"></input>
			</div>
            
			<span class="button">
                <input class="box2" type="submit" value="로그인">
            </span>
			<div class="log_check">
                <span><input class="box3"type="checkbox">아이디저장</span>
                
                <span><input type="checkbox">&nbsp;자동로그인</span>
            </div>
			<div class="footer-1">
            <p>
			    <a class="box4">아이디.비밀번호 찾기</a>
                <a class="box5">회원가입</a>
            </p>
		</div>
		</section>
		
		
	</div>

