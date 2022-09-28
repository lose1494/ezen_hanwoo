<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">
 <div class="wrap">
            <h3>배송지 관리</h3>
            <div class="backgroundDiv">
                <table class="mypageTable">
                    <tr>
                        <th>받으시는 분</th>
                        <th>우편번호</th>
                        <th>배송지 주소</th>
                        <th>연락처</th>
                    </tr>
                    <tr>
                        <td>OOO</td>
                        <td>00000</td>
                        <td>경기도 의정부시 OOO OOO</td>
                        <td>010-0000-0000</td>
                    </tr>
                </table>
            </div>
            <div class="mypageButton">
                    <button class="btnBright center">배송지 변경</button>           
            </div>
        </div>