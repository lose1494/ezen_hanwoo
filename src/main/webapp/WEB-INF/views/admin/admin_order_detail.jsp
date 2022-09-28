<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	 	<td>2022-09-24</td>
	 	<td>2022092401</td>
	 	<td>wrwer22</td>
	 	<td>한우토시살</td>
	 	<td>125,000</td>
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
		<th>주문상태</th>	 
	 </tr>
	 <tr>
	 	<td>1</td>
	 	<td>3,000</td>
	 	<td>00,000</td>
	 	<td>-3,000</td>
	 	<td>00,000</td>
	 	<td>신용카드</td>
	 	<td>배송완료</td>
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
	 	<td>홍길동</td>
	 	<td>010-2222-3333</td>
	 	<td>123-321</td>
	 	<td>서울특별시 노원구 상계동</td>
	 	<td>203호</td>
	 </tr>	
	 </table>
	 <table class="member_table3">
	 <tr>
	 	<th>리뷰작성</th>
	 	<th>적립된 마일리지</th>
	 	<th>배송메모</th>
	 
	 </tr>
	 
	 <tr>
	 	<td>Y</td>
	 	<td>3,000</td>
	 	<td>문앞에 놓아주세요.</td>
	 </tr>
	 </table>
	</form>
	 </div>
	 
	      <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
    
          </ul>
</div>	
