<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin/admin_noticewrite.css">
    
    <div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>공지사항>공지사항쓰기</p>
	</div>
</div> 

<div class="admin_div">
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

<div class="write_main">
<div class="write_flex">
<div class="write_input">
	<lable> 제목: </lable> <input type="text" class="write_input1" placeholder="공지사항입니다.">
	</div>
	
	<textarea rows="20" cols="130" class="write_area"></textarea>
	</div>
</div>

</div>