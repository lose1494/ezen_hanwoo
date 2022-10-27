<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin/notice_detail.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class= "bg_admin text-center">
<div class= "bg">
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" id="bg_img">
	<p id="title1">>관리자페이지>공지사항 상세 조회</p>
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
	<c:forEach var="dto" items="${ notice_detail }" varStatus="status">
	<table class="headTable">
		<input type="hidden" value="${dto.notice_idx }" name="notice_idx"/>
			<tr>
			<th class="title">작성자</th> 
			<td class="text">${ dto.notice_name }</td>
			<th>작성일</th> 
			<td> <fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /></td>		
		</tr>	
		
		<tr>
			<th class="title" >제목</th>
			 <td class="text"> ${ dto.notice_title } </td>
			<th>조회수</th> 
			<td>2</td>
		</tr>
		</table>
		<table class="contentTable">
		<tr>
			<td colspan="4" id="content">${ dto.notice_content }</td>
		</tr>
	
			<tr>
			<td colspan="4" id="img_td"> <img src="${ dto.notice_img }" id="img">
			</td>
		</tr>
		
		
	</table>
	<div class="divBtn">
<input type="button" value="목록" id="button" onclick="location.href='/admin/admin_notice'" style="cursor:pointer">
<input type="submit" value="수정" id="button" onclick="location.href='/admin/admin_noticeEdit?notice_idx=${ dto.notice_idx }'" style="cursor:pointer">
</div>
</c:forEach>
</div>
</div>


