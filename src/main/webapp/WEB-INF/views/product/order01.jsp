<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" href="/css/product/order.css">
<link rel="stylesheet" href="/css/common.css">

	<div class="wrap">
       <h2>주문하기</h2>
       <div class="productTable">
            <div>옵션 및 수량 변경은 장바구니에서 가능합니다.
                <button class="dark">장바구니 가기</button>
            </div>
            <table id="order_table">
                <tr>
                    <td></td>
                    <td>상품명</td>
                    <td>가격</td>
                    <td>수량</td>
                    <td>총금액</td>
                    <td>적립금</td>
                    <td></td>                  
                </tr>
                <c:forEach var="pro" items="${ orderList }" varStatus="status">
                    <tr>
                        <input type="hidden" name="product_idx" value="${ pro.product_idx }">
                        <td><img src="${ pro.product_image }" alt=""></td>
                        <td class="proName">${ pro.product_name }</td>
                        <td>${ pro.product_price }원</td>
                        <td class="proCount">${ pro.cart_count }</td>
                        <fmt:parseNumber value = "${ pro.product_price }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${ num * pro.cart_count }" type="number" var="price" />
                        <fmt:formatNumber value="${ num * pro.cart_count / 100 }" type="number" var="point" />
                        <td class="price">${ price }원</td>
                        <td class="proPoint">${ point }원</td>
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
                        <td id="phone_td" value="${user.users_name }">
                        ${ user.users_phone }
                        </td>
                    </tr>
                </table>
                <div class="tableName">배송지 정보</div>
                
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
                            <td><input type="text" name="name" id="recip"></td>
                        </tr>
                        <tr>
                            <th>휴대전화번호</th>
                            <td><input type="text" name="phone" id="phone"></td>
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
                            <td><input type="text" name="orderRequest" id="orderRequest"></td>
                        </tr>
                    </table>
               
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
                            <td><button class="dark" onclick="allPoint()" id="point_btn">전액사용</button></td>
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
                        <td> 5,000 원</td>
                    </tr>
                    <tr>
                        <td>사용 적립금</td>
                        <td>(-)<input type="text" id="outputPoint" value="0" readonly> 원</td>
                    </tr>
                    <tr>
                        <td>총 결제 금액</td>
                        <td class="total"></td>
                    </tr>
                </table>
                <div class="tableName">결제 수단</div>
                <table>
                    <tr><td><input type="radio" name="paymentMethod" value="card" checked> 신용카드</td></tr>
                    <tr><td><input type="radio" name="paymentMethod" value="trans"> 계좌이체</td></tr>
                    <tr><td><input type="radio" name="paymentMethod" value="vbank"> 가상계좌</td></tr>
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
            if($('input[name=address]:checked').val() == 'default') {
                $('.orderTable input[name=name]').val('${user.users_name}');
                $('.orderTable input[name=phone]').val('${user.users_phone}');
                $('.orderTable input[name=address1]').val('${user.users_address1}');
                $('.orderTable input[name=address2]').val('${user.users_address2}');
                $('.orderTable input[name=address3]').val('${user.users_address3}');
            }else if ($(this).val() == 'new') {
                for(var i=0; i<$('.orderTable input[type=text]').length-1; i++) {
                    $('.orderTable input[type=text]').eq(i).val('');
                }
            }
        });

    // $(document).ready(function() {
    	
    //  	document.getElementById("phone_td").innerText = phone_change( "${ user.users_phone }" );
        
	// 	  }); 
    // function phone_change(num){
    // 	var result = num.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
    //    	return result;
    // 	}
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
                $(this).val(Number( $(this).val()));
            } else {              
                $(this).val( userPoint );
            }
            var outputPoint = $('#outputPoint').val($(this).val());
            var sum = 0;
            // console.log($("#paymentTable tr:eq(0) > td:eq(1)").text());
            for( var i=0; i<2; i++) {
                sum += stringNumberToInt($("#paymentTable").find("tr").eq(i).find("td:eq(1)").text());
            };
            sum -= stringNumberToInt($(this).val());
            console.log($("#paymentTable tr:eq(3) > td:eq(1)").text());
            $(".total").text(sum.toLocaleString()+'원');
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
            $("#paymentTable tr:eq(3) > td:eq(1)").text((sum-userPoint)+'원');
        }

        function check() {
            if($('input[type=checkbox]').is(':checked') ) {                
                payment();
            }else {
                alert("구매진행에 동의해주세요.");
            }
        }

        function getYyMmDdMmSsToString(date)
        {
			var dd = date.getDate();
			var mm = date.getMonth()+1; //January is 0!
		
			var yy = date.getYear();
			if(yy>=100){yy=yy-100} if(yy<10){yy='0'+yy}
			if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
			
			yy = yy.toString();
			mm = mm.toString();
			dd = dd.toString();
			
			var h = date.getHours();
			var m = date.getMinutes();
			var s = date.getSeconds();

			if(h<10){h='0'+h} if(m<10){m='0'+m} if(s<10){s='0'+s}
			h = h.toString();
			m = m.toString();
			s = s.toString();
		
			var s1 = yy+mm+dd+h+m+s;
			return s1;
        }

        function payment(data) {
            var date = new Date();
            console.log(getYyMmDdMmSsToString(date));            
            if("${orderCount}" <= 1 ) {
            	var proName = $('.proName').eq(0).text();
            }else{
            	var proName = $('.proName').eq(0).text()+" 외 ${orderCount-1}건";
            }
            var arr1 = [];
            var arr2 = [];
            var arr3 = [];
            var getPoint = [];
            var getPointSum = 0;
            for(i=0; i<'${orderCount}'; i++) {
                arr1.push($('input[name=product_idx]').eq(i).val());
                arr2.push(Number($('.proCount').eq(i).text()));
                arr3.push($('.price').eq(i).text().split('원')[0]);
                getPoint.push(stringNumberToInt($('.proPoint').eq(i).text()));
                getPointSum += getPoint[i];
            }
            console.log(getPoint);
            var users_point = "${user.users_point}" - stringNumberToInt($('#inputPoint').val()) + getPointSum;
            console.log(users_point);

            let IMP = window.IMP;
            IMP.init('imp34801804');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
            IMP.request_pay({// param
                pg: "html5_inicis.INIpayTest", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
                pay_method: $('input[name=paymentMethod]:checked').val(), //지불 방법
                merchant_uid: getYyMmDdMmSsToString(date), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
                name: proName, //결제창에 노출될 상품명
                amount: 100,
                	//stringNumberToInt($('.total').text()), //금액
                buyer_name: $('input[name=name]').val(),
                buyer_tel: $('input[name=phone]').val(),
                buyer_postcode: $('input[name=address1]').val(),
                buyer_addr: $('input[name=address2]').val()+","+$('input[name=address3]').val(),
            }, function (rsp) { // callback
                if (rsp.success) {
                    var addr = rsp.buyer_addr.split(',');
                    var method = "";
                    if( rsp.pay_method == 'card') {
                        method = "신용카드";
                    } else if ( rsp.pay_method == 'trans' ) {
                        method = "계좌이체";
                    } else if ( rsp.pay_method == 'vbank' ) {
                        method = "가상계좌";
                    };

                    $.ajax({
                    	type: 'post',
                    	url: '/product/paymentOrder',
                    	data: {
                			no : rsp.merchant_uid,
                		    total_price : rsp.paid_amount,
                			comment : $('input[name=orderRequest]').val(),
                			name : rsp.buyer_name,
                			address1 : rsp.buyer_postcode,
                			address2 : addr[0],
                            address3 : addr[1],
                            phone : rsp.buyer_tel,
                            product_name : rsp.name,
                            use_point : stringNumberToInt($('#inputPoint').val()),
                            get_point : getPoint,
                            product_idx : arr1,
                            product_count : arr2,
                            product_price : arr3,
                            pay_method : method,
                            users_point : users_point
                		},
                    	success: function(data) {
                    		console.log(data);
                            location.href = '/product/order02?order_no='+rsp.merchant_uid;
                    	}
                 
                    });
                    // alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
                } else {
                    alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
                }
            });
        }
        		 
             
            
   	
    </script>