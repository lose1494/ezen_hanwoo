<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/notice/notice_view.css">


	<div class="view_div">
	<p>공지사항</p>
	<table>
		<tr>
			<th class="title">작성자</th> <td class="text">관리자</td>
			<th>작성일</th> <td>2022.09.28</td>
		</tr>	
		
		<tr>
			<th class="title" >제목</th> <td class="text"> 공지사항입니다.</td>
			<th >조회수</th> <td  >2</td>
		</tr>
		
		
		<tr>
			<td colspan="4" id="content">내용입니다.</td>
		</tr>
	</table>

</div>	

<div class="button">
	<input type="button" value="목록" id="button1" onclick="location.href='/Notice/notice'" style="cursor:pointer">
</div>	

