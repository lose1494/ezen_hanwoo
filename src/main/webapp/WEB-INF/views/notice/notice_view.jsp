<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/notice/notice_view.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="view_div wrap">
	<p class="title_tag">공지사항</p>
	<c:forEach var="dto" items="${ notice_detail }" varStatus="status">
	<table class="headTable">
		<tr>
			
		</tr>	
		
		<tr>
			<th class="title" >제목</th>
			<td class="text"> ${ dto.notice_title } </td>
			<th>작성일</th> 
			<td> <fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /></td>		
		</tr>
		</table>
		<table class="contentTable">
		<tr>
			<td colspan="4" id="content">${ dto.notice_content }</td>
		</tr>
		
			<tr>
			<td colspan="4" id="img_td">
		      <c:choose>
		      			<c:when test="${ dto.notice_img eq ''}"></c:when>
		      			<c:otherwise><img id="notice_img" src="${ dto.notice_img}" name="notice_img"/></c:otherwise>
		      </c:choose>
			</td>
		</tr>
		<input type="hidden" value="${ dto.notice_idx }" name="notice_idx"/>
		
	</table>
	</c:forEach>
	<div class="divBtn">
<input type="button" value="목록" id="button" onclick="location.href='/Notice/notice'" style="cursor:pointer">
</div>
</div>	


	


