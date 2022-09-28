<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<select>
		<option>주문번호</option>
		<option>주문일</option>
		<option>ID</option>
		<option>상품명</option>
		
		</select>
	
		<input type="text" id=main_text style="width:600px; height: 40px;" >
	 	<img src=" " >
	 
	 <input type="submit" value="조회" id="order_btn">
	 </div>	
	 
	 <form action="" >
	 <div class="bar">
	 <p id="order_bar">주문 1 건</p>
	 <select id="select_bar">
	 	<option>최신순</option>
	 	<option>오래된순</option>
	 </select>
	 </div>	 
	 <table class="member_table">
	 <tr>
	 	<th>주문일</th>
	 	<th>주문번호</th>
	 	<th>ID</th>
	 	<th>상품명</th>
	 	<th>실결제금액</th>
	 	<th>결제수단</th>
	 	<th>주문상태</th>
	 </tr>
	 <tr onclick="location.href='/admin/admin_order_detail'" style="cursor:pointer;">
	 	<td>2022-09-24</td>
	 	<td>2022092401</td>
	 	<td>wrwer22</td>
	 	<td>한우토시살</td>
	 	<td>125,000</td>
	 	<td>신용카드</td>
	 	<td>주문취소</td>
	 </tr>
	 </table>
	 </form>
	 </div>
	 
	      <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
    
          </ul>
</div>	
