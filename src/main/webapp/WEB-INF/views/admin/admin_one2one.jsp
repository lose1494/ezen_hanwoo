<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_one2one.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지> 1:1 문의 관리 </p>
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
			<li><a href="/admin/admin_item">상품 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_one2one">1:1 문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
	
<form action="" method="get">
	 <table class="member_table" >
	 <tr>
	 	<th>ID</th>
	 	<th>날짜</th>
	 	<th>제목</th>
	 	<th>답변여부</th>
	 	<th>내용</th>
	 </tr>
	 
	 <tr>
	 	<td>asd22</td>
	 	<td>2022-09-02</td>
	 	<td>배송기간이..</td>
	 	<td>Y</td>
	 	<td>언제 배송되나요?</td>
	 </tr>
	 
	 <tr class="text_comment">
	 	<td colspan="4" id="text"  > <textarea rows="5" cols="130" ></textarea> </td>
	 	<td > <input type="button" value="수정" class="notice_btn"> </td>
	 	<td > <input type="button" value="삭제" class="notice_btn"> </td>
	 </tr>
	 
	 <tr>
	 	<td>asd22</td>
	 	<td>2022-09-02</td>
	 	<td>주문날짜가..</td>
	 	<td>N</td>
	 	<td>오늘 배송인가요?</td>
	 </tr>
	 
	 <tr>
		<td colspan="4" id="text"  > <textarea rows="5" cols="130" ></textarea> </td>
	 	<td > <input type="button" value="등록" class="notice_btn"> </td>
	 </tr>
		</table>
		
	 <div class="confirm_bar">
	 	<input type="submit" value="확인" id="confirm" class="notice_btn">
	</div>
	</form>

	 </div>
	 
	      <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
    
          </ul>
</div>	
