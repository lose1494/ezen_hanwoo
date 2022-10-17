<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin/notice_detail.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>공지사항>공지사항 상세 조회</p>
	</div>
</div> 

	<div class="view_div wrap">
	<p class="title_tag">공지사항</p>
	<table>
		<c:forEach var="dto" items="${ notice_detail }" varStatus="status">
		<tr>
			<th class="title">작성자</th> 
			<td class="text"> ${ dto.notice_name }</td>
			
			<th>작성일</th> 
			<td> <fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /></td>
		</tr>	
		
		<tr>
			<th class="title" >제목</th> 
			<td class="text"> ${ dto.notice_title }</td>
			
			<th >조회수</th> 
			<td> 0</td>
		</tr>
		<tr>
			<td colspan="4" id="content"> ${ dto.notice_content }</td>
		</tr>
		<tr>
			<td colspan="4" style="display: flex; align-items: center; justify-content: center; height: 700px !important;">
				<img src="${ dto.notice_img }" id="img" style="width: 500px; height: 500px;">
			</td>
		</tr>
		<input type="hidden" value="${ dto.notice_idx }" name="notice_idx"/>
		</c:forEach>
	</table>
<input type="button" value="목록" id="button" onclick="location.href='/admin/admin_notice'" style="cursor:pointer">
</div>	

