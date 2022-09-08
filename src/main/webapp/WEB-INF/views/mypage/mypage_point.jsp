<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

 <div class="wrap">
            <h3>적립금 내역</h3>
            <div class="total">총 적립금 : 0원</div>
            <div class="backgroundDiv">
                <table class="mypageTable">
                    <tr>
                        <th>적립/사용일</th>
                        <th>적립금액</th>
                        <th>사용금액</th>
                        <th>합계</th>
                        <th>만료일</th>
                        <th>내용</th>
                    </tr>
                    <tr>
                        <td>2022/09/04</td>
                        <td>+000원</td>
                        <td>-0원</td>
                        <td>0,000원</td>
                        <td>2023/09/04</td>
                        <td>상품구매(주문번호:00000000)</td>
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