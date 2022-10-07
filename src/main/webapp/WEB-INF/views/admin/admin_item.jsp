<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_item.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품 관리</p>
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
	<form action="/item_search" method="post" id="item_list"> 
	<div class="select_list">
		<select id="item_search" name="item_search">
		<option value="all"> <c:if test="${type eq 'all'}">selected</c:if> 전체조회</option>
		<option value="product_sort"> <c:if test="${type eq 'product_sort' }">selected</c:if> 카테고리</option>
		<option value="product_idx"> <c:if test="${type eq 'product_name' }">selected</c:if> 상품코드</option>
		<option value="product_name"> <c:if test="${type eq 'product_name' }">selected</c:if> 상품명</option>
		</select>
		<input type="text" id="main_text" name="main_text" >
		<input type="submit" value="조회" id="item_btn">
	 </div>	
	 </form>
	 
	 <form action="/item_Action" method="post" id="item_action" >
	 <p id="member_bar">상품 ${ item_Count } 건</p>
	 <table class="member_table" >
	 <tr>
	 	<th>카테고리</th>
	 	<th>상품코드</th>
	 	<th>상품명</th>
	 	<th>판매가</th>
	 	<th>삭제</th>
	 </tr>
	 <c:forEach var="dto" items="${ item_result }" varStatus="status">
	 <tr onclick="location.href='/admin/item_check'" style="cursor:pointer;" >
	 	<td>${ dto.product_category }</td>
	 	<td>${ dto.product_idx }</td>
	 	<td>${ dto.product_name }</td>
	 	<td>${ dto.product_price }</td>
	 	<input type="hidden" value="${ dto.product_idx }" name="product_idx"/>
	 	<td> <button type="submit" id="sending_mail" onclick="javascript:form.action='/delete_product'">삭제</button> </td>
	 </tr>
	 	</c:forEach>
	 	
	 </table>
	 </form>
	 
	 <button class="item_button" onclick="location.href='/admin/item_register'" style="cursor:pointer;">상품등록</button>
	 </div>
	 
</div>		      
