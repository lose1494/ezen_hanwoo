<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>1:1 문의</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>번호</th>
                    <th>답변</th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>처리중</td>
                    <td>기타</td>
                    <td>안녕하세요 문의드립니다.</td>
                    <td>2022-09-02</td>
                </tr>
            </table>
        </div>
        <div class="mypageButton">              
            <button class="dark">글쓰기</button>
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