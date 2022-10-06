<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>회원 탈퇴</h3>
        <form action="userDelete">
            <div class="backgroundDiv">
                <p>탈퇴하실 경우 구매내역 확인은 물론 로그인 후 가능한 모든 기능은 사용하실 수 없습니다. <br>
                탈퇴하신 후에 회원 정보의 복구는 불가능하며, 보유하신 적립금도 모두 무효화됩니다.</p>
                <input type="text" class="pw" placeholder="비밀번호를 입력해주세요."> <br>
                <textarea name="" id="" cols="50" rows="10" placeholder="탈퇴사유"></textarea>
            </div>
            <div class="mypageButton">
                    <button class="bright">확인</button>        
                <button type="button" class="dark" onclick="javascript:history.back();">취소</button>
            </div>
        </form>
    </div>