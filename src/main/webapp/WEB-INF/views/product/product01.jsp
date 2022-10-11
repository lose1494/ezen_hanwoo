<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/product/product01.css">
<div class="product_gift">

	<h1>${ category }</h1>
	<div class="title">
	<p class="text1">상품이 모두 ${ product_count }개 있습니다.</p>
	
	<select class="text2">
	<option>높은 가격순</option>
	<option>낮은 가격순</option>
	<option>별점순</option>
	</select>
	</div>
	<div class="product_gift1">
	<c:forEach var="dto" items="${ productlist }" end="2">
	<div class="gift1">
		<a href="/product/product01_1?product_idx=${ dto.product_idx }">
					<img alt="" src="${ dto.product_image }"style="width:300px; height:230px;" class="product_img">
				
					<h3>${ dto.product_name }</h3>
					<c:if test="${dto.product_category != '선물세트' }">
					<p class="mon">
					<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
					<fmt:formatNumber value="${num / 3}" type="number" var="price" />
					${ price }
					/100g</p>
					</c:if>
					<p>${ dto.product_price }원</p>
					
					<p class="star1">★★★★★(0)</p>
					</a>
				
						  <div class="middle">
				  <div class="text">
				  <a href="/">
					<img alt="" src="/img/product/icon1.png" class="icon_img1"  >
					</a>
					<a href="/">
					<img alt="" src="/img/product/icon_wish.png" class="icon_img1" >
					</a>
				  </div>
				  </div>
				  </div>
	</c:forEach>	  
	

				 </div>
				 <div class="product_gift2">
				 	<c:forEach var="dto" items="${ productlist }" begin="3" end="5">
	<div class="gift2">
		<a href="/product/product01_1?product_idx=${ dto.product_idx }">
					<img alt="" src="${ dto.product_image }"style="width:300px; height:230px;" class="product_img">
				
					<h3>${ dto.product_name }</h3>
					<c:if test="${dto.product_category != '선물세트' }">
					<p class="mon">
					<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
					<fmt:formatNumber value="${num / 3}" type="number" var="price" />
					${ price }
					/100g</p>
					</c:if>
					<p>${ dto.product_price }원</p>
					
					<p class="star1">★★★★★(0)</p>
					</a>
				
						  <div class="middle">
				  <div class="text">
				  <a href="/">
					<img alt="" src="/img/product/icon1.png" class="icon_img1"  >
					</a>
					<a href="/">
					<img alt="" src="/img/product/icon_wish.png" class="icon_img1" >
					</a>
				  </div>
				  </div>
				  </div>
	</c:forEach>	  
	</div>
		 <div class="product_gift2">
				 	<c:forEach var="dto" items="${ productlist }" begin="6">
	<div class="gift2">
		<a href="/product/product01_1?product_idx=${ dto.product_idx }">
					<img alt="" src="${ dto.product_image }"style="width:300px; height:230px;" class="product_img">
				
					<h3>${ dto.product_name }</h3>
					<p class="mon">
					<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
					<fmt:formatNumber value="${num / 3}" type="number" var="price" />
					${ price }
					/100g</p>
					<p>${ dto.product_price }원</p>
					
					<p class="star1">★★★★★(0)</p>
					</a>
				
						  <div class="middle">
				  <div class="text">
				  <a href="/">
					<img alt="" src="/img/product/icon1.png" class="icon_img1"  >
					</a>
					<a href="/">
					<img alt="" src="/img/product/icon_wish.png" class="icon_img1" >
					</a>
				  </div>
				  </div>
				  </div>
	</c:forEach>	  
	</div>
				 </div>
