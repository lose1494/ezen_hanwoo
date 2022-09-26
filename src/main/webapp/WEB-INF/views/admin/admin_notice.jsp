<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_notice.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>공지사항 관리</p>
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
	<div class="select_list">
		<select>
		<option>전체조회</option>
		<option>카테고리</option>
		<option>상품명</option>
		
		</select>
	
		<input type="text" id=main_text style="width:600px; height: 40px;">
	 <img src=" " >
	 
	 <input type="submit" value="조회" class="notice_btn">
	 </div>	
	 
	 <form action="" >
	 <p id="member_bar">공지 1건</p>
	 <select class="member_select">
		<option>최신순</option>
		<option>오래된 순</option>
			 
	 </select>
	 <table class="member_table" >
	 <tr>
	 	<th>번호</th>
	 	<th>날짜</th>
	 	<th>제목</th>
	 	
	 </tr>
	 
	 <tr>
	 	<td>15</td>
	 	<td>2022-09-20</td>
	 	<td>공지사항 입니다.</td>
	 	<td> <input type="button" value="수정" id="sending_mail" class="notice_btn" onclick="location.href='/admin/admin_noticewrite'" style="cursor:pointer;"> </td>
	 	<td> <input type="button" value="삭제" id="sending_mail" class="notice_btn"></td>
	 </tr>
	 </table>
	 </form>
	 <button class="item_button notice_btn"  onclick="location.href='/admin/admin_noticewrite'" style="cursor:pointer;">글쓰기</button>
	 </div>
	 
	      <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
    
          </ul>
</div>	
