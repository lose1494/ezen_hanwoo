<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
    
	<div class="wrap">
        <a class="title" href="/mypage/mypage_main">마이페이지</a>
        <table class="menuTable">
            <tr>
                <th>적립 내역</th>
                <th>상품 관리</th>
                <th>주문 내역</th>
                <th>문의 내역</th>
                <th>정보 관리</th>
            </tr>
            <tr>
                <td><a href="/mypage/mypage_point">적립금</a></td>
                <td><a href="/mypage/mypage_cart">장바구니</a></td>
                <td><a href="/mypage/mypage_order">주문내역</a></td>
                <td><a href="/mypage/mypage_one2one">1:1 문의</a></td>
                <td><a href="/mypage/mypage_memberEdit">정보 수정</a></td>
            </tr>
            <tr>
                <td></td>
                <td><a href="/mypage/mypage_wishlist">관심상품</a></td>
                <td></td>
                <td><a href="/mypage/mypage_productQna">상품 문의 내역</a></td>
                <td><a href="/mypage/mypage_memberWithdrawal">회원 탈퇴</a></td>
                <!-- <td><a href="/mypage/mypage_addressManagement">배송지 관리</a></td> -->
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="/mypage/mypage_review">상품 리뷰 내역</a></td>
                
            </tr>
        </table>
    </div>
	        
	<script>
	        $(function () {var url = window.location.pathname,
	            urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
	            $('a').each(function () {if (urlRegExp.test(this.href.replace(/\/$/, ''))) { 
	                $(this).addClass('bold');} });});
	
	</script>        