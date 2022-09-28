<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_main.css">

<div class= "bg_admin text-center">
<div class= "bg">
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" id="bg_img">
	<p id="title1">>관리자페이지>회원목록 조회</p>
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
	<div class="select_list" >
		<select style="width:100px; height:40px; text-align: center;">
		<option>전체조회</option>
		<option>아이디</option>
		<option>성명</option>
		<option>연락처</option>
		</select>
	
		<input type="text" id=main_text style="width:600px; height:40px;">
	 <img src=" " >
	 
	 <input id="btn" type="submit" value="조회">
	 </div>	
	 
	 <form action="" class="member_table">
	 <p>회원목록 1건</p>
	 <table border="1" style="width: 900px; height: 100px; text-align: center;" >
	 <tr>
	 	<th>아이디</th>
	 	<th>성명</th>
	 	<th>이메일</th>
	 	<th>연락처</th>
	 	<th>주소</th>
	 	<th>임시 비밀번호</th>
	 </tr>
	 
	 <tr onclick="location.href='/admin/admin_maindetail'" style="cursor:pointer;">
	 	<td>hong</td>
	 	<td>홍길동</td>
	 	<td>hong1111@gmail.com</td>
	 	<td>010-1111-2222</td>
	 	<td>서울특별시 강남구 신사동</td>
	
	 	<td> <button id="sending_mail">이메일 보내기</button> </td>
	 </tr>
	 
	 </table>
	 </form>
	 </div>
</div>	
