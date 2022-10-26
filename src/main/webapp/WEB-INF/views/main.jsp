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

</div>
</div>
