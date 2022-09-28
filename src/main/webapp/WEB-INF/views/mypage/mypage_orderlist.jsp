<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>주문내역</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>주문번호</th>
                    <th></th>
                    <th>상품명</th>
                    <th>결제금액</th>
                    <th>주문일자</th>
                    <th>상태</th>
                    <th></th>
                </tr>
                <tr>
                    <td>주문번호 : 00000000</td>
                    <td><img src="https://via.placeholder.com/80" alt=""></td>
                    <td>상품 이름 <br> <span>000원/100g</span></td>
                    <td>00,000원</td>
                    <td>주문일자 : 2022-09-02</td>
                    <td>결제완료</td>
                    <td><button class="bright" onclick="window.open('/mypage/mypage_orderDetail','test','width=600 height=700')">상세조회</button></td>
                </tr>
            </table>
        </div>
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