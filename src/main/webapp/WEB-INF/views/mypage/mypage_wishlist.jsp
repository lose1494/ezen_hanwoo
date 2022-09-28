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
                        <th>상품설명</th>
                        <th>가격</th>
                        <th> </th>
                    </tr>
                    <tr>
                        <td><img src="https://via.placeholder.com/80" alt=""></td>
                        <td>상품 이름 <br> <span>000원/100g</span></td>
                        <td>상품에 관한 설명 들어갈 공간 더미 문구</td>
                        <td>00,000원</td>
                        <td><input type="checkbox"></td>
                    </tr>
                </table>
            </div>
            <div class="mypageButton">
                
                <button class="btnBright">전체상품 삭제</button>
                <button class="btnBright">선택상품 삭제</button>
                              
                <button class="btnDark">선택상품 장바구니</button>
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