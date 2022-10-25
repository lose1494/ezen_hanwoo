<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/admin/item_revise.css">
<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품관리>상품 수정</p>
	</div>
</div> 

<div class="main_div">

	<div class="admin_list">
	<p>관리자 페이지 </p>
		<ul> 
			<li><a href="/admin/admin_main">회원목록 조회</a></li>
			<li><a href="/admin/admin_item">상품 관리</a></li>
			<li><a href="/admin/admin_order">주문 관리</a></li>
			<li><a href="/admin/admin_review">리뷰 관리</a></li>
			<li><a href="/admin/admin_inquiry">상품문의 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_faq">자주하는 질문</a></li>		
			<li><a href="/admin/admin_one2one">1:1문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
<c:forEach var="dto" items="${ item_detail }" varStatus="status">
	 <table class="member_table" >
	 <tr>
	 	<th>상품코드</th>
	 	<th>카테고리</th>
	 	<th>상품명</th>
	 	<th>상품가격</th>
	 	<th>gram</th>
	 </tr>

	 <tr>
	 	<td> 
	 		<input type="text" value="${ dto.product_idx }" name="product_idx" id="product_idx" readonly="readonly">
	 	</td>
	 	<td> 
	 		<input type="hidden" value="${ dto.product_category }"  id="product_category"/>
	 		<select id="productCategory" >
		 		<option value="선물세트">선물세트</option>
		 		<option value="구이용">구이용</option> 
		 		<option value="국거리">국거리</option>
		 		<option value="조리용">조리용</option>
	 		</select> 
	 	</td>
	 	<td> 
	 		<input type="text" name="product_name" id="product_name" value="${ dto.product_name }">
	 	</td>
	 	<td> 
	 		<input type="text" name="product_price" id="product_price" value="${ dto.product_price }">
	 	</td>
	 	<td>
	 		<input type="text" name="product_gram" id="product_gram" value="${ dto.product_gram }" >
	 	</td>
	 </tr>

</table>
<table class="member_table1" >
	 <tr>
		<th>이미지  </th>
	 	<th>상세설명</th>
	 </tr>
	 
	 <tr>
	 	<td> 
	 		<input id="uploadImage" type="file"  accept="image/jped,image/gif,image/png">
	 	</td>
	 	<td> 
	 		<input id="uploadImage1" type="file" accept="image/jped,image/gif,image/png" >
	 	</td>
	 </tr>
	 
	 
	 <tr>
	 	<td>
	 		<img width="500" id="product_image" src="${dto.product_image }"/> 
	    </td> 
	 	<td>
	 		<img width="500" id="product_image_ex" src="${ dto.product_image_ex }"/> 
	 	</td>
	 </tr>

	</table>
	</c:forEach>
	 <div class="confirm_bar">
	 	<button id="confirm_btn">수정</button>
	</div>

	 </div>
</div>	

<script>
//product_category
 	var category = $("#product_category").val();
	var optionTarget =$("#productCategory")[0].children;
 
	for (var i = 0; i < optionTarget.length; i++) {
		if (optionTarget[i].innerText === category) {
			optionTarget[i].setAttribute("selected", "selected");
		} 
	}
	
//img load
	var imgData = {};
		
		$('#uploadImage').on('change', function(e) {
			var fileData = e.currentTarget.files[0];
			var previewTargetId = "product_image";
			
			var previewTarget = document.getElementById(previewTargetId);
			
			PreviewImage(fileData, previewTarget, previewTargetId);
		});
		$('#uploadImage1').on('change', function(e) {
			var fileData = e.currentTarget.files[0];
			var previewTargetId = "product_image_ex";
			var previewTarget = document.getElementById(previewTargetId);
			
			PreviewImage(fileData, previewTarget, previewTargetId);
		});
		
		function PreviewImage(fileData, preview, previewTargetId) {
		    var oFReader = new FileReader();
		    oFReader.readAsDataURL(fileData);
		    oFReader.onload = function (oFReader) {
		    	preview.src = oFReader.target.result;
		    	
		    	if (previewTargetId === 'product_image_ex') {
    				imgData.uploadImage = oFReader.target.result;
		    	} else if (previewTargetId === 'product_image') {
		    		imgData.uploadImage1 = oFReader.target.result;
		    	}
		    };
		};
		
	$("#confirm_btn").click(function(){
		  var productIdx = $("#product_idx").val();
		  var productCategory = $("#productCategory").val(); //select태그 id값.val 옵션태그 value값 출력.
		  var productName = $("#product_name").val();
		  var productPrice = $("#product_price").val();
		  var productGram = $('#product_gram').val();
		  
		  var data = {
			"product_idx" : productIdx,
		    "product_image": imgData.uploadImage, 
		    "product_image_ex": imgData.uploadImage1, 
		    "product_category" : productCategory,
		    "product_name" : productName,
		    "product_price" : productPrice,
		    "product_gram" : productGram
		  };
	  
			  $.ajax({
			    async : true,
			    type : 'POST',
			    data : JSON.stringify(data),
			    url : "/admin/reviseProduct",
			    // dataType : "json",
			    contentType : "application/json; charset-UTF-8",
			    success : function(data) {
			      console.log("success", data);
			      alert("저장되었습니다.");
			      location.href='/admin/admin_item';
			    },
			    error : function(error) {
			      console.log("error", error);
			      alert("다시 시도해주세요.");
			      return;
			    } 
			  });	
			});	

</script>