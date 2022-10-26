<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>주문내역</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>결제금액</th>
                    <th>주문일자</th>
                    <th>상태</th>
                    <th></th>
                </tr>
                <c:forEach var="dto" items="${ orderlist }">
                <tr>                   
                    <td>${ dto.order_no }</td>
                    <td>${ dto.order_product_name }</td>
                    <td>${ dto.order_total_price }원</td>
                    <td><fmt:formatDate value="${ dto.order_date }" pattern = "yyyy-MM-dd"/></td>
                    <td>결제완료</td>
                    <td><button class="dark" onclick="window.open('/mypage/mypage_orderDetail','test','width=600 height=700')">상세조회</button></td>
                </tr>
                </c:forEach>
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