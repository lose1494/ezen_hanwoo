<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/item_inquiry.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품 문의 관리</p>
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
	
<form action="" method="get">
	
	 <table class="member_table" >
	 <tr>
	 	<th>번호</th>
	 	<th>ID</th>
	 	<th>날짜</th>
	 	<th>상품명</th>
	 	<th>답변여부</th>
	 	<th>제목</th>
	 </tr>
	 <c:forEach var="dto" items= "${ qna_list }" varStatus="status">
	 <tr onclick="location.href='/admin/admin_inquiry?qna_idx=${ dto.qna_idx}'" style="cursor:pointer">
	 	<td> ${ dto.qna_idx }</td>
	 	<td> ${ dto.qna_id }</td>
	 	<td><fmt:formatDate value="${dto.qna_date}" pattern="yyyy/MM/dd" /></td>
	 	<td> 상품명 <td>
	 	<td>${ dto.qna_status }</td>
	 	<td>${ dto.qna_title }</td>
	 </tr>
	 
	 <tr>
	 	<th colspan="6">내용</th>
	 </tr>
	 
	 <tr>
	 <td colspan="6"> ${dto.qna_content} </td>
	 
	 </tr>
	 	
	 
	 </c:forEach>
	 <tr class="text_comment">
	 	<td colspan="4" id="text"  > <textarea rows="5" cols="130" ></textarea> </td>
	 	<td > <input type="button" value="수정" > </td>
	 	<td > <input type="button" value="삭제" > </td>
	 </tr>
		</table>
	 <div class="confirm_bar">
	 	<input type="submit" value="확인" id="confirm">
	</div>
	</form>

	 </div>
	 

</div>	
