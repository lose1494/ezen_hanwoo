<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_maindetail.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>회원 목록 조회>상세조회</p>
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
			<li><a href="/admin/admin_item">상품 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_one2one">1:1 문의 관리</a></li>
		</ul>
	</div>
	
	<form action="">
	<table border="1" class="member_table" ">
	<tr>
		<th>이름</th>
		<th>생년월일</th>
		<th>연락처</th>
		<th>주소</th>
		<th>이메일</th>
		<th>적릭금</th>
		<th>가입일</th>
	</tr>
	
	<tr>
		<td>홍길동</td>
		<td>1997.05.04</td>
		<td>010-1111-2222</td>
		<td>서울특별시 강남구 신사동</td>
		<td>hong1111@gmail.com</td>
		<td>10,000</td>
		<td>2022.09.02</td>
	</tr>
	</table>
	</form>
	

</div>	
