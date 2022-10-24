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
	<form action="Notice_selectAction" method="post" id="notice_search" name="searchType">
		<select>
		<option value="all">전체조회</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		</select>
	 <input type="text" id=main_text name="searchName">
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
	 
	 <table class="member_table" id="notice_table">
	 <tr>
	 	<th>번호</th>
	 	<th>제목</th>
	 	<th value=" ${ notice_date }" id="notice_table_date">날짜</th>	 	
	 </tr>
	 </table>

	 <button class="item_button notice_btn"  onclick="location.href='/admin/admin_noticewrite'" style="cursor:pointer;">글쓰기</button>
	 </div>
	 
</div>	
<script>
$(document).ready(function() {
    notice();
    console.log("a는 실행되었습니다");
}); 
function notice() {
	
	
    $.ajax({
        url: "/admin/notice_list", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
        data: { notice_idx: "1",
        		notice_title : "1",
        		notice_date : "2022/07/11" },  // HTTP 요청과 함께 서버로 보낼 데이터
        method: "GET",   // HTTP 요청 메소드(GET, POST 등)
        dataType: "json", // 서버에서 보내줄 데이터의 타입
        success: function (data) {
        	
        	
            let htmls = "";
            const dataLen = data.length;
            const target = document.getElementById("notice_table");
            for (let i = 0; i < dataLen; i++) {
            	

        		
            	
                 htmls += '<tr>'
                     + '<td>'+ data[i].notice_idx +'</td>'
                     +'<td>' +data[i].notice_title+ '</td>'
                     +'<td>'+ data[i].notice_date +'</td>'
                     +'<td><button onclick="notice_detail()" idx="'+ i +'"id="sending_mail" class="notice_btn">수정</td>'
                     +'<td><button onclick="delete_Cart_table(this)" idx="'+ i +'"id="sending_mail" class="notice_btn">삭제</td>'
				     +'</tr>'
                    
                     console.log(htmls);
            		
            }
            
            target.insertAdjacentHTML('beforeend', htmls)
        },
   		
        error: function (data) {
        	console.log("122222");
        }
    })
}
function notice_detail(){
	location.href="/admin/admin_noticewrite2"
}

</script>