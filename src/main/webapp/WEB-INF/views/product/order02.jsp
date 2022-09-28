<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/product/order.css">
<link rel="stylesheet" href="/css/common.css">    
    
    <div class="wrap">
       <h2>주문완료</h2>
       <div class="productTable">
            <p>주문이 완료되었습니다. 이용해 주셔서 감사합니다. <br>
                주문 내역은 [마이페이지>주문내역]에서 확인 가능합니다.
            </p>
            <table>
                <tr>
                    <td></td>
                    <td>상품명</td>
                    <td>가격</td>
                    <td>수량</td>
                    <td>배송비</td>
                    <td>적립금 사용</td>
                    <td>총금액</td>
                </tr>
                <tr>
                    <td><img src="https://via.placeholder.com/80" alt=""></td>
                    <td>한우 살치살</td>
                    <td>00,000원</td>
                    <td>1개</td>
                    <td>0,000원</td>
                    <td>0,000원</td>
                    <td>00,000원</td>
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
                    <th>결제 방법</th>
                    <td>신용카드</td>
                </tr>
                <tr>
                    <th>결제 금액</th>
                    <td>00,000원</td>
                </tr>
            </table>
        </div>  
        <div class="orderBtn">
            <button class="bright">주문내역 확인</button>   
            <button class="bright">쇼핑 계속하기</button> 
            <button class="bright">메인으로 이동</button>
        </div>          
	</div>