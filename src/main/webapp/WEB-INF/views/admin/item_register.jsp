<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/item_register.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품관리>상품 정보 등록</p>
	</div>
</div> 

<div class="main_div">

	<div class="admin_list">
	<p>관리자 페이지 </p>
		<ul> 
			<li><a href="/admin/admin_main">회원목록 조회</a></li>
			<li><a href="/admin/admin_item">상품 관리</a></li>
			<li><a href="/admin/admin_order">주문 관리</a></li>
			<li><a href="/admin/admin_review">리뷰 관리</a></li>
			<li><a href="/admin/admin_inquiry">상품문의 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_faq">자주하는 질문</a></li>		
			<li><a href="/admin/admin_one2one">1:1문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
	
<form action="/write_Action" method="post" name="writeForm">
	 <table class="member_table" >
	 <tr>
	 	<th>카테고리</th>
	 	<th>상품명</th>
	 	<th>상품가격</th>
	 </tr>
	 
	 <tr>
	 	<td> <select style="width:110px; height:40px; text-align: center;">
	 		<option>선물세트</option>
	 		<option>구이용</option>
	 		<option>국거리</option>
	 		<option>조리용</option>
	 		 </select> </td>
	 	<td> <input type="text" style="width:250px; height:40px;"> 
	 	 </td>
	 	<td> <input type="text" style="width:250px; height:40px;"> </td>
	 </tr>
	 
	 <tr>
	 	<td></td>
	 
	 
	 </tr>
	 
	 
	 
	 
	  </table>
	  </form>
	  

	 <div class="confirm_bar">
	 	<input type="submit" value="확인" id="confirm" class="item_btn">
	</div>
	 </div>
</div>	
