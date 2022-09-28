<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_item.css">

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
	<div class="select_list">
		<select>
		<option>전체조회</option>
		<option>카테고리</option>
		<option>상품명</option>
		
		</select>
	
		<input type="text" id=main_text style="width:600px; height: 40px;">
	 <img src=" " >
	 
	 <input type="submit" value="조회" id="item_btn">
	 </div>	
	 
	 <form action="" >
	 <p id="member_bar">상품 1건</p>
	 <table class="member_table" >
	 <tr>
	 	<th>카테고리</th>
	 	<th>상품코드</th>
	 	<th>상품명</th>
	 	<th>판매가</th>
	 	<th>삭제</th>
	 </tr>
	 
	 <tr onclick="location.href='/admin/item_check'" style="cursor:pointer;" >
	 	<td>구이용</td>
	 	<td>01</td>
	 	<td>치마살</td>
	 	<td>00,000</td>
	 	
	 	<td> <button id="sending_mail">삭제</button> </td>
	 </tr>
	 </table>
	 </form>
	 <button class="item_button" onclick="location.href='/admin/item_register'" style="cursor:pointer;">상품등록</button>
	 </div>
	 
</div>		      
	<ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
    
          </ul>

