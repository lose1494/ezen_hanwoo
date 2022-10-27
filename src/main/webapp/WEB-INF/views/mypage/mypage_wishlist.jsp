<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

 	<div class="wrap">
        <h3>관심상품</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th> </th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th> </th>
                </tr>
                <c:forEach var="dto" items="${ wishlist }">
                <tr>
                	<input type="hidden" name="product_idx" value="${ dto.product_idx }">
                    <td><img src="${ dto.product_image }" alt=""></td>
                    <td class="product_name">${ dto.product_name }</td>
                    <td>${ dto.product_price }원</td>
                    <td class="list_count">${ dto.wish.list_count }</td>
                    <td><input type="checkbox" value="${ dto.wish.list_idx }"></td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="mypageButton">
            
            <button class="bright" onclick="deleteAll()">전체상품 삭제</button>
            <button class="bright margin" onclick="deleteWish()">선택상품 삭제</button>
                          
            <button class="dark" onclick="insertCart()">선택상품 장바구니</button>
        </div>
        <div class="pageNav">
       		<a href="/mypage/mypage_wishlist?page=1">처음</a>
       		<a href="/mypage/mypage_wishlist?page=${ page-1 }">이전</a>
       		<c:forEach var="pageNum" begin="1" end="${ pageNum }">
       			<a href="/mypage/mypage_wishlist?page=${ pageNum }">${ pageNum }</a>
       		</c:forEach>
            <a href="/mypage/mypage_wishlist?page=${ page+1 }">다음</a>
            <a href="/mypage/mypage_wishlist?page=${ pageNum }">마지막</a>
        </div>
    </div>
    
    <script>
        $(function() {
            $('.pageNav a').each(function() {
            	console.log($(this).text());
            	if($(this).text() == '이전' && "${page}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${page}" == "${pageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ page }" ) {
                    $(this).removeAttr('href');
                }
            })
        })
        
        function deleteWish() {
		   const checkboxs = document.querySelectorAll('input[type=checkbox]:checked');
		   check_len = checkboxs.length;
		   if (check_len <1) {
		      alert("선택된 품목이 없습니다");
		      return;
		   }
		   console.log(checkboxs);
		   for (var i = 0; i < check_len; i++) { 	
		      const ldx = checkboxs[i].value;
		      console.log(ldx);		      
		      $.ajax({
		        url: "/mypage/deleteWish",
		        
		        data: {
		          list_idx: ldx
		        },
		        method: "GET",
		        dataType: "text",
		        async : false,
		        success: function (data) {
		        	console.log(data);
		        	checkboxs[i].closest('tr').remove();
		         
		         },
		        error: function (e) {
		         	alert("오류가 발생했습니다.");
		        }
		      })
		   }
		 };
	function deleteAll(){
		var con = confirm("관심상품을 전부 삭제하시겠습니까?");
		if(con) {
			$.ajax({
				url : "/mypage/deleteWishall",
				data :{users_id : "1"},
				method : "GET",
				dataType : "json",					
				success: function (data) {
					
				}
			})
			alert("삭제했습니다.");	
			location.reload();
		}	
	};
	
	function insertCart(){
		for(var i=0; i<${wishCount}; i++) {
			if($('input[type=checkbox]').eq(i).is(":checked")) {
				console.log(Number($(".list_count").eq(i).text()));
 				console.log($('.product_name').eq(i).text());
				$.ajax({
			 		url: "/mypage/cartdb",
			 		dataType: "text",
			 		data : {
			 				cart_count : Number($('.list_count').eq(i).text()),
			 				cart_product_name : $('.product_name').eq(i).text(),
			 				product_idx : $('input[name=product_idx]').eq(i).val()
			 		},
				success: function(data){
			        console.log(data);
			     	
			 	},
			 	error : function(data){
			 		console.log("123213123");
			 	}
			 	})
			}
			
		}
		var goCart = confirm("상품이 장바구니에 담겼습니다. 바로 확인하시겠습니까?");
        if( goCart == true ) {
            location.href='/mypage/mypage_cart';
        }
	 	
    }
    </script>