<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/css/product/product01.css">
<div class="product_gift">

	<h1>${ category }</h1>
	<div class="title">
	<p class="text1">상품이 모두 0개 있습니다.</p>
	
	<select class="text2">
	<option>높은 가격순</option>
	<option>낮은 가격순</option>
	<option>별점순</option>
	</select>
	</div>
	<div class="product_gift1">
	<c:forEach var="dto" items="${ productlist }">
	<div class="gift1">
		<a href="/product/product01_1">
					<img alt="" src="${ dto.product_image }"style="width:300px; height:230px;" class="product_img">
				
					<h3>한우 조리용 세트</h3>
					<p>130,000 &nbsp; (상세페이지 참조.)</p>
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
				  <div class="gift1">
		<a href="/">
					<img alt="" src="/img/product/15만원세트.png"style="width:300px; height:230px;" class="product_img">
				
					<h3>한우 구이용 세트</h3>
					<p>150,000 &nbsp; (상세페이지 참조.)</p>
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
				  
				    <div class="gift1">
		<a href="/">
					<img alt="" src="/img/product/28만원세트.png"style="width:300px; height:230px;" class="product_img">
				
					<h3>한우 구이용 세트</h3>
					<p>280,000 &nbsp; (상세페이지 참조.)</p>
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
	</div>
	
	<div class="product_gift2">
	 <div class="gift1">
		<a href="/">
					<img alt="" src="/img/product/40만원세트.png"style="width:300px; height:230px;" class="product_img">
				
					<h3>한우 특수부위 세트</h3>
					<p>400,000 &nbsp; (상세페이지 참조.)</p>
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
	</div>
</div>
