<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
    
<link rel="stylesheet" href="/css/admin/item_inquiry.css">
<link rel="stylesheet" href="/css/common.css">

<div class="bg_admin text-center">
	<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지> 상품 문의 관리 </p>
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
	
	<div class="wrap">
		<div class="admin_div">
		
			<table class="member_table">
				<tr>
		 			<th>번호</th>
	 				<th>ID</th>
	 				<th>날짜</th>
	 				<th>상품명</th>
	 				<th>답변여부</th>
	 				<th>제목</th>
				</tr>
				
 					<c:forEach var="dto" items="${ qna_List }" varStatus="status">
 					<input type="hidden" name="qna_idx${status.index}" value="${ dto.qna_idx }">
					<input type="hidden" name="reply_idx${status.index}" value="${ dto.reply_idx }">
 				<tr>	
						<td>${ dto.product_qnaDto.qna_idx }</td>
		 				<td> ${ dto.product_qnaDto.qna_id }</td> 
					 	<td><fmt:formatDate value="${dto.product_qnaDto.qna_date}" pattern="yyyy/MM/dd" /></td>
					 	<td>${ dto.product_qnaDto.product_name }</td>
					 	<td>${ dto.product_qnaDto.qna_status }</td>
					 	<td class="QnA">${ dto.product_qnaDto.qna_title }</td>
				</tr>
					<tr class='text_comment hide'>	
						<c:choose>
							<c:when test="${ dto.reply_content eq null }">
								<td colspan='5' id='text' class='answer'>
								<textarea name='reply_content${status.index}'></textarea></td>
								<td><input type='button' value="등록" class='notice_btn dark' onclick="QnAanswerWrite('${status.index}')"></td>
							</c:when>	
							<c:otherwise>
								<td colspan='5' id='text' class='answer'>
									<textarea name='reply_content${status.index}'>${dto.reply_content}</textarea></td>
								<td><input type='button' value='수정' class='notice_btn dark' onclick="QnAanswerUpdate('${status.index}')">  
									<input type='button' value='삭제' class='notice_btn dark' onclick="QnAanswerDelete('${status.index}')"> </td>
							</c:otherwise>	
						</c:choose>			
					</tr>			
					</c:forEach>
			</table>
					

		</div>
		
		<div class="pageNav">
            <a href="/admin/admin_inquiry?page=1">처음</a>
            <a href="/admin/admin_inquiry?page=${ page-1 }">이전</a>
			<c:forEach var="pageNum" begin="1" end="${ pageNum }">
            <a href="/admin/admin_inquiry?page=${ pageNum }">${ pageNum }</a>
			</c:forEach>
            <a href="/admin/admin_inquiry?page=${ page+1 }">다음</a>
            <a href="/admin/admin_inquiry?page=${ pageNum }">마지막</a>
        </div>
	</div>
</div>	

<script>

	// 문의 답변 열고닫기
	$('.QnA').each( function(index, item) {
		$(this).click( function() {
			if($('.answer').eq(index).parents('tr').hasClass('hide') === true) {
				$('.answer').parents('tr').addClass('hide');
				$('.answer').eq(index).parents('tr').removeClass('hide'); 
			}else {
				$('.answer').eq(index).parents('tr').addClass('hide'); 
			}
			
		})
	})

	$(function() {
            $('.pageNav a').each(function() {
            	console.log($(this).text());
            	if($(this).text() == '이전' && "${page}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${page}" == "${pageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ page }" ) {
                    $(this).removeAttr('href');
                }
            })
	})

	//문의 답변 작성
	function QnAanswerWrite(idx) {
		console.log($('textarea[name=reply_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/QnAanswerWrite",
			data : {  	qna_idx : $('input[name=qna_idx'+idx+']').val(),
					   	reply_content : $('textarea[name=reply_content'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('작성에 실패했습니다.');
					history.back();
				}else {
					alert('답변을 등록했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	//답변 수정
	function QnAanswerUpdate(idx) {
		console.log($('textarea[name=reply_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/QnAanswerUpdate",
			data : {  	reply_idx : $('input[name=reply_idx'+idx+']').val(),
					   	reply_content : $('textarea[name=reply_content'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('수정에 실패했습니다.');
					history.back();
				}else {
					alert('답변을 수정했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	//답변 삭제
	function QnAanswerDelete(idx) {
		console.log($('textarea[name=reply_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/QnAanswerDelete",
			data : {  	qna_idx : $('input[name=qna_idx'+idx+']').val(),
						reply_idx : $('input[name=reply_idx'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('삭제에 실패했습니다.');
					history.back();
				}else {
					alert('답변을 삭제했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	
</script>