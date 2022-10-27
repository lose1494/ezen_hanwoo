<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/admin/admin_order.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>주문 관리</p>
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
	<div class="select_list">
		<select id="search_type">
		<option value="order_no">주문번호</option>
		<option value="users_id">ID</option>
		<option value="product_name">상품명</option>
		
		</select>
	
		<input type="text" id=search_contents style="width:600px; height: 40px;" >
	 	<img src=" " >
	 
	 <input type="submit" value="조회" id="order_btn">
	 </div>	
	 
	 
	 <div class="bar">
	 <p id="order_bar">주문 ${ order_Count } 건</p>
	 <select id="select_bar">
	 	<option>최신순</option>
	 	<option>오래된순</option>
	 </select>
	 </div>	 
	 <table class="member_table" id="member_table">
	 <tr>
	 	<th>주문일</th>
	 	<th>주문번호</th>
	 	<th>ID</th>
	 	<th>상품명</th>
	 	<th>실결제금액</th>
	 	<th>결제수단</th>
	 	<th>주문상태</th>
	 </tr>
	 <c:forEach var="dto" items="${ orderlist1 }" varStatus="status">

	 <tr onclick="location.href='/admin/admin_order_detail?order_idx=${ dto.order_idx }'" style="cursor:pointer;">
	 	<td><fmt:formatDate value= "${ dto.order_date }" pattern="yyyy/MM/dd" /></td>
	 	<td>${ dto.order_no }</td>
	 	<td>${ dto.users_id }</td>
	 	<td>${ dto.order_product_name }</td>
	 	<td>${ dto.order_total_price }</td>
	 	<td>${ dto.pay_method }</td>
	 	<td></td>
	 </tr>
	 </c:forEach>
	 </table>
	 <div class="pageNav">
            <a href="/admin/admin_order?search_type=${type}&search_contents=${word}&page=1">처음</a>
            <a href="/admin/admin_order?search_type=${type}&search_contents=${word}&page=${ page-1 }">이전</a>
			<c:forEach var="pageNum" begin="1" end="${pageNum}">
            <a href="/admin/admin_order?search_type=${type}&search_contents=${word}&page=${pageNum}">${pageNum}</a>
			</c:forEach>
            <a href="/admin/admin_order?search_type=${type}&search_contents=${word}&page=${ page+1 }">다음</a>
            <a href="/admin/admin_order?search_type=${type}&search_contents=${word}&page=${pageNum}">마지막</a>
        </div>
	 </div>

	  		

</div>	

<script>
	$(function(){
		$('.pageNav a').each(function(){
			if($(this).text() == '이전' && "{page}" == 1){
				$(this).removeAttr('href');
			} if($(this).text() == '다음' && "{page}" == "${pageNum}"){
				$(this).removeAttr('href');
			} if ($(this).text() == "${page}"){
				$(this).removeAttr('href');
			}
			
		})
		
	});
</script>
