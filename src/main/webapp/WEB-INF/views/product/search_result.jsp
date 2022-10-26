<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	

<link rel="stylesheet" href="/css/product/search_result.css">
<link rel="stylesheet" href="/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="wrap">
	<h1>검색결과</h1>
	<form action="search_product">
		<div class="search_condition">
			<input type="text" name="word" placeholder="검색어를 입력해 주세요." id="text_input" value="${ word }">
			<button class="search_btn">검색</button>
		</div>
		<div class="list">
			<table>
				<tr>
					<td>카테고리</td>
					<td>ALL(0)</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="search_result">
			<p>상품이 
				<c:choose>
					<c:when test="${ word eq '' || searchList eq null }">
						0
					</c:when>
					<c:otherwise>
						${searchCount}
					</c:otherwise>
				</c:choose>
				개 있습니다.
				</p>
			<select class="sort" name="sort" onchange="this.form.submit()">
				<option value="select" <c:if test="${ sort eq 'select' }">selected</c:if> >==선택해 주세요==</option>
				<option value="star_rating" <c:if test="${ sort eq 'star_rating' }">selected</c:if>>별점순
				<option value="price_high" <c:if test="${ sort eq 'price_high' }">selected</c:if>>높은가격순</option>
				<option value="price_row" <c:if test="${ sort eq 'price_row' }">selected</c:if>>낮은가격순</option>
			</select>
		</div>
	</form>

	<c:choose>
		<c:when test="${ word eq '' || searchList eq null || searchList eq '[]' }">
			<div class="product">검색결과가 없습니다.</div>
		</c:when>
		<c:otherwise>
			<div class="product">
				<div class="img_best">
					<c:forEach var="dto" items="${ searchList }">				
					<div class="best1">	
						<a href="/product/product01_1?product_idx=${ dto.product_idx }">
						<img alt="" src="${ dto.product_image }" class="product_img">
								<h3>${ dto.product_name }</h3>
								<c:if test="${ dto.product_category ne '선물세트' }">
								<p class="mon">
								<fmt:parseNumber value = "${ dto.product_price }"  var = "num" integerOnly="true" />
								<fmt:formatNumber value="${num / 3}" type="number" var="price" />
								${ price }원/100g</p>
								</c:if>
								<p>${ dto.product_price }원 &nbsp; (${ dto.product_gram }/팩)</p>
								<p>
									<span class="starRating-base gray">
									<i class="fa-solid fa-star"></i>                       
									<i class="fa-solid fa-star"></i>                       
									<i class="fa-solid fa-star"></i>                       
									<i class="fa-solid fa-star"></i>                       
									<i class="fa-solid fa-star"></i>
									</span>
									<b>${ dto.reviewDto.starRating }</b>(${ dto.reviewDto.count })
								</p></a>
						<div class="middle">
							<div class="text">

								<a href="/"> <img alt="" src="/img/product/icon1.png"
									class="icon_img1">
								</a> <a href="/"> <img alt="" src="/img/product/icon_wish.png"
									class="icon_img1">
								</a>
							</div>
						</div>		
					</div>	
					</c:forEach>
					<c:if test="${fn:length(productlist) % 3 == 2 }">
						<div class="best1"></div>
					</c:if>					
				</div>
			</div>
			<div class="pageNav">
				<a href="/product/search_product?word=${ word }&sort=${ sort }&page=1">처음</a>
				<a href="/product/search_product?word=${ word }&sort=${ sort }&page=${ page-1 }">이전</a>
				<c:forEach var="pageNum" begin="1" end="${ pageNum }">
					<a href="/product/search_product?word=${ word }&sort=${ sort }&page=${ pageNum }">${ pageNum }</a>
				</c:forEach>
				<a href="/product/search_product?word=${ word }&sort=${ sort }&page=${ page+1 }">다음</a>
				<a href="/product/search_product?word=${ word }&sort=${ sort }&page=${ pageNum }">마지막</a>
			</div>
		</c:otherwise>
	</c:choose>	
</div>

<script>
	console.log('${ searchList }');
	$(function() {
            $('b').each(function() {
                for(i=0; i<$(this).text(); i++) {
                $(this).closest('p').find('.fa-star').eq(i).addClass('gold');
                } 
            })
	})
	
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
</script>