<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <link rel="stylesheet" href="/css/notice/notice.css">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>    
    
    <div class="wrap">

    	<p class="title_tag">공지사항</p>

	    <form action="notice_Action" method="get" name="searchType">
	    <table  class="Notice_table" >
	        <thead>
	        <tr class="Notice_tr1">
	            <th id="number">번호</t>
	            <th id="title">제목</th>
	            <th id="writer">작성자</th>
	            <th id="date">작성일</th>
	
	        </tr>
	    </thead>
	    <tbody>
	    <c:forEach var = "dto" items = "${ admin_notice_list }" varStatus="status" >
	        <tr onclick="location.href='/Notice/notice_view?notice_idx=1'" style="cursor:pointer;" >
	            <td id="number">${ dto.notice_idx } </td>
	            <td id="title"> ${ dto.notice_title }</td>
	            <td id="writer"> ${ dto.notice_name }</td>
	            <td id="date"> ${ dto.notice_date }</td>
	            
	        </tr>
	       </c:forEach>
	    </tbody>
	    </table>

    	<div class="search">
	         <select name="search_type" id="select1">
	            <option value="title">제목</option>
	            <option value="content">내용</option>
	         </select>

         	<input type="text" value="검색어를 입력하세요." id="search_contents" name="search_contents">
        
        	<div id="img"> <input type="submit" src="/img/notice/search.png" id="searchBtn"> </div>
  		</div>
  </form>
  		<div class="pageNav">
            <a href="#">처음</a>
            <a href="#">이전</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">다음</a>
            <a href="#">마지막</a>
        </div>

	</div>