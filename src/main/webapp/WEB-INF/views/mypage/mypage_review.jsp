<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

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
                <tr>
                    <td>
                        <span class="starRating-fill gold">
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>
                        </span>
                        <span class="starRating-base gray">
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>                       
                            <i class="fa-solid fa-star"></i>
                        </span>
                    </td>
                    <td><img src="https://via.placeholder.com/80" alt=""></td>
                    <td>한우 치마살</td>
                    <td>맛있게 잘 먹었습니다!!</td>
                    <td>2022-09-02</td>
                    <td><button class="dark">삭제</button></td>
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