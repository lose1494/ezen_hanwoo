<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/product/product01_1.css">    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <div class="wrap">
        <div class="productMain">
            <form>
                <table>
                    <tr>
                        <td><input type="hidden" name="product_idx" value="${ dto.product_idx }"></td>
                        <td colspan="2" id="product_name" value="${ dto.product_idx }" >${ dto.product_name }</td>
                    </tr>
                    <tr>
                        <td rowspan="7" id="product_img" value="${ dto.product_image }"><img src="${ dto.product_image }" alt=""></td>
                        <td>판매가</td>
                        <td id="product_price">${ dto.product_price }원</td>
                    </tr>
                    <tr>
                        <td>제품중량</td>
                        <td>${ dto.product_gram }</td>
                    </tr>
                    <tr>
                        <td>포장타입</td>
                        <td>냉장/열성형포장</td>
                    </tr>
                    <tr>
                        <td>브랜드명</td>
                        <td>이젠한우</td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td ><input type="number" max="10" min="1" value="1"  id="product_count"></td>
                    </tr>
                    <tr>
                        <td>리뷰 수</td>
                        <td>
                            <span class="starRating-fill gold">
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>
                            </span>
                            <span class="starRating-base gray">
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>                       
                                <i class="fa-solid fa-star"></i>
                            </span>
                            &nbsp; <b class="scoreAvg">${ avgScore }</b> (${ reviewCount })                       
                        </td>
                    </tr>
                    <tr>
                        <td>총 금액</td>
                        <td><span class="sumPrice">00000</span>원</td>
                    </tr>
                    <tr>
                        <td></td>  
                        <td colspan="2">
                            <div class="flexDiv">
                                <button class="bright" onclick="b()">장바구니</button>
                                <button class="bright" onclick="insertWish()">관심상품</button>
                                <button class="dark"  onclick="c()">바로구매</button>
                            </div>
                        </td>  
                    </tr>
                </table>
            </form>
        </div>
    </div>     
     
        <div class="productBar sticky-top">
            <ul>
                <li><a href="#productDetail" class="dark">상품상세정보</a></li>
                <li><a href="#productReview">상품후기</a></li>
                <li><a href="#productQna">상품문의</a></li>
                <li><a href="#productInfo">상품정보고시</a></li>
            </ul>
        </div>
    <div class="wrap">
        <div class="productDetail" id="productDetail">
            <img src="${ dto.product_image_ex }" alt="">
        </div>
        <div class="productReview" id="productReview">
            <div class="reviewInfo">
                <table>
                    <tr>
                        <td>
                            <p>전체 리뷰 수</p>
                            <p><span>${ reviewCount }</span>건</p>
                        </td>
                        <td>
                            <p><i class="fa-solid fa-star gold"></i>&nbsp; ${ avgScore }</p>
                            <form action="" method="post">
                                <input type="hidden" name="pro" value="${ dto.product_idx }">
                                <button class="dark" onclick="javascript:window.open('/product/product_review_popup?product_idx=${ dto.product_idx }','popup','width=650 height=700')">상품 리뷰 작성</button>
                            </form>
                        </td>
                        <td>
                            <div class="starGraph">
                                <div class="graphLabel">
                                    <div>아주 좋아요</div>                                  
                                    <div>맘에 들어요</div>
                                    <div>보통이에요</div>
                                    <div>그냥 그래요</div>
                                    <div>별로예요</div>
                                </div>
                                                                   
                                <div class="graphDiv">
                                <c:forEach var="bar" items="${ starGraph }" >        
                                    <div class="starBar-base">                                        
                                        <div class="starBar-fill">                                    
                                        </div>                                       
                                    </div>
                                    (<span class="reviewCount">${ bar.count }</span>)                                  
                                </c:forEach>    
                                </div>
                            </div>                                
                        </td>
                    </tr>
                </table> 
            </div>
            <div class="reviewSearch">
                <form name="search">
                    <input type="hidden" name="product_idx" value="${ dto.product_idx }">
                    <a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=1&sort=review_date#productReview">최신순</a>
                    <a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=1&sort=review_star_rating#productReview">평점순</a>
                    <span><input type="text" name="word" placeholder="키워드 검색"><button onclick="getSearchList()"><img src="/img/product/icon2.png" alt=""></button></span>  
                </form>             
            </div>
            <div class="reviewTable">
                <table>
                	<c:forEach var="review" items="${ reviewList }">
                    <form action="deleteReview" method="post">
                    <input type="hidden" name="review_idx" value="${ review.review_idx }">
                    <input type="hidden" name="review_image" value="${ review.review_image }">
                        <tr>
                            <td>
                                <div>
                                    <span class="starRating-base gray">
                                        <i class="fa-solid fa-star"></i>                       
                                        <i class="fa-solid fa-star"></i>                       
                                        <i class="fa-solid fa-star"></i>                       
                                        <i class="fa-solid fa-star"></i>                       
                                        <i class="fa-solid fa-star"></i>
                                    </span>
                                    <b class="score hide">${ review.review_star_rating }</b>
                                </div>
                            </td>
                            <td>${ review.review_id }</td>
                            <td><fmt:formatDate value="${ review.review_date }" pattern = "yyyy-MM-dd"/></td>
                        </tr>
                        <tr>
                            <td>${ review.review_title }</td>
                            <td></td>
                            <td>
                                <div class="tableBtn">
                                    <button class="dark">삭제</button>  
                                </div>
                            </td>
                        </tr>
                        <tr>	
                            <td>${ review.review_content }</td>     
                        </tr>
                        <tr>
                            <td>
                                <img src="${ review.review_image }" >                                     
                            </td>
                        </tr>
                    </form>
                    </c:forEach>
                </table>
                <div class="pageNav rev">
		       		<a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=1#productReview">처음</a>
		       		<a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=${ revPage-1 }#productReview">이전</a>
		       		<c:forEach var="revPageNum" begin="1" end="${ revPageNum }">
		       			<a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=${ revPageNum }#productReview">${ revPageNum }</a>
		       		</c:forEach>
		            <a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=${ revPage+1 }#productReview">다음</a>
		            <a href="/product/product01_1?product_idx=${ dto.product_idx }&revPage=${ revPageNum }#productReview">마지막</a>
		        </div>
            </div>
        </div>
        <div class="productQna" id="productQna">
            <table>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>답변여부</td>
                    <td>작성자</td>
                    <td>작성일</td>
                </tr>
                <c:forEach var="qna" items="${ qnaList }" varStatus="status">
                <form action="" name="qnaForm">
                    <input type="hidden" name="qna_pw" value="${ qna.qna_pw }">
                	<input type="hidden" name="qna_idx" value="${ qna.qna_idx }">
	                <tr>
	                    <td>${ qnaCount - status.index - (( qnaPage-1 ) * 5 ) }</td>
	                    <!-- <td>기타</td> -->
	                    <td class="qnaClick">
	                    <c:if test="${ qna.qna_secret == 1 }"><i class="fa-solid fa-lock"></i></c:if>
                            ${ qna.qna_title }
                        </td>
	                    <td>${ qna.qna_status }</td>
	                    <td>${ qna.qna_id }</td>
	                    <td><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></td>
	                </tr>
	                <tr>
	                    <td colspan="5" class="hide qnaDe">
	                    	<c:choose>
	                    		<c:when test="${ qna.qna_secret == 1 }">
	                    			<div class="secret">
		                    			<div class="productQ align">
	                                        <p>비밀번호를 입력해주세요.</p>                                      
	                                        <input type="password" id="user_pw"> <br>
	                                        <button type="button" class="dark" onclick="javascript:pwCheck()">확인</button>
		                    			</div>
		                    		</div>	
	                    		</c:when>
	                    		<c:otherwise>
                                    <div class="productQ">                                      
                                        <i class="fa-solid fa-circle-question"></i>
                                        ${ qna.qna_content }
                                        <div class="tableBtn">
                                            <button class="dark" onclick="javascript:form.action='/product/deleteQna'">삭제</button>  
                                        </div> 
                                    </div>
                                    <c:if test="${ qna.reply.reply_content ne null }">
                                    <div class="productA">                                   
                                        <i class="fa-solid fa-circle-info"></i>
                                        ${ qna.reply.reply_content }
                                    </div>
                                    </c:if>
	                    		</c:otherwise>
	                    	</c:choose>                                     
	                    </td>
	                </tr> 
                </form>
                </c:forEach>    
            </table> 
            <div class="qnaBtn">
                <button class="dark" onclick="javascript:window.open('/product/product_qna_popup?product_idx=${ dto.product_idx }','popup','width=650 height=700')">문의하기</button>
            </div>  
            <div class="pageNav qna">
	       		<a href="/product/product01_1?product_idx=${ dto.product_idx }&qnaPage=1#productQna">처음</a>
	       		<a href="/product/product01_1?product_idx=${ dto.product_idx }&qnaPage=${ qnaPage-1 }#productQna">이전</a>
	       		<c:forEach var="qnaPageNum" begin="1" end="${ qnaPageNum }">
	       			<a href="/product/product01_1?product_idx=${ dto.product_idx }&qnaPage=${ qnaPageNum }#productQna">${ qnaPageNum }</a>
	       		</c:forEach>
	            <a href="/product/product01_1?product_idx=${ dto.product_idx }&qnaPage=${ qnaPage+1 }#productQna">다음</a>
	            <a href="/product/product01_1?product_idx=${ dto.product_idx }&qnaPage=${ qnaPageNum }#productQna">마지막</a>
	        </div>
        </div>
        <div class="productInfo" id="productInfo">
            <table border="2">
                <tr>
                    <td>품목 또는 명칭</td>
                    <td>${ dto.product_name }</td>
                </tr>
                <tr>
                    <td>포장단위별 내용물의 용량(중량), 수량, 크기</td>
                    <td>${ dto.product_name } ${ dto.product_gram } 
                    <c:if test="${ dto.product_category ne '선물세트' }">/ 1pack</c:if>
                    </td>
                </tr>
                <tr>
                    <td>생산자(수입품의 경우 수입자를 함께 표기)</td>
                    <td>(주)이젠한우 / 경기도 의정부시 000 000</td>
                </tr>
                <tr>
                    <td>농수산물의 원산지 표시에 관한 법률에 따른 원산지 표기</td>
                    <td>국내산(한우고기)</td>
                </tr>
                <tr>
                    <td>제조연월일(포장일 또는 생산연도), 유통기한</td>
                    <td>본 상품의 제조일은 출고되는 상품에 따라 유동적이오니
                        정확한 확인은 고객센터(000-000-0000)로 문의 바랍니다. <br>
                        유통기한 : 상품 뒷면 별도표기
                    </td>
                </tr>
                <tr>
                    <td>관련법상 표시사항-축산법에 따른 등급 표시, 이력관리에 따른 표시 유무</td>
                    <td>1++등급 <br>
                        본 상품은 축산물 이력번호 표시 제품으로, 이력번호는 배송될 상품 뒷면에
                        표시되어 있습니다.
                    </td>
                </tr>
                <tr>
                    <td>상품구성</td>
                    <td>${ dto.product_name } ${ dto.product_gram }</td>
                </tr>
                <tr>
                    <td>보관방법 또는 취급방법</td>
                    <td>냉장보관(-2 ~ -10ºC) <br>
                        상품 수령 후 가급적 빠른 시일 내에 섭취하는 것을 권장드리며,
                        바로 섭취하지 않는 경우 냉장고에 보관하거나 냉동보관 바랍니다.
                    </td>
                </tr>
                <tr>
                    <td>식품 등의 표시/광고에 관한 법률에 따른 소비자안전을 위한 주의사항</td>
                    <td>1) 부정·불량 식품 신고는 국번없이 1339 <br>
                        2) 별도포장 : 방습제(인체에는 무해하나 먹지마세요) <br>
                        3) 중심부 온도가 75ºC 이상에서 3분 이상 가열되도록 조리
                    </td>
                </tr>
                <tr>
                    <td>소비자상담관련 전화번호</td>
                    <td>000-000-0000</td>
                </tr>
            </table>
        </div>
    </div>

    <script>
    
        // 별점
        $(function() {
            $('.score').each(function() {
                for(i=0; i<$(this).text(); i++) {
                $(this).closest('div').find('.fa-star').eq(i).addClass('gold');
                } 
            })
            for(i=0; i<$('.scoreAvg').length; i++) {
                $('.starRating-fill').eq(i).width(17.5 * ($('.scoreAvg').eq(i).text()));
            } 
            $('.starBar-fill').each( function(index, item) {
                if($('.reviewInfo table tr:eq(0) td:eq(0) span').text() == 0) {
                    $('.starBar-fill').width(0+'%');
                }
                $(this).width(               
                    ($('.reviewCount').eq(index).text()) / 
                    ($('.reviewInfo table tr:eq(0) td:eq(0) span').text())*100+'%');
            })        
        });
        
        //페이지
        $(function() {
            $('.rev a').each(function() {
            	if($(this).text() == '이전' && "${revPage}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${revPage}" == "${revPageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ revPage }" ) {
                    $(this).removeAttr('href');
                }
            })
            $('.qna a').each(function() {
            	if($(this).text() == '이전' && "${qnaPage}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${qnaPage}" == "${qnaPageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ qnaPage }" ) {
                    $(this).removeAttr('href');
                }
            })
        })

        //총 금액
        function stringNumberToInt(string) {
            return parseInt(string.replace(/,/g , ''));
        }

        $(function() {
            var price = stringNumberToInt("${dto.product_price}");
            $('.sumPrice').text( (price * $('input[type=number]').val()).toLocaleString()); 
            $('input[type=number]').on( 'input', function() {
                $('.sumPrice').text( (price * $('input[type=number]').val()).toLocaleString());
            })
        });

        // 문의 본문 열고닫기
        $('.qnaClick').each( function(index, item) {
            $(this).click( function() {
                if($('.productQ').eq(index).parents('td').hasClass('hide') === true) {
                    $('.productQ').parents('td').addClass('hide');
                    $('.productQ').eq(index).parents('td').removeClass('hide'); 
                }else {
                    $('.productQ').eq(index).parents('td').addClass('hide'); 
                }
                
            })
        })
        // 상품상세 바 색 변화주기
        $('.productBar a').each( function() {
            $(this).click( function() {
                $('.productBar a').removeClass('dark');
                $(this).addClass('dark');
            })
        })
        $(function() {
            $('.wrap > div').each( function(index, item) {
                $(window).scroll(function() {
                    // console.log($('.productBar ul').scrollHeight());
                    // if($(this).scrollTop() >= Math.ceil($('.wrap > div').eq(0).offset().top)
                    // && $(this).scrollTop() < Math.ceil($('.wrap > div').eq(2).offset().top)) {
                    //         $('.productBar a').removeClass('dark');
                    //         $('.productBar a').eq(0).addClass('dark');
                    // }
                    if($(this).scrollTop()+80 >= Math.ceil($('.wrap > div').eq(index+1).offset().top)) {
                            $('.productBar a').removeClass('dark');
                            $('.productBar a').eq(index).addClass('dark');
                    } 
                })
            });
        });
        
        function insertWish() {
            $.ajax({
                url: "/mypage/insertWish",
                type: "POST",
                data: {
                    product_idx : $('input[name=product_idx').val(),
                    list_count : $('#product_count').val()
                },
                success: function(data){
                    console.log(data);
                    alert(data);
                },
                error: function(data) {
                    alert("오류가 발생했습니다.");
                }
            })
        }
       
        function b(){
        	const pd_name = document.getElementById("product_name").innerText
        	const price = document.getElementById("product_price").innerText
        	const count = document.getElementById("product_count").value
        	const pdx = document.getElementById("product_name").getAttribute('value') 
     	$.ajax({
     		url: "/mypage/cartdb",
     		dataType: "text",
     		data : {
     				cart_count : count,
     				cart_product_name : pd_name,
     				product_idx : pdx,
     				product_price : price
     		},
    	success: function(data){
            console.log(data);
         	var goCart = confirm("상품이 장바구니에 담겼습니다. 바로 확인하시겠습니까?");
            if( goCart == true ) {
                location.href='/mypage/mypage_cart';
            }
     	},
     	error : function(data){
     		console.log("123213123");
     	},
     	})
        }
        console.log(document.getElementById("product_img").img);
      function c(){
    	  
    	const img = document.getElementById("product_img").value
    	const count = document.getElementById("product_count").value
      	const pdx = document.getElementById("product_name").getAttribute('value') 
      	const price = document.getElementById("product_price").innerText
      	const pd_name = document.getElementById("product_name").innerText
    	var a =  pdx  
    	var b =  count
    	var c = price
    	var d = pd_name
    	var e = img
      	localStorage.setItem("product_idx", JSON.stringify(a));
    	localStorage.setItem("product_count", JSON.stringify(b));
    	localStorage.setItem("product_price", JSON.stringify(c));
    	localStorage.setItem("product_name", JSON.stringify(d));
    	localStorage.setItem("product_image", JSON.stringify(e));
    	location.href="/product/order01"
      }
     	
        //날짜 형식 바꾸기
        function formatDate(date) {
    
            var d = new Date(date),
            
            month = '' + (d.getMonth() + 1) , 
            day = '' + d.getDate(), 
            year = d.getFullYear();
            
            if (month.length < 2) month = '0' + month; 
            if (day.length < 2) day = '0' + day; 
            
            return [year, month, day].join('-');
        
        }

        // 리뷰검색
        function getSearchList(){
            $.ajax({
                type: 'GET',
                url : "/product/reviewSearch",
                data : $("form[name=search]").serialize(),
                success : function(result){
                    //테이블 초기화
                    $('.reviewTable > table tr').empty();
                    if(result.length>=1){
                        result.forEach(function(item){
                            var revDate = new Date(item.review_date);
                            
                            console.log(revDate)
                            str="<tr>"
                                + "<td><div>"
                                + "<span class='starRating-base gray'>"
                                + "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>"    
                                + "</span><b class='score hide'>"+ item.review_star_rating +"</b>"
                                + "</div></td>"
                                + "<td>"+ item.review_id +"</td>"
                                + "<td>" + formatDate(revDate) + "</td>"
                                + "</tr><tr>" 
                                + "<td>"+ item.review_title +"</td><td></td>"
                                + "<td><div class='tableBtn'><button class='dark'>삭제</button></div></td>"
                                + "</tr><tr>"
                                + "<td>"+ item.review_content +"</td>"
                                + "</tr><tr>"
                                + "<td><img src='"+ item.review_image +"' alt=''></td>"
                                + "</tr>"
                            $('.reviewTable > table').append(str);

                        })				 
                    }
                    $('.score').each(function() {
                        for(i=0; i<$(this).text(); i++) {
                        $(this).closest('div').find('.fa-star').eq(i).addClass('gold');
                        } 
                    })
                }
            })
            
        }

        $('input[type="password"]').keydown(function() {
            if (event.keyCode === 13) {
                event.preventDefault();
                pwCheck();
            };
        });

        //상품문의 비밀글
        function pwCheck(){
            if( $('input[name=qna_pw]').val() != $('#user_pw').val()) {
                alert('비밀번호가 맞지 않습니다.');
            } else {
                $.ajax({
                    type: 'get',
                    url : "/product/qnapwCheck",
                    data : {   produt_idx : $('input[name=product_idx_ajax]').val(),
                            qna_idx : $('input[name=qna_idx]').val(),
                            user_pw : $('#user_pw').val()
                            },
                    success : function(data){
                        console.log(data);
                        $('.secret').empty();
                        str = "<div class='productQ'>"
                   					+ "<i class='fa-solid fa-circle-question'></i>"
                                    + data.qna_content
                                    + "<div class='tableBtn'><button class='dark'>삭제</button></div>"    
                                    + "</div><div class='productA'>"
                                    + "<i class='fa-solid fa-circle-info'></i>"
                                    + "안녕하세요 이젠한우입니다. <br>문의 주신 상품의 배송은 9월 22일로 예정되어 있습니다.<br>"
                                    + "이용해주셔서 감사합니다!</div>";
                                    console.log(str);
                                    $('.secret').append(str); 
                        
                    }
                })
            }
     
        }
     

    </script>