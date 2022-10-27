<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/product/product_popup.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="wrap">
	<form action="reviewWrite" method="post" enctype="multipart/form-data">
		<div class="name dark">리뷰 작성</div>
		<p><img alt="" src="${ product.product_image }"> <span>${ product.product_name }</span></p>

		<div class="name">상품만족도</div>
		<p> ${ user.users_name }님, 상품은 어땠나요? </p>
		<span class="starRating-base gray">
			<i class="fa-solid fa-star" value=1></i>                       
			<i class="fa-solid fa-star" value=2></i>                       
			<i class="fa-solid fa-star" value=3></i>                       
			<i class="fa-solid fa-star" value=4></i>                       
			<i class="fa-solid fa-star" value=5></i>
		</span>
		<input type="hidden"  name="review_star_rating" value=1>

		<div class="name">상품리뷰</div>
		<p>상품에 대해 작성해주세요</p>
		<input type="hidden" name="product_idx" value="${ product.product_idx }"> 
		<input type="text" name="review_title" placeholder="제목"> <br>
		<textarea name="review_content" id="" cols="30" rows="10"></textarea>

		<div class="name">사진첨부</div>
		<p>도움이 되는 사진을 첨부해주세요.</p>
		<div id='image_preview'>
			<input type='file' name="file" id='btnAtt' multiple='multiple'/>
			<div id='file_upload' 
				data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
			</div>
		<div>
			<button class="dark">등록하기</button>
			<button type="button" class="bright" onclick="javascript:window.close();">취소</button>
		</div>
	</form>
</div>

<script>
	$(function() {
		$('.fa-star').click( function() {
			$(this).parent().children("i").removeClass("gold");    
			$(this).addClass("gold").prevAll("i").addClass("gold");
			console.log($(this).attr("value"));
			$('input[name=review_star_rating]').val($(this).attr("value"));
			console.log($('input[name=review_star_rating]').val());
		});
	})
	
	
	
</script>