<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="/css/product/order.css">
<link rel="stylesheet" href="/css/common.css">

	<div class="wrap">
       <h2>주문하기</h2>
       <div class="productTable">
            <div>옵션 및 수량 변경은 장바구니에서 가능합니다.
                <button class="dark">장바구니 가기</button>
            </div>
            <table>
                <tr>
                    <td></td>
                    <td>상품명</td>
                    <td>가격</td>
                    <td>수량</td>
                    <td>총금액</td>
                    <td>적립금</td>
                    <td>삭제/관심상품</td>
                </tr>
                <c:forEach var="pro" items="${ orderList }">
                    <tr>
                        <td><img src="${ pro.product_image }" alt=""></td>
                        <td>${ pro.product_name }</td>
                        <td>${ pro.product_price }원</td>
                        <td>${ pro.cart_count }</td>
                        <fmt:parseNumber value = "${ pro.product_price }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${ num * pro.cart_count }" type="number" var="price" />
                        <fmt:formatNumber value="${ num * pro.cart_count / 100 }" type="number" var="point" />
                        <td class="price">${ price }원</td>
                        <td>${ point }원</td>
                        <td class="icon"><img src="/img/mypage/x.png" alt="">
                            <img src="/img/mypage/heart.png" alt=""></td>
                    </tr>
                </c:forEach>
            </table>
       </div>
       <div class="flexDiv">
            <div class="orderTable">
                <div class="tableName">주문자 정보</div>
                <table>
                    <tr>
                        <th>성함(주문자)</th>
                        <td>${ user.users_name }</td>
                    </tr>
                    <tr>
                        <th>휴대전화번호</th>
                        <td>${ user.users_phone }</td>
                    </tr>
                </table>
                <div class="tableName">배송지 정보</div>
                <form action="">
                    <table>
                        <tr>
                            <th>배송지 선택</th>
                            <td>
                                <span class="orderRadio"><input type="radio" name="address" value="default">기본배송지</span>
                                <span class="orderRadio"><input type="radio" name="address" value="new">신규배송지</span>
                            </td>
                        </tr>
                        <tr>
                            <th>성함(수령인)</th>
                            <td><input type="text" name="name" class=""></td>
                        </tr>
                        <tr>
                            <th>휴대전화번호</th>
                            <td><input type="text" name="phone" class=""></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input type="text" name="address1" id="address1" readonly>
                            <button type="button" class="dark" onclick="inputAddress()">우편번호 찾기</button><br>
                            <input type="text" name="address2" id="address2" readonly><br>
                            <input type="text" name="address3" id="address3">
                            </td> 
                        </tr>
                        <tr>
                            <th>배송 시 요청사항</th>
                            <td><input type="text" name="orderRequest"></td>
                        </tr>
                    </table>
                </form>
                <div class="pointTable">
                    <div class="tableName">적립금 사용</div>
                    <table>
                        <tr>
                            <td>보유</td>
                            <td id="userPoint">${ user.users_point } 원</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>사용</td>
                            <td><input type="text" id="inputPoint" value="0">원</td>
                            <td><button class="dark" onclick="allPoint()">전액사용</button></td>
                        </tr>
                    </table>
                </div>
            </div>     
            <div class="paymentTable">
                <div class="tableName">결제 정보</div>
                <table id="paymentTable">
                    <tr>
                        <td>상품 합계 금액</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>배송료</td>
                        <td> 3,000 원</td>
                    </tr>
                    <tr>
                        <td>사용 적립금</td>
                        <td>(-)<input type="text" id="outputPoint" value="0" readonly> 원</td>
                    </tr>
                    <tr>
                        <td>총 결제 금액</td>
                        <td></td>
                    </tr>
                </table>
                <div class="tableName">결제 수단</div>
                <table>
                    <tr><td><input type="radio" name="paymentMethod" id=""> 신용카드</td></tr>
                    <tr><td><input type="radio" name="paymentMethod" id=""> 계좌이체</td></tr>
                    <tr><td><input type="radio" name="paymentMethod" id=""> 가상계좌</td></tr>
                </table>
                <div class="paymentCheck">
                    <input type="checkbox"> <span> 결제 정보를 확인했으며, <br>
                    &nbsp;&nbsp;&nbsp;&nbsp; 구매 진행에 동의합니다.</span>
                </div>
                <button class="dark" onclick="check()">주문하기</button>
            </div>
        </div>
	</div>


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        //전화번호 하이픈, 합계 금액, 총 결제 금액
        function hyphen(number) {
           return number.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");
        }

        $(function() {
            var phone = hyphen('${ user.users_phone }');
            $('.orderTable > table tr:eq(1) td').text(phone);
            
            var sumPrice = 0;
            
            $('.price').each(function() {
               sumPrice += stringNumberToInt($(this).text());
            });
            $('#paymentTable tr:eq(0) td:eq(1)').text(sumPrice.toLocaleString()+"원");

            var totalPrice = 0;

            for( var i=0; i<2; i++) {
                totalPrice += stringNumberToInt($("#paymentTable").find("tr").eq(i).find("td:eq(1)").text());
            };
            totalPrice -= stringNumberToInt($('#outputPoint').val());
            console.log($("#paymentTable tr:eq(3) > td:eq(1)").text());
            $("#paymentTable tr:eq(3) > td:eq(1)").text(totalPrice.toLocaleString()+'원');
        });

        //배송지 선택
        $('input[name=address]').click(function() {
            console.log($(this).val());
            if($(this).val() == 'default') {
                $('.orderTable input[name=name]').val('${user.users_name}');
                $('.orderTable input[name=phone]').val('${user.users_phone}');
                $('.orderTable input[name=address1]').val('${user.users_address1}');
                $('.orderTable input[name=address2]').val('${user.users_address2}');
                $('.orderTable input[name=address3]').val('${user.users_address3}');
            }else if ($(this).val() == 'new') {
                for(var i=0; i<$('.orderTable input[type=text]').length-1; i++) {
                    $<$('.orderTable input[type=text]').eq(i).removeAttr('value');
                }
            }
        })

        //콤마 지우고 숫자형으로 바꿈
        function stringNumberToInt(string) {
            return parseInt(string.replace(/,/g , ''));
        }

        function inputAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('address1').value = data.zonecode;
                    document.getElementById("address2").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address3").focus();
                }
            }).open();
        }
        
        //적립금 입력, 결제금액 계산
        $("#inputPoint").keyup(function(){
            $(this).val($(this).val().replace(/[^0-9]/g, ""));
            var userPoint = stringNumberToInt($('#userPoint').text());
            if( $(this).val() == '' ) {
                $(this).val(0);
            } else
            if( $(this).val() <= userPoint ) {
                $(this).val(Number( $(this).val()).toLocaleString());
            } else {              
                $(this).val( userPoint.toLocaleString() );
            }
            var outputPoint = $('#outputPoint').val($(this).val());
            var sum = 0;
            // console.log($("#paymentTable tr:eq(0) > td:eq(1)").text());
            for( var i=0; i<2; i++) {
                sum += stringNumberToInt($("#paymentTable").find("tr").eq(i).find("td:eq(1)").text());
            };
            sum -= stringNumberToInt($(this).val());
            console.log($("#paymentTable tr:eq(3) > td:eq(1)").text());
            $("#paymentTable tr:eq(3) > td:eq(1)").text(sum.toLocaleString()+'원');
        });

        function allPoint() {
            var userPoint = stringNumberToInt($('#userPoint').text());
            var sum = 0;
            for( var i=0; i<2; i++) {
              sum += stringNumberToInt($("#paymentTable").find("tr").eq(i).find("td:eq(1)").text());
            };
            console.log(sum - userPoint);
            $("#inputPoint").val(userPoint);
            $("#outputPoint").val(userPoint);
            $("#paymentTable tr:eq(3) > td:eq(1)").text((sum-userPoint).toLocaleString()+'원');
        }

        function check() {
            if($('input[type=checkbox]').is(':checked') ) {                
                location.href='/product/order02';
            }else {
                alert("구매진행에 동의해주세요.");
            }
        }
    </script>