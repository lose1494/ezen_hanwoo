<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>상품 리뷰 내역</h3>
        <div class="reviewLink">
            <a href="">작성가능한 리뷰</a>
            <a href="">작성한 리뷰</a>
        </div>          
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>별점</th>
                    <th>제품사진</th>
                    <th>상품명</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th></th>
                </tr>
                <c:forEach var="dto" items="${ reviewList }" varStatus="status">
                <tr>
                    <td>
                        <span class="starRating-base gray">
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>
                        </span>
                        <b class="hide score">5</b>
                    </td>
                    <td>${ dto.review_image }</td>
                    <td></td>
                    <td>${ dto.review_title }</td>
                    <td><fmt:formatDate value="${ dto.review_date }" pattern = "yyyy-MM-dd"/></td>
                    <td><button class="dark">삭제</button></td>
                </tr>
                </c:forEach>
            </table>
        </div>
         <div class="pageNav">
       		<a href="/mypage/mypage_review?page=1">처음</a>
       		<a href="/mypage/mypage_review?page=${ page-1 }">이전</a>
       		<c:forEach var="pageNum" begin="1" end="${ pageNum }">
       			<a href="/mypage/mypage_review?page=${ pageNum }">${ pageNum }</a>
       		</c:forEach>
            <a href="/mypage/mypage_review?page=${ page+1 }">다음</a>
            <a href="/mypage/mypage_review?page=${ pageNum }">마지막</a>
        </div>
    </div>

    <script>
        $(function() {
            console.log($('.score').text());
            $('.score').each(function() {
                for(i=0; i<$(this).text(); i++) {
                $(this).closest('td').find('.fa-star').eq(i).addClass('gold');
            } 
            })      
        });
        
        $(function() {
            $('.pageNav a').each(function() {
            	console.log($(this).text());
            	if($(this).text() == '이전' && "${page}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${page}" == "${pageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ page }" ) {
                    $(this).removeAttr('href');
                }
            })
        })
    </script>