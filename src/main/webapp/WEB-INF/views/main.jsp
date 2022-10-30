<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/main.css">

<div class="banner_img">
	<img alt="배너" src="/img/product/배너.png" class="banner">
</div>
<div class="wrap">
	<h1>추천상품</h1>
	<div class="new best">
		<div class="img_best">
			<c:forEach var="dto" items="${ productlist }" end="2">				
			<div class="best1">	
				<a href="/product/product01_1?product_idx=${ dto.product_idx }">
					<img src="${ dto.product_image }" class="product_img" >
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
					</p>
				</a>
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

	<h1>선물세트</h1>
	<div class="gift best">
		<div class="gift_set">
			<c:forEach var="dto" items="${ productlist }"  >
			<c:if test="${ dto.product_category == '선물세트'}">
				<div class="best1">
					<a href="/product/product01_1?product_idx=${ dto.product_idx }"> 
						<img src="${ dto.product_image }" width=300 height=230 class="product_img">							
						<h3>${ dto.product_name }</h3>
						<p>${ dto.product_price }원 &nbsp; (상세페이지 참조.)</p>
						<p>
							<span class="starRating-base gray">
							<i class="fa-solid fa-star"></i>                       
							<i class="fa-solid fa-star"></i>                       
							<i class="fa-solid fa-star"></i>                       
							<i class="fa-solid fa-star"></i>                       
							<i class="fa-solid fa-star"></i>
							</span>
							<b>${ dto.reviewDto.starRating }</b>(${ dto.reviewDto.count })
						</p>
					</a>
					<div class="middle">
						<div class="text">
							<a href="/"> 
								<img alt="" src="/img/product/icon1.png" class="icon_img1">
							</a>
							<a href="/"> 
								<img alt="" src="/img/product/icon_wish.png" class="icon_img1">
							</a>							
						</div>						
					</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>

	<h1>판매상품</h1>
	<div class="product">
		<div class="img_best">
			<c:forEach var="dto" items="${ productlist }" begin="3" end="11">				
			<div class="best1">
				<a href="/product/product01_1?product_idx=${ dto.product_idx }">
					<img alt="" src="${ dto.product_image }" class="product_img" width=300 height=230>
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
					</p>
				</a>
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
</script>