<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_main.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	<form action="member_search" method="post" id="member_search">
	<div class="select_option" >
		<select id="select_list" name="search_list">
		<option value="all"> <c:if test="${ type eq 'all' }">selected</c:if> 전체</option>
		<option value="users_id"> <c:if test="${ type eq 'users_id' }">selected</c:if> 아이디</option>
		<option value="users_name"> <c:if test="${ type eq 'users_name' }">selected</c:if> 성명</option>
		<option value="users_joindate"> <c:if test="${ type eq 'users_joindate' }">selected</c:if> 가입일</option>
		</select>
		<input type="text" id="search_text" name="search_text" >
	 	<input id="btn" type="submit" value="조회">
	 </div>	
	 </form>
	 
	 <form action="" class="member_table">
	 <p>회원목록 ${ list_Count }건</p>
	 <table border="1" id="table_container">
	 <tr>
	 	<th>아이디</th>
	 	<th>성명</th>
	 	<th>이메일</th>
	 	<th>연락처</th>
	 	<th>주소</th>
	 	<th>임시 비밀번호</th>
	 </tr>
	<c:forEach var="dto" items ="${ search_result }" varStatus="status" > 
	 <tr onclick="location.href='/admin/admin_maindetail'" style="cursor:pointer;">
	 	<td> ${dto.users_id }</td>
	 	<td> ${dto.users_name }</td>
	 	<td> ${dto.users_email }</td>
	 	<td> ${dto.users_phone }</td>
	 	<td> ${dto.users_address }</td>
	 	<td> <button id="sending_mail">이메일 보내기</button> </td>
	 </tr>
	 </c:forEach>
	 </table>
	 </form>
	 </div>
</div>	
