<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<li><a href="/admin/admin_inquiry">상품문의 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_faq">자주하는 질문</a></li>		
			<li><a href="/admin/admin_one2one">1:1문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
	<div class="select_list">
	<form id="notice_search" name="searchType">
		<select id="search_type" name="search_type">
		<option value="notice_title">제목</option>
		<option value="notice_content">내용</option>
		</select>
	 <input type="text" id="search_contents" name="search_contents" >
	 <input type="submit" value="조회" class="notice_btn">
	 </form>
	 </div>	
	 
	
	<div class="member_var">
	 <p id="member_bar">공지 ${ notice_count } 건</p>
	 <select class="member_select" id="sort">
		<option id="asc">최신순</option>
		<option id="desc">오래된 순</option> 
	 </select>
	 </div>	 	

	<form name="list">
	 <table class="member_table" >
	 <tr>
	 	<th>번호</th>
	 	<th>제목</th>
	 	<th>내용</th>
	 	<th>날짜</th>
	
	 </tr>
	 <c:forEach var="dto" items ="${ admin_notice_list }" varStatus="status" > 
	 <tr onclick="location.href='/admin/notice_detail?notice_idx=${ dto.notice_idx }'" style="cursor:pointer">
	 	<td> 
	 		${ dto.notice_idx}
	 	</td>
	 	<td> 
	 		${ dto.notice_title } 
	 	</td>
	 	<td> 
	 		${ dto.notice_content }
	 	</td>
		<td> 
			<fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /> 
		</td>
	 	<td> <input type="hidden" value="${ dto.notice_idx }" name="notice_idx"/>
	 		<button type="submit" id="sending_mail" class="notice_btn" onclick="javascript:form.action='/admin/deleteNotice?noice_idx=${dto.notice_idx}'">삭제</button>
	 	</td>
	 </tr>
	 
	</c:forEach>
	 </table>
</form> 	
	 <button class="item_button notice_btn"  onclick="location.href='/admin/admin_noticewrite'" style="cursor:pointer;">글쓰기</button>
	 </div>
	 
</div>	
