<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <div class="mainMember">
                <div>${ member.users_name } <span>회원님</span></div>
                <div>적립금 <br> <span>${ pointSum }원</span></div>
                <div>장바구니 <br> <span>${ cartCount }건</span></div>
                <div>관심상품 <br> <span>${ wishCount }건</span></div>
        </div>
        <div class="mainOrderList">
            <div>최근 주문내역 <span>*10건까지만 표시됩니다.</span></div>
            <div>주문 내역이 존재하지 않습니다.</div>
        </div>
    </div>