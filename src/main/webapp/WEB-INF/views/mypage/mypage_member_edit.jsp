<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

<div class="wrap">
            <h3>정보수정</h3>
            <div class="backgroundDiv">
                <p>고객님의 안전한 정보 보호를 위하여 비밀번호를 한번 더 확인합니다.<br>
                비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.</p>
                <input type="text" class="pw" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="mypageButton">
                <div>
                    <a href="./mypage_member_edit_1.html"><button class="btnBright margin">확인</button></a>
                </div>               
                <button class="btnDark margin">취소</button>
            </div>
        </div>