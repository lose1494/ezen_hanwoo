<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/mypage/mypage.css">
	<style>
        .wrap {
            margin: 0 auto;
            font-size: 13px;
            color: rgb(48, 48, 48);
        }
    </style>

	<div class="wrap">
        <h2>주문상세조회</h2>
        <p>주문번호 : 00000000</p>
        <div class="productTable">
            <table>
                <tr>
                    <td></td>
                    <td>상품명</td>
                    <td>가격 / 수량</td>
                    <td>배송비</td>
                    <td>상태</td>
                </tr>
                <tr>
                    <td><img src="https://via.placeholder.com/80" alt=""></td>
                    <td>한우 살치살</td>
                    <td>00,000원 / 1개</td>
                    <td>0,000원</td>
                    <td>결제완료</td>
                </tr>
            </table>
        </div>
        <div class="orderTable">
            <div class="tableName">주문자 정보</div>
            <table>
                <tr>
                    <th>성함(주문자)</th>
                    <td>김xx</td>
                </tr>
                <tr>
                    <th>휴대전화번호</th>
                    <td>010-0000-0000</td>
                </tr>
            </table>
            <div class="tableName">배송지 정보</div>
            <table>
                <tr>
                    <th>성함(수령인)</th>
                    <td>김xx</td>
                </tr>
                <tr>
                    <th>휴대전화번호</th>
                    <td>010-0000-0000</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>[00000] 경기도 의정부시 00로 000 000-000</td> 
                </tr>
                <tr>
                    <th>배송 시 요청사항</th>
                    <td>부재 시 연락주세요.</td>
                </tr>
            </table>
            <div class="tableName">결제 정보</div>
            <table>
                <tr>
                    <th>상품 금액</th>
                    <td>00,000원</td>
                    <th>배송비</th>
                    <td>0,000원</td>
                    <th>적립금</th>
                    <td>0,000원</td>
                </tr>
                <tr>
                    <th>총 결제 금액</th>
                    <td>00,000원</td>
                    <th>결제 방법</th>
                    <td colspan="3">신용카드</td>
                </tr>
            </table>
            <div class="tableName">배송 조회</div>
            <table>
                <tr>
                    <th>택배사</th>
                    <td></td>
                    <th>운송장번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th>배송 상태</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="2">처리날짜</td>
                    <td colspan="2">장소(처리상황)</td>
                </tr>
            </table>
        </div>  
        <div class="orderBtn">  
            <button class="dark">주문 취소</button> 
            <button class="bright" onclick="window.close();">닫기</button> 
        </div>          
	</div>