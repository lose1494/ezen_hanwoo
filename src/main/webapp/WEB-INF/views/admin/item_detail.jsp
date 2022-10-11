<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/item_check.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품관리>상품 상세 조회</p>
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
	
<form action="/item_detail_Action" method="get" >
	 <table class="member_table" >
	 <tr>
	 	<th>상품코드</th>
	 	<th>카테고리</th>
	 	<th>상품명</th>
	 	<th>상품가격</th>
	 	<th>수정</th>
	 </tr>
	 	<c:forEach var="dto" items= "${ productDetail }" varStatus="status">
	 <tr>
	 	<td>${ dto.product_idx }</td>
	 	<td>${ dto.product_category }</td>
	 	<td>${ dto.product_name }</td>
	 	<td>${ dto.product_price }</td>
	 	<td> <input type="button" value="수정" class="check_btn" onclick="location.href='/admin/item_revise'"> </td>
	 </tr>
	
	 </table>
	 </form>
	 
	 <form action="uploadOk" method="post" enctype="multipart/form-data">
	  <table class="img_text">
	 <tr>
		<th>이미지  </th>
	 	<th>상품설명</th>
	 </tr>
	 
	 <tr>
	 	<td> <img src=${dto.product_image } alt="업로드된 이미지" /> </td> 
	 	<td id="text_td"> <img src=${dto.product_explanation } alt="업로드된 이미지" /> </td>
	 </tr>
	  	</c:forEach>
	 </table>
	 <div class="confirm_bar">
	 	<input type="button" value="확인" id="confirm" class="check_btn" onclick="location.href='/admin/admin_item'">
	</div>
	</form>

	 </div>
</div>	
