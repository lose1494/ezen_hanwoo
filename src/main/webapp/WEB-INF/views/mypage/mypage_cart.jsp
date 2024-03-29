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
          <th>총금액</th>
          <th>적립금</th>
          <th>삭제/관심상품</th>
        </tr>
   
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
				<form class="checkForm" method="post">
					<input type="hidden" name="checkList">
              		<button type="button" onclick="check_order()">주문하기</button>
				</form>
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
   }); 
   
    function a() {
        $.ajax({
            url: "/mypage/get_cart_list", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: { users_id: "1" },  // HTTP 요청과 함께 서버로 보낼 데이터
            method: "GET",   // HTTP 요청 메소드(GET, POST 등)
            dataType: "json", // 서버에서 보내줄 데이터의 타입
            success: function (data) {
            	
            	
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
		location.reload()
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
		         
		         },
		        error: function (e) {
		         
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

	
	function allselect(bool){
		var ca = 0;
        var total = 0;
        var total2 = 0;
		var chks = document.getElementsByName("buy_check");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = bool;
			
			
			const idx = chks[i].getAttribute('idx')
			const pdx = document.getElementById("product_price" + idx).getAttribute('value')
			const cot = document.getElementById("count_input" + idx).getAttribute('value')
			const cup = "5,000"
			ca = stringNumberToInt(pdx) * (cot);
			cpa = stringNumberToInt(cup);
	         total += ca;
	         total2 = total + cpa;
	       
		}
		  if(bool == true){
				document.getElementById("order_price").innerText = total.toLocaleString() + "원";
				document.getElementById("order_price2").innerText = cpa.toLocaleString() + "원";
				document.getElementById("order_price3").innerText = total2.toLocaleString() + "원";
				
		         }
		  else{
		        
		        	 document.getElementById("order_price").innerText = "0" + "원";
		 			document.getElementById("order_price2").innerText = "0" + "원";
		 			document.getElementById("order_price3").innerText = "0" + "원";
		  }  
		      
	}
	function check_price(){
	
	 	var ca = 0;
        var total = 0;
        var total2 = 0;
		const checkboxs = document.querySelectorAll('input[name="buy_check"]:checked');

      	  for(let i = 0; i< checkboxs.length; i++ ){
		
		const idx = checkboxs[i].getAttribute('idx')
		const pdx = document.getElementById("product_price" + idx).getAttribute('value')	
		const cot = document.getElementById("count_input" + idx).getAttribute('value')
		const cup = "5,000"

		console.log(document.getElementById("product_price" + idx).getAttribute('value'));
		ca = stringNumberToInt(pdx) * (cot);
		cpa = stringNumberToInt(cup);

         total += ca;
         total2 = total + cpa;

      	  }
		if(checkboxs.length > 0 ){

			document.getElementById("order_price").innerText = total.toLocaleString() + "원";
			document.getElementById("order_price2").innerText = cpa.toLocaleString() + "원";
			document.getElementById("order_price3").innerText = total2.toLocaleString() + "원";

		ca = stringNumberToInt(pdx) * (cot);
		cpa = stringNumberToInt(cup);
         total += ca;
         total2 = total + cpa;
      	  }
		if(checkboxs.length > 0 ){
			document.getElementById("order_price").innerText = total.toLocaleString() + "원";
			document.getElementById("order_price2").innerText = cpa.toLocaleString() + "원";
			document.getElementById("order_price3").innerText = total2.toLocaleString() + "원";
			
		}else{
			document.getElementById("order_price").innerText = "0" + "원";
			document.getElementById("order_price2").innerText = "0" + "원";
			document.getElementById("order_price3").innerText = "0" + "원";
		}
		
	}

	function check_order() {
		var arr = new Array();
		$('input[name=buy_check]').each(function(index, item) {
			if($(this).is(':checked')) {
				console.log($(this).val());
				arr.push($(this).val());
			}
		});
		console.log(arr);
		if( arr.length <= 0 ) {
			alert("선택된 품목이 없습니다");
		}else {
			$('input[name=checkList]').val(arr);
			console.log($('input[name=checkList]').val());
			$('.checkForm').attr('action','/mypage/cartOrder');
			$('.checkForm').submit();
		}
		
	}

  </script>
	
<!-- function update_Cart_order(){
	
	check_len = document.getElementsByName("buy_check").length;
	const checkboxs = document.querySelectorAll('input[name="buy_check"]:checked');
	if (checkboxs.length < 1) {
	      alert("선택된 품목이 없습니다");
	      
	      return;
	   }
	  for(let i = 0; i< check_len; i++ ){
		const idx = document.getElementsByName("buy_check")[i].getAttribute('idx')
		const pdx = document.getElementById("product_name" + idx).getAttribute('value')
			 
	   	$.ajax({
			url: "/mypage/check_Update",
			async  : false, 
			data :{ cart_check : (document.getElementsByName("buy_check")[i].checked == true ) ? 1 : 0 ,
					users_id : "1",
					product_idx : pdx},
			method : "GET",
			dataType : "text",
				
			success: function (data) {
			
			console.log(data + "2222");
			location.href="/product/order01"
		
			},
			
		
		})
		
	  }
	} -->
  
