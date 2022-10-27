<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

 	<div class="wrap">
        <h3>관심상품</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th> </th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th> </th>
                </tr>
                <c:forEach var="dto" items="${ wishlist }">
                <tr>
                    <td><img src="${ dto.product_image }" alt=""></td>
                    <td>${ dto.product_name }</td>
                    <td>${ dto.product_price }원</td>
                    <td>${ dto.wish.list_count }</td>
                    <td><input type="checkbox"></td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="mypageButton">
            
            <button class="bright">전체상품 삭제</button>
            <button class="bright margin">선택상품 삭제</button>
                          
            <button class="dark">선택상품 장바구니</button>
        </div>
        <div class="pageNav">
       		<a href="/mypage/mypage_wishlist?page=1">처음</a>
       		<a href="/mypage/mypage_wishlist?page=${ page-1 }">이전</a>
       		<c:forEach var="pageNum" begin="1" end="${ pageNum }">
       			<a href="/mypage/mypage_wishlist?page=${ pageNum }">${ pageNum }</a>
       		</c:forEach>
            <a href="/mypage/mypage_wishlist?page=${ page+1 }">다음</a>
            <a href="/mypage/mypage_wishlist?page=${ pageNum }">마지막</a>
        </div>
    </div>
    
    <script>
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