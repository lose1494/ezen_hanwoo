<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" href="/css/mypage/cart.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  
  <div class="wrap">
  <div class="container">
    <h1>장바구니</h1>
    <div class="list">
      <table id="cart_table">
        <tr>
          <th><input type="checkbox" name="all" onclick="allselect(this.checked);" /></th>
          <th></th>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
         <!--  <th>추가금액</th> -->
          <th>총금액</th>
          <th>적립금</th>
          <th>삭제/관심상품</th>
        </tr>
       
       <!--  <tr>
        
          <td><input type="checkbox" /></td>
          <td><img src="https://via.placeholder.com/80" alt=""></td>
          <td>한우 살치살</td>
          <td>00000원</td>
          <td><input type="number" value="1" min="1" max="10"> <button>변경</button></td>
          <td>0원</td>
          <td>00000원</td>
          <td>0원</td>
          <td class="icon"><img src="/img/mypage/x.png" style="width:40px;"><img src="/img/mypage/heart.png" style="width:35px;"></td>
         
        </tr> -->
      </table>
    </div>
    <div class="flexDiv">
      <div class="button_area">
        <button onclick = "location.href = 'http://localhost:8090/index'" >계속 쇼핑하기</button>
        <button onclick="delect_Cart_check(this)" >선택상품 삭제하기</button>
        <button onclick="delete_Cart_tableall()">장바구니 비우기</button>
        <p class="text">
          <img src="https://www.hanwoodamall.com/_skin/freshsqure_210719/img/common/icon_info.png" /><span>안내사항</span>
          <br>
          <span>- 적립금 사용은 [주문서 작성 / 결제]에서 적용됩니다.</span>
        </p>
      </div>
      <div class="payment_info">
        <table>
          <tr>
            <td>주문금액</td>
            <td id="order_price">00,000원</td>
          </tr>
          <tr>
            <td >배송료</td>
            <td id="order_price2">0,000원</td>
          </tr>
          <tr>
            <td>결제금액</td>
            <td id="order_price3">00,000원</td>
          </tr>
          <tr>
            <td colspan="2">
              <button>주문하기</button>
            </td>
            <td></td>
          </tr>
        </table>
      </div>  
    </div>
  </div>
 
 </div>
 
   <script>
   function stringNumberToInt(string) {
       return parseInt(string.replaceAll(',',''));
   }
   
   
    $('input[type=number]').on('focusin', function() {
      $(this).data('val', $(this).val());
    });
    $('input[type=number]').keydown(function(key) {
      if(key.keyCode == 13) {
        var oldVal = $(this).data('val');
        var newVal = $(this).val();
        if( newVal < 1 || newVal > 10) {         
          $(this).val(oldVal);
        }else {
          $(this).val(newVal);
        }
      }
    })
    
   $(document).ready(function() {
           a();
           console.log("a는 실행되었습니다");
   }); 
   
    function a() {
        $.ajax({
            url: "/mypage/get_cart_list", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: { users_id: "1" },  // HTTP 요청과 함께 서버로 보낼 데이터
            method: "GET",   // HTTP 요청 메소드(GET, POST 등)
            dataType: "json", // 서버에서 보내줄 데이터의 타입
            success: function (data) {
            	
            	
            	  
                console.log(data);
                let htmls = "";
                const dataLen = data.length;
                const target = document.getElementById("cart_table");
               	var ca = 0;
                var total = 0;
                for (let i = 0; i < dataLen; i++) {
                	  ca = stringNumberToInt(data[i].product_price) * (data[i].cart_count);
                	  
                     total += ca;
                     const point = (ca / 100).toLocaleString();
                     
                     
                     htmls += '<tr>'
                         +'<td><input type="checkbox" name="buy_check" value="'+ data[i].product_idx +'" onclick="check_price()"  idx= "'+ i +'"></td>'                       
                         +'<td><img src = ' + data[i].product_image +'></td>'
                         + '<td value="' +data[i].product_idx +'" id= "product_name'+ i + '">' + data[i].cart_product_name + '</td>'
                         +'<td id= "product_price'+ i + '" value="' +data[i].product_price +'">' + data[i].product_price + '</td>'
                         +'<td><input type="number" id="count_input' + i + '" value="' + data[i].cart_count +'" min="1" max="10" name="num"> <button onclick="update_Cart_count(this)" idx="'+ i +'">변경</button></td>'
                         +'<td id="total_price">' + ca.toLocaleString() + '</td>'
                         +'<td>'+ point +'</td>'
                         +'<td><button onclick="delete_Cart_table(this)" idx="'+ i +'"><img src="/img/mypage/x.png" style="width:30px;"></button><img src="/img/mypage/heart.png" style="width:25px;"></td>'
                         +'</tr>'
                        
                         console.log(htmls);
                }
                
                target.insertAdjacentHTML('beforeend', htmls)
            },
       		
            error: function (data) {
                
            }
        })
    }
   
	function update_Cart_count(e){
		
		const idx = e.getAttribute('idx')
		const pdx = document.getElementById("product_name" + idx).getAttribute('value') 
		console.log(e)
		console.log(pdx)
		$.ajax({
			url: "/mypage/cart_Update",
			data :{ cart_count : parseInt( $("#count_input" + idx).val()),
					users_id : "1",
					product_idx : pdx},
			method : "GET",
			dataType : "json",
			 
			success: function (data) {
				
			}
					
		})
		
	}
	function delete_Cart_table(f){
		const idx = f.getAttribute('idx')
		const pdx = document.getElementById("product_name" + idx).getAttribute('value') 
		$.ajax({
			url : "/mypage/cart_delete",
			data :{
				users_id : "1",
				product_idx : pdx},
				method : "GET",
				dataType : "json",
					success: function (data) {
						
					}
		})
		alert("삭제했습니다.");	
		document.getElementById("product_name" + idx).closest('tr').remove()
	
	}
	function delect_Cart_check() {
		   const checkboxs = document.querySelectorAll('input[name="buy_check"]:checked');
		   check_len = checkboxs.length;
		   if (check_len <1) {
		      alert("선택된 품목이 없습니다");
		      return;
		   }
		   console.log(checkboxs);
		   for (var i = 0; i < check_len; i++) { 	
		      const pdx = checkboxs[i].value;
		      console.log(checkboxs[i]);
		      
		      $.ajax({
		        url: "/mypage/cart_delete",
		        
		        data: {
		          users_id: "1",
		          product_idx: pdx
		        },
		        method: "GET",
		        dataType: "text",
		        async : false,
		        success: function (data) {
		        	checkboxs[i].closest('tr').remove();
		          	
		           console.log(checkboxs[i]);

		         },
		        error: function (e) {
		           console.log(e)
		        }
		      })
		   }
		 }
	function delete_Cart_tableall(){
		$.ajax({
			url : "/mypage/cart_deleteall",
			data :{
				users_id : "1"
			},
				method : "GET",
				dataType : "json",
				
					success: function (data) {
						
					}
		})
		alert("삭제했습니다.");	
		location.reload();
	
	}
	// bool = this.checked : name이 all인 체크박스의 체크속성( ture, false )
	
	function allselect(bool){
		var chks = document.getElementsByName("buy_check");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = bool;
		}
	}
	function check_price(){
	
	 	var ca = 0;
        var total = 0;
        var total2 = 0;
		const checkboxs = document.querySelectorAll('input[name="buy_check"]:checked');
		
		
		
		
		/* ca = stringNumberToInt(pdx) * (cot); */
      	  for(let i = 0; i< checkboxs.length; i++ ){
		 /* ca = stringNumberToInt(data[i].product_price) * (data[i].cart_count); */
		const idx = checkboxs[i].getAttribute('idx')
		const pdx = document.getElementById("product_price" + idx).getAttribute('value')	
		const cot = document.getElementById("count_input" + idx).getAttribute('value')
		const cup = "5,000"
		console.log(pdx);
		console.log(cot);
		console.log(document.getElementById("product_price" + idx).getAttribute('value'));
		ca = stringNumberToInt(pdx) * (cot);
		cpa = stringNumberToInt(cup);
		console.log(ca);
         total += ca;
         total2 = total + cpa;
		console.log(cup);
      	  }
		if(checkboxs.length > 0 ){
			console.log("1122");
			document.getElementById("order_price").innerText = total.toLocaleString() + "원";
			document.getElementById("order_price2").innerText = cpa.toLocaleString() + "원";
			document.getElementById("order_price3").innerText = total2.toLocaleString() + "원";
			console.log("112233");
		}
		
	}
  </script>
  