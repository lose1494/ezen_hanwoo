<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/admin/admin_order_detail.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>주문 상세 조회</p>
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
 	<form >
	 <table class="member_table">
	 <tr>
	 	<th>주문일</th>
	 	<th>주문번호</th>
	 	<th>ID</th>
	 	<th>상품명</th>
	 	<th>가격</th>
	 </tr>
	
	 <tr> 
	 	<c:forEach var="dto2" items="${ orderlist2 }" varStatus="status">
	 	<td><fmt:formatDate value= "${ dto2.order_date }" pattern="yyyy/MM/dd" /></td>
	 	<td>${ dto2.order_no }</td>
	 	<td>${ dto2.users_id }</td>
	 	<td>${ dto2.order_product_name }</td>
	 	<td>${ dto2.order_total_price }</td>
	 	</c:forEach>
	 </tr>
	 </table>
	 <table class="member_table1">
	 <tr>
	 	<th>구매개수</th>
	 	<th>배송비</th>
	 	<th>총 결제금액</th>
	 	<th>사용 적립금</th>
	 	<th>실결제금액</th>
	 	<th>결제수단</th>	 
	 </tr>
	 <tr>
	 <c:forEach var="dto2" items="${ orderlist2 }" varStatus="status">
	 	<td>${ dto2.product_count }</td>
	 	<td>5,000</td>
	 	<td>${ dto2.order_total_price * dto2.product_count + 5000 }</td>
	 	<td>${ dto2.order_usepoint }</td>
	 	<td>${ dto2.order_total_price + 5000 - dto2.order_usepoint } </td>
	 	<td>${ dto2.pay_method }</td>
	 	</c:forEach>
	 </tr>
	 </table>
	 <table class="member_table2">
	 <tr>
	 	<th>수령인</th>
	 	<th>연락처</th>
	 	<th>우편번호</th>
	 	<th>주소</th>
	 	<th>상세주소</th>
	 </tr>
	 
	 <tr>
	 	<c:forEach var="dto2" items="${ orderlist2 }" varStatus="status">
	 	<td>${ dto2.order_recipient }</td>
	 	<td>${ dto2.order_phone }</td>
	 	<td>${ dto2.order_address1 }</td>
	 	<td>${ dto2.order_address2 }</td>
	 	<td>${ dto2.order_address3 }</td>
	 	</c:forEach>
	 </tr>	
	 </table>
	 <table class="member_table3">
	 <tr>
	 	<th>리뷰작성</th>
	 	<th>적립된 마일리지</th>
	 	<th>배송메모</th>
	 
	 </tr>
	 
	 <tr>
	 	<c:forEach var="dto2" items="${ orderlist2 }" varStatus="status">
	 	<td>Y</td>
	 	<td>${ dto2.order_total_price * dto2.product_count / 100}</td>
	 	<td>${ dto2.order_comment }</td>
	 	</c:forEach>
	 </tr>
	 </table>
	</form>
	 </div>

</div>	
