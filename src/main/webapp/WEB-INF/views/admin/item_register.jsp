<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/item_register.css">

<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>상품관리>상품 정보 등록</p>
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
	
<form action="/write_Action" method="post" name="writeForm">
	 <table class="member_table" >
	 <tr>
	 	<th>카테고리</th>
	 	<th>상품명</th>
	 	<th>상품가격</th>
	 </tr>
	 
	 <tr>
	 	<td> <select style="width:110px; height:40px; text-align: center;" id="productCategory">
	 		<option>선물세트</option>
	 		<option>구이용</option>
	 		<option>국거리</option>
	 		<option>조리용</option>
	 		 </select> 
	 	</td>
	 	<td> <input type="text" style="width:250px; height:40px;" id="productName"> 
	 	 </td>
	 	<td> <input type="text" style="width:250px; height:40px;" id="productPrice"> </td>
	 </tr>
	 
	 <tr>
	 	<th>gram</th>
	 	<th>설명</th>
	 	<th>이미지</th>
	 </tr>
	
	 <tr>
	 <td> <input type="text" id="productGram"> 
	 </td>
	<td> <input type="text" id="contentTitle"> 
	</td>
	<td> 
		<input id="uploadImage" type="file" accept="image/jped,image/gif,image/png" >
	 	 <img id="uploadPreview" style="width: 150px; height: 150px;"> 
	</td>
	 </tr>
	 
	 <tr> 
	 	<th>설명 이미지</th>
	  </tr>
	 
	 <tr>
	 	<td>  
		 	<input id="uploadImage1" type="file"  accept="image/jped,image/gif,image/png">
		 	<img id="uploadPreview1" style="width: 150px; height: 150px;">
	 	</td>
	 </tr>
	  </table>
	  </form>
	  

	 <div class="confirm_bar">
	 	<button id="confirm_btn">확인</button>
	</div>
	 </div>
</div>	

	<script>
		var imgData = {};
		
		$('#uploadImage').on('change', function(e) {
			var fileData = e.currentTarget.files[0];
			var previewTargetId = e.currentTarget.nextElementSibling.attributes[0].value;
			var previewTarget = document.getElementById(previewTargetId);
			
			PreviewImage(fileData, previewTarget, previewTargetId);
		});
		$('#uploadImage1').on('change', function(e) {
			var fileData = e.currentTarget.files[0];
			var previewTargetId = e.currentTarget.nextElementSibling.attributes[0].value;
			var previewTarget = document.getElementById(previewTargetId);
			
			PreviewImage(fileData, previewTarget, previewTargetId);
		});
		
		function PreviewImage(fileData, preview, previewTargetId) {
		    var oFReader = new FileReader();
		    oFReader.readAsDataURL(fileData);
		    oFReader.onload = function (oFReader) {
		    	preview.src = oFReader.target.result;
		    	
		    	if (previewTargetId === 'uploadPreview') {
    				imgData.uploadImage = oFReader.target.result;
		    	} else if (previewTargetId === 'uploadPreview1') {
		    		imgData.uploadImage1 = oFReader.target.result;
		    	}
		    };
		};
		
		$("#confirm_btn").click(function() {
			  // console.log($(".ck"));
			  var noticeTitle = $("#contentTitle").val();
			  var productCategory = $("#productCategory").text();
			  var productName = $("#productName").val();
			  var productPrice = $("#productPrice").val();
			  var productGram = $('#productGram').val();
			  
			  var data = {
			    "title": noticeTitle,
			    "product_image": imgData.uploadImage, 
			    "product_image_ex": imgData.uploadImage1, 
			    "productCategory" : productCategory,
			    "productName" : productName,
			    "productPrice" : productPrice,
			    "productGram" : productGram
			  };
			  console.log(data);
			  $.ajax({
			    async : true,
			    type : 'POST',
			    data : JSON.stringify(data),
			    url : "/admin/productRegister",
			    // dataType : "json",
			    contentType : "application/json; charset-UTF-8",
			    success : function(data) {
			      // console.log("success", data);
			      alert("저장되었습니다.");
			      location.href='/admin/admin_item';
			    },
			    error : function(error) {
			      // console.log("error", error);
			      alert("다시 시도해주세요.");
			      // location.href='/admin/admin_noticewrite';
			      return;
			    }
			  });
		});
	</script>


