<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/header.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<div class="headerTop">			
			<a href="/">
			<img src="../img/product/한우로고.png">
			</a>
			
			<div class="menu">
				<span>
					<a href="/mypage/mypage_main">
						<i class="fa-solid fa-user"></i>
					</a>
					<div class="dropMenu">
						<a href="/mypage/mypage_main">마이페이지</a>
					
						<%
						String users_id = (String)session.getAttribute("users_id");
						//null체크
						if( users_id != null) 
						{   //로그인 상태
						%>
							<a href="/member/logoutAction">로그아웃</a>
						<%		
						}
						else
						{  //로그아웃 상태
						%>
							<a href="/member/login">로그인</a>
						<%
						}
						
						
						%>									
					</div>
				</span>	
				<span>
					<a href="/mypage/mypage_cart">
						<i class="fa-solid fa-cart-shopping"></i>
					</a>
				</span>
				<span>
					<a href="/product/search_result">
						<i class="fa-solid fa-magnifying-glass"></i>
					</a>
				</span>
				<span>
					<a href="/Notice/notice">
					고객센터
					</a>
					<div class="dropMenu">
						<a href="/Notice/notice">공지사항</a>
						<a href="/Notice/faq">자주하는 질문</a>
						<a href="/customer/customer01">1:1 문의</a>
					</div>
				</span>
			</div>
		</div>    
		<div class="category">

				<a href="/product/product01">선물세트</a>

				<a href="/product/product01">구이용</a>

				<a href="/product/product01">국거리</a>

				<a href="/product/product01">조리용</a>
		</div>
	</div>