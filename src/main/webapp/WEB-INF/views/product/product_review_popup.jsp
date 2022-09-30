<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <link rel="stylesheet" href="/css/product/product_review_popup.css">

<div class="review_wrap">
<form action="">
<label class="name">리뷰 작성</label>
<hr>
<img alt="#" src="사진추가"> <p>상품이름추가</p>

<label class="name">상품만족도</label>
<p> ㅇㅇㅇ님, 상품은 어땠나요? </p>





<label class="name">리뷰작성</label>
<p>상품에 대해 작성해주세요</p>


<label class="name">사진첨부</label>
<p>도움이 되는 사진을 첨부해주세요.</p>
<div id='image_preview'>
	<input type='file' id='btnAtt' multiple='multiple'/>
	<div id='file_upload' 
	      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
</div>

	<button id="confirm">등록하기</button>
</form>
</div>