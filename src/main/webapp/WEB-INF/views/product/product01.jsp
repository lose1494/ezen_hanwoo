<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <link rel="stylesheet" href="/css/product/product01.css">
<div class="wrap">
	<h1>${ category }</h1>
	<div class="title">
		<p class="text1">상품이 모두 ${ product_count }개 있습니다.</p>	
		<select class="text2">
		<option>높은 가격순</option>
		<option>낮은 가격순</option>
		<option>별점순</option>
		</select>
	</div>

	<div class="product">
		<div class="img_best">
			<c:forEach var="dto" items="${ productlist }">				
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
</div>	
	