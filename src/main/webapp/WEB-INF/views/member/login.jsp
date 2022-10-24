<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="/css/common.css" />
 <link rel="stylesheet" href="/css/member/login.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>

</head>

    <div class="wrap">
       <h1>로그인</h1>
		
		
		<section class="login-input-section-wrap">
			<form action="loginAction" id="loginForm" method="post">
				<div class="login-input-wrap">	
					<input class="box1" placeholder="아이디" type="text" name="users_id"></input>
				</div>
				<div class="login-input-wrap password-wrap">	
					<input class="box1" placeholder="비밀번호" type="password" name="users_pw"></input>
				</div>
	            
				<span class="button">
	                <input class="box2" type="button" onclick="loginCheck()" value="로그인">
	            </span>
            </form>
			<div class="log_check">
                <span><input class="box3" type="checkbox" id="saveId">아이디저장</span>
                
                <span><input type="checkbox" id="autoLogin" name="autoLogin">&nbsp;자동로그인</span>
            </div>
			<div class="footer-1">
            <p>
			    <a href="/member/idFind" class="box4">아이디.비밀번호 찾기</a>
                <a href="/member/join2" class="box5">회원가입</a>
            </p>
		</div>
		</section>
		
		
	</div>
	
	<script>
	$(function(){
	  var id = getCookie("Cookie_id");
	  var pw = getCookie("Cookie_pw");

	  if(id){
		$("input[name=users_id]").val(id);
		$("#saveId").attr("checked", true);
	  }
	});

	$(window).on("keyup",function(key){
		if(key.keyCode==13){ 
			loginCheck(); 
		} 
	});

	function loginCheck(){
	  var id = $("input[name=users_id]").val();
	  var pw = $("input[name=users_pw]").val();
	  var idChk = $("#saveId").is(":checked");

	  if(id == ""){			
		alert("아이디를 입력해주세요.");	
		$("input[name=users_id]").focus();		
		return false;		
	  }else if(pw ==""){
		alert("비밀번호를 입력해주세요.");
		$("input[name=users_pw]").focus();
		return false;
	  }else if(idChk){			
		setCookie("Cookie_id", id, 7);	
		// setCookie("Cookie_pw", pw, 7);
	  }else{				
		deleteCookie("Cookie_id");	
		// deleteCookie("Cookie_pw");
	  }
	  if($('#autoLogin').is(':checked')) {
		$(this).val('autoLogin');
	  }
	  $("#loginForm").submit();				
	};


	function setCookie(cookieName, value, exdays){
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + exdays);
	  var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	  document.cookie = cookieName + "=" + cookieValue;
	}
		 
         
	function getCookie(cookieName) {
	  cookieName = cookieName + '=';
	  var cookieData = document.cookie;
	  var start = cookieData.indexOf(cookieName);
	  var cookieValue = '';
	  
	  if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
	  if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	  }
	  return unescape(cookieValue);
	}
	
	
	function deleteCookie(cookieName){
	  var expireDate = new Date();
	  expireDate.setDate(expireDate.getDate() - 1);
	  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
</script>


