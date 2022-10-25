<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/product/order.css">
<link rel="stylesheet" href="/css/common.css">    
    
    <div class="wrap">
       <h2>주문완료</h2>
       <div class="orderTable">
            <p>주문이 완료되었습니다. 이용해 주셔서 감사합니다. <br>
                주문 내역은 [마이페이지>주문내역]에서 확인 가능합니다.
            </p>
            <table id="order_table2">
                <tr>
                    <th>주문번호</th>
                    <td>${ ord.order_no }</td>                   
                </tr>
                <tr>
                    <th>상품명</th>
                    <td>${ ord.order_product_name }</td>
                </tr>
            </table>
       </div>
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
            <table>
                <tr>
                    <th>성함(수령인)</th>
                    <td id="order_recipient">${ ord.order_recipient }</td>
                </tr>
                <tr>
                    <th>휴대전화번호</th>
                    <td id="order_phone">${ ord.order_phone }</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td id="order_address">${ ord.order_address1 }, ${ ord.order_address2 } ${ ord.order_address3 }</td> 
                </tr>
                <tr>
                    <th>배송 시 요청사항</th>
                    <td id="order_comment">${ ord.order_comment }</td>
                </tr>
            </table>

            <div class="tableName">결제 정보</div>
            <table>
                <tr>
                    <th>결제 방법</th>
                    <td>${ pay.pay_method }</td>
                </tr>
                <tr>
                    <th>결제 금액</th>
                    <td id="order_total">${ ord.order_total_price }원</td>
                </tr>
            </table>
        </div>  
        <div class="orderBtn">
            <button class="bright" onclick="location.href='/mypage/mypage_order'">주문내역 확인</button>   
            <button class="bright">쇼핑 계속하기</button> 
            <button class="bright" onclick="location.href='/'">메인으로 이동</button>
        </div>          
	</div>
	
	<script>
	function stringNumberToInt(string) {
        return parseInt(string.replace(/,/g , ''));
    }
    $(function() {
        console.log("${ord}");
    })
    
	// $(document).ready(function() {
    //     order();
    //     console.log("a는 실행되었습니다");
	// 	  }); 
	   
    // function order() {
    //     $.ajax({
    //         url: "/mypage/get_order_list", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
    //         data: { users_id: "${user.users_id}" },  // HTTP 요청과 함께 서버로 보낼 데이터
    //         method: "GET",   // HTTP 요청 메소드(GET, POST 등)
    //         dataType: "json", // 서버에서 보내줄 데이터의 타입
    //         success: function (data) {
    
    //             let htmls = "";
    //             const dataLen = data.length;
    //             const target = document.getElementById("order_table2");
    //            	var ca = 0;
    //             var total = 0;
    //             var total2 = 0;
    //     		const cup = "5,000"
    //     	   	console.log(data);
    //             for (let i = 0; i < dataLen; i++) {
    //             	if(data[i].cart_check == 1){
    //             	  ca = stringNumberToInt(data[i].product_price) * (data[i].cart_count);
    //             	  cpa = stringNumberToInt(cup);
    //                  total += ca;
    //                  total2 = total + cpa; 
    //                  total3 = total2 - "${user.users_point}";
    //                  const point = (ca / 100).toLocaleString();
                     
                     
    //                  htmls += '<tr>'
    //                      +'<td><img src = ' + data[i].product_image +'></td>'
    //                      + '<td value="' +data[i].product_idx +'" id= "product_name'+ i + '">' + data[i].cart_product_name + '</td>'
    //                      +'<td id= "product_price'+ i + '" value="' +data[i].product_price +'">' + data[i].product_price + '</td>'
    //                      +'<td <input type="number" id="count_input' + i + '" value="' + data[i].cart_count +'">' + data[i].cart_count +'</td>'
    //                      +'<td id="order_delivery_price">' + cpa.toLocaleString() + "원" +' </td>'
    //                      +'<td id="point1"></td>'
    //                      +'<td id="total3"></td>'
    //                      +'</tr>'
                        
           			
    //             	}
    //             }
                
    //             target.insertAdjacentHTML('beforeend', htmls)
    //         },
       		
    //         error: function (data) {
                
    //         }
    //     })
    // }
    //  $(document).ready(function() {
    //     order2();
       
	// 	  }); 
	   
    // function order2() {
    	
    //     $.ajax({
    //         url: "/mypage/get_order2_list", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
    //         data: { users_id: "${user.users_id}" },  // HTTP 요청과 함께 서버로 보낼 데이터
    //         method: "GET",   // HTTP 요청 메소드(GET, POST 등)
    //         dataType: "json", // 서버에서 보내줄 데이터의 타입
    //         success: function (data) {
    //         	 const dataLen = data.length;
            	 
    //         	for (let i = 0; i < dataLen; i++) {
            		
                 	
    //         		document.getElementById("order_recipient").innerText = data[i].order_recipient;
    //         		document.getElementById("total3").innerText =  data[i].order_total_price.toLocaleString() + "원";
    //         		document.getElementById("point1").innerText =  data[i].order_usepoint + "원";
    //         		document.getElementById("order_phone").innerText = data[i].order_phone;
    //         		document.getElementById("order_address").innerText = "(" +  data[i].order_address1 + ")" + " " + data[i].order_address2 + " " + data[i].order_address3;
    //         		document.getElementById("order_comment").innerText = data[i].order_comment;
    //         		document.getElementById("order_total").innerText = data[i].order_total_price.toLocaleString() + "원";
    //         	}
            	
    //         },
       		
    //         error: function (data) {
                
    //         }
    //     })
    // }  
   
	
	</script>