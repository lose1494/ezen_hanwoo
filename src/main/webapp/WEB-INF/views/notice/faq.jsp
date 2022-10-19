<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<link rel="stylesheet" href="/css/notice/faq.css">
<link rel="stylesheet" href="/css/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<div class="wrap">
    
	<h1>자주하는 질문</h1>

  <div class="faq_bar">
        <ul >
          <li class="abc"><a href="/Notice/faq?faq_type=all" value="all">전체보기</a></li>
          <li><a href="/Notice/faq?faq_type=주문결제" value="주문결제">주문결제</a></li>
          <li><a href="/Notice/faq?faq_type=배송" value="배송">배송</a></li>
          <li><a href="/Notice/faq?faq_type=취소" value="취소">취소</a></li>
          <li><a href="/Notice/faq?faq_type=교환/환불" value="교환/환불">교환/환불</a></li>
          <li><a href="/Notice/faq?faq_type=회원" value="회원">회원</a></li>
          <li><a href="/Notice/faq?faq_type=기타" value="기타">기타</a></li>
        </ul> 
  </div>
  
  <form action="searchFaq">
    <div class="faq_box1">
        <select id="faq_select1" name="sort">
          <option value="faq_title">제목</option>
          <option value="faq_content">내용</option>
        </select>
        <input type="text" id="faq_text" name="word">
        <input type="image" src="/img/notice/search.png" id="faq_img">
    </div>
  </form>

  <div class="accordion accordion-flush" id="accordionFlushExample">
    <c:forEach var="dto" items="${ faqList }" varStatus="status">
    <div class="accordion-item">
      <div class="accordion-header" id="flush-heading${ status.index }">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${ status.index }" aria-expanded="false" aria-controls="flush-collapse${ status.index }">
          <i class="fa-solid fa-circle-question"></i> <span class="title"> [${ dto.faq_type }] ${ dto.faq_title } </span>
        </button>
      </div>
      <div id="flush-collapse${ status.index }" class="accordion-collapse collapse" aria-labelledby="flush-heading${ status.index }" data-bs-parent="#accordionFlushExample">
        <div class="accordion-body">
          <i class="fa-solid fa-circle-info"></i>
          ${ dto.faq_content }
        </div>
      </div>
    </div>
    </c:forEach>
  </div>
  <c:if test="${pageNum != 0 }">
    <div class="pageNav">
      <a href="/Notice/faq?faq_type=${type}&page=1">처음</a>
      <a href="/Notice/faq?faq_type=${type}&page=${ page-1 }">이전</a>
      <c:forEach var="pageNum" begin="1" end="${ pageNum }">
        <a href="/Notice/faq?faq_type=${type}&page=${ pageNum }">${ pageNum }</a>
      </c:forEach>
      <a href="/Notice/faq?faq_type=${type}&page=${ page+1 }">다음</a>
      <a href="/Notice/faq?faq_type=${type}&page=${ pageNum }">마지막</a>
    </div>
  </c:if>
</div>

<script>

  $(function () {
      $('.faq_bar a').each(function () {
          console.log($(this).attr("value"));
          if("${type}" == $(this).attr("value")) {
            $('.faq_bar li').removeClass('abc');
            $(this).parents('li').addClass('abc');
          }
      });
  });

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
 
 
 </script>
