<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
    
<link rel="stylesheet" href="/css/admin/admin_one2one.css">
<link rel="stylesheet" href="/css/common.css">

<div class= "bg_admin text-center">
	<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지> 1:1 문의 관리 </p>
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
					<th>ID</th>
					<th>날짜</th>
					<th>제목</th>
					<th>답변여부</th>
					<th>내용</th>
					<th>첨부파일</th>
				</tr>
				<c:forEach var="dto" items="${one2oneList}" varStatus="status">				
					<tr>
						<input type="hidden" name="one2one_idx${status.index}" value="${ dto.one2one_idx }">
						<input type="hidden" name="answer_idx${status.index}" value="${ dto.answer_idx }">
						<td>${ dto.one2oneDto.one2one_id }</td>
						<td><fmt:formatDate value="${dto.one2oneDto.one2one_date}" pattern="yyyy-MM-dd" /></td>
						<td class="one2one">${ dto.one2oneDto.one2one_title }</td>
						<td>${ dto.one2oneDto.one2one_status }</td>
						<td>${ dto.one2oneDto.one2one_content }</td>
						<c:if test="${ dto.one2oneDto.one2one_image != null }">
						<td><button class="bright" onclick="viewImg('${ dto.one2oneDto.one2one_image }')">이미지 보기</button></td>
						</c:if> 
					</tr>
					<tr class='text_comment hide'>	
						<c:choose>
							<c:when test="${ dto.answer_content eq null }">
								<td colspan='5' id='text' class='answer'><textarea name='answer_content${status.index}'></textarea></td>
								<td><input type='button' value="등록" class='notice_btn dark' onclick="answerWrite('${status.index}')"></td>
							</c:when>	
							<c:otherwise>
								<td colspan='5' id='text' class='answer'>
									<textarea name='answer_content${status.index}'>${dto.answer_content}</textarea></td>
								<td><input type='button' value='수정' class='notice_btn dark' onclick="answerUpdate('${status.index}')">  
									<input type='button' value='삭제' class='notice_btn dark' onclick="answerDelete('${status.index}')"> </td>
							</c:otherwise>	
						</c:choose>			
					</tr>			
					</c:forEach>
			</table>
					

		</div>
		
		<div class="pageNav">
            <a href="/admin/admin_one2one?page=1">처음</a>
            <a href="/admin/admin_one2one?page=${ page-1 }">이전</a>
			<c:forEach var="pageNum" begin="1" end="${ pageNum }">
            <a href="/admin/admin_one2one?page=${ pageNum }">${ pageNum }</a>
			</c:forEach>
            <a href="/admin/admin_one2one?page=${ page+1 }">다음</a>
            <a href="/admin/admin_one2one?page=${ pageNum }">마지막</a>
        </div>
	</div>
</div>	

<script>

	// 문의 답변 열고닫기
	$('.one2one').each( function(index, item) {
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

	function viewImg(url) {
		var img = new Image();
		img.src = url;
		window.open('','_blank','width='+img.width+', height='+img.height)
		.document.write("<img src='"+url+"'>");
	}

	//문의 답변 작성
	function answerWrite(idx) {
		console.log($('textarea[name=answer_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/answerWrite",
			data : {  	one2one_idx : $('input[name=one2one_idx'+idx+']').val(),
					   	answer_content : $('textarea[name=answer_content'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('작성에 실패했습니다.');
					history.back();;
				}else {
					alert('답변을 등록했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	//답변 수정
	function answerUpdate(idx) {
		console.log($('textarea[name=answer_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/answerUpdate",
			data : {  	answer_idx : $('input[name=answer_idx'+idx+']').val(),
					   	answer_content : $('textarea[name=answer_content'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('수정에 실패했습니다.');
					history.back();;
				}else {
					alert('답변을 수정했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	//답변 삭제
	function answerDelete(idx) {
		console.log($('textarea[name=answer_content'+idx+']').val());
		$.ajax({
			type: 'get',
			url : "/admin/answerDelete",
			data : {  	one2one_idx : $('input[name=one2one_idx'+idx+']').val(),
						answer_idx : $('input[name=answer_idx'+idx+']').val()
			},
			success : function(data){
				console.log(data);
				if( data != 1 ) {
					alert('삭제에 실패했습니다.');
					history.back();;
				}else {
					alert('답변을 삭제했습니다.');
					location.reload();
				}	
			}		
		}) 
	}

	
</script>
		  
