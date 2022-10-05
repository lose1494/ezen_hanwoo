<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

 	<div class="wrap">
        <h3>적립금 내역</h3>
        <div class="total">총 적립금 : ${pointSum}원</div>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>적립/사용일</th>
                    <th>적립/사용내역</th>
                    <th>적립/사용금액</th>
                    <!-- <th>사용금액</th> -->
                    <!-- <th>합계</th> -->
                    <th>만료일</th>
                    
                </tr>
                <c:forEach var="point" items="${pointList}">
                <tr>
                    <td> <fmt:formatDate value="${ point.point_start_date }" pattern = "yyyy-MM-dd"/> </td>
                    <td> ${ point.point_content } </td>
                    <td> ${ point.point_point } </td>
                    <!-- <td>-0원</td> -->
                    <!-- <td> </td> -->
                    <td> <fmt:formatDate value="${ point.point_end_date }" pattern = "yyyy-MM-dd"/> </td>           
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