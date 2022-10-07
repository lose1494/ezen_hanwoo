<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/main.css">



<div class="main1">
	<div class="banner_img">
		<img alt="배너" src="/img/product/배너.png" class="banner">
	</div>
	<div class="main2">

		<div class="new best">
			<h1 class="best">추천상품</h1>
			
			<div class="img_best">
				<div class="best1">
				<c:forEach var="dto" items="${ productlist }"  end="0">
					<a href="/product/product01_1?product_idx=${ dto.product_idx }"> 
						<img alt="" src="${ dto.product_image }" style="width: 400px;" class="product_img">
						<div class="info">
							<h3>${ dto.product_name }</h3>
							<p class="mon"> 
							<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
							<fmt:formatNumber value="${num / 3}" type="number" var="price" />
							${ price }
							/100g</p>
							<p>${ dto.product_price }원 &nbsp; (300g/팩)</p>
							<p>★★★★★(0)</p>
					</a>
					</c:forEach>
					<div class="middle">
						<div class="text">

							<a href="/"> <img alt="" src="/img/product/icon1.png"
								class="icon_img1">
							</a> 
							<a href="/"> <img alt="" src="/img/product/icon_wish.png"
								class="icon_img1">
							</a>
						</div>
					</div>
				</div>

			</div>
			<c:forEach var="dto" items="${ productlist }"  begin="1" end="1">
			<div class="best2">
			
				<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
					style="width: 400px;" class="product_img">
					<div class="info">
						<h3>${ dto.product_name }</h3>
						<p class="mon">
						<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${num / 3}" type="number" var="price" />
						${ price }
						/100g</p>
						<p>${ dto.product_price }원 &nbsp; (300g/팩)</p>
						<p>★★★★★(0)</p></a>
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


		</div>
		<c:forEach var="dto" items="${ productlist }"  begin="2" end="2">
		<div class="best3">
			<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
				style="width: 400px;" class="product_img">
				<div class="info">
					<h3>${ dto.product_name }</h3>
					<p class="mon">
					<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
					<fmt:formatNumber value="${num / 3}" type="number" var="price" />
					${ price }
					/100g</p>
					<p>${ dto.product_price }원 &nbsp; (300g/팩)</p>
					<p>★★★★★(0)</p></a>
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

	</div>
</div>
</div>

<div class="gift best">

	<h1>선물세트</h1>
	

	<div class="main_product" >
		<div class="main_product2">
		
		<c:forEach var="dto" items="${ productlist }"  >
	<c:if test="${ dto.product_category == '선물세트'}">
	<div class="gift1">
			<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
				style="width: 300px; height: 230px;" class="product_img">
				
					<h3>${ dto.product_name }</h3>
					<p>${ dto.product_price }원 &nbsp; (상세페이지 참조.)</p>
					<p class="star1">★★★★★(0)</p></a>
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
			</c:if>
</c:forEach>
		</div>
		
		</div>
	

	</div>
	<!-- <div class="gift1">
		<a href="/"> <img alt="" src="/img/product/15만원세트.png"
			style="width: 300px; height: 230px;" class="product_img">
			<div>
				<h3>한우 구이용 세트</h3>
				<p>150,000 &nbsp; (상세페이지 참조.)</p>
				<p class="star2">★★★★★(0)</p></a>
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


</div>
<div class="gift1">
	<a href="/"> <img alt="" src="/img/product/28만원세트.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div>
			<h3>한우 구이용 세트</h3>
			<p>280,000 &nbsp; (상세페이지 참조.)</p>
			<p class="star2">★★★★★(0)</p></a>
	<div class="middle">
		<div class="text">
			<a href="/"> <img alt="" src="/img/product/icon1.png"
				class="icon_img1">
			</a> <a href="/"> <img alt="" src="/img/product/icon_wish.png"
				class="icon_img1">
			</a>
		</div>
	</div>
</div> -->

<!-- 
</div>
<div class="gift1">
	<a href="/"> <img alt="" src="/img/product/40만원세트.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div>
			<h3>한우 특수부위 세트</h3>
			<p>400,000 &nbsp; (상세페이지 참조.)</p>
			<p class="star2">★★★★★(0)</p></a>
	<div class="middle">
		<div class="text">
			<a href="/"> <img alt="" src="/img/product/icon1.png"
				class="icon_img1">
			</a> <a href="/"> <img alt="" src="/img/product/icon_wish.png"
				class="icon_img1">
			</a>
		</div>
	</div>
</div> -->


<div class="best">
	<h1>판매상품</h1>
	<div class="main_product">
	
		<div class="product_gift1">
		<c:forEach var="dto" items="${ productlist }"  begin="3"  end="5">
			<div class="product1">
				<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
					style="width: 300px; height: 230px;" class="product_img">
				
						<h3> ${ dto.product_name } </h3>
						<p class="mon">
						<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${num / 3}" type="number" var="price" />
						${ price }
						/100g</p>
						<p>${dto.product_price }원 &nbsp; (300g/팩)</p>
						<p>★★★★★(0)</p></a>
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
		</div>
	<div class="product_gift1">
		<c:forEach var="dto" items="${ productlist }"  begin="6"  end="8">
			<div class="product1">
				<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
					style="width: 300px; height: 230px;" class="product_img">
				
						<h3> ${ dto.product_name } </h3>
						<p class="mon">
						<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${num / 3}" type="number" var="price" />
						${ price }
						/100g</p>
						<p>${dto.product_price }원 &nbsp; (300g/팩)</p>
						<p>★★★★★(0)</p></a>
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
		</div>
	<div class="product_gift1">
		<c:forEach var="dto" items="${ productlist }"  begin="9"  end="11">
			<div class="product1">
				<a href="/product/product01_1?product_idx=${ dto.product_idx }"> <img alt="" src="${ dto.product_image }"
					style="width: 300px; height: 230px;" class="product_img">
				
						<h3> ${ dto.product_name } </h3>
						<p class="mon">
						<fmt:parseNumber value = "${ dto.product_price  }"  var = "num" integerOnly="true" />
						<fmt:formatNumber value="${num / 3}" type="number" var="price" />
						${ price }
						/100g</p>
						<p>${dto.product_price }원 &nbsp; (300g/팩)</p>
						<p>★★★★★(0)</p></a>
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
		</div>
	</div>
	<!-- 	
<div class="main_product2">
	<div class="product4">
		<a href="/"> <img alt="" src="/img/product/안창살2.png"
			style="width: 300px; height: 230px;" class="product_img">
			<div class="info4">
				<h3>한우 [1++No.9]안창살</h3>
				<p class="mon">0,000원/100g</p>
				<p>00,000원 &nbsp; (300g/팩)</p>
				<p>★★★★★(0)</p></a>
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
</div>

<div class="product5">
	<a href="/"> <img alt="" src="/img/product/양지2.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div class="info2">
			<h3>한우 [1++No.9]양지</h3>
			<p class="mon">0,000원/100g</p>
			<p>00,000원 &nbsp; (300g/팩)</p>
			<p>★★★★★(0)</p></a>
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
</div>
<div class="product6">
	<a href="/"> <img alt="" src="/img/product/사태2.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div class="info2">
			<h3>한우 [1++No.9]사태</h3>
			<p class="mon">0,000원/100g</p>
			<p>00,000원 &nbsp; (300g/팩)</p>
			<p>★★★★★(0)</p></a>
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

</div>
</div>
<div class="main_product2">
	<div class="product7">
		<a href="/"> <img alt="" src="/img/product/홍두깨2.png"
			style="width: 300px; height: 230px;" class="product_img">
			<div class="info4">
				<h3>한우 [1++No.9]장조림</h3>
				<p class="mon">0,000원/100g</p>
				<p>00,000원 &nbsp; (300g/팩)</p>
				<p>★★★★★(0)</p></a>
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

</div>
<div class="product8">
	<a href="/"> <img alt="" src="/img/product/불고기2.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div class="info2">
			<h3>한우 [1++No.9]불고기</h3>
			<p class="mon">0,000원/100g</p>
			<p>00,000원 &nbsp; (300g/팩)</p>
			<p>★★★★★(0)</p></a>
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

</div>
<div class="product9">
	<a href="/"> <img alt="" src="/img/product/육전2.png"
		style="width: 300px; height: 230px;" class="product_img">
		<div class="info2">
			<h3>한우 [1++No.9]육전</h3>
			<p class="mon">0,000원/100g</p>
			<p>00,000원 &nbsp; (300g/팩)</p>
			<p>★★★★★(0)</p></a>
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
 -->
</div>
</div>
