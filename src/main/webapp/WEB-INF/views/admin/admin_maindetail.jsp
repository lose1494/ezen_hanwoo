<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
			<li><a href="/admin/admin_inquiry">상품문의 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_faq">자주하는 질문</a></li>		
			<li><a href="/admin/admin_one2one">1:1문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
	<form action="">
	<table border="1" class="member_table" >
	<tr>
		<th>이름</th>
		<th>생년월일</th>
		<th>연락처</th>
		<th>주소</th>
		<th>이메일</th>
		<th>적릭금</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="dto" items="${ userList }">
	<tr>
		<td>${ dto.users_name }</td>
		<td><fmt:formatDate value= "${ dto.users_birth_date }" pattern="yyyy/MM/dd" /></td>
		<td>${ dto.users_phone }</td>
		<td>${ dto.users_address }</td>
		<td>${ dto.users_email }</td>
		<td>${ dto.users_point }</td>
		<td> <fmt:formatDate value="${dto.users_joindate}" pattern="yyyy/MM/dd" /> </td>

	</tr>
	</c:forEach>
	</table>
	</form>
	

</div>	
</div>