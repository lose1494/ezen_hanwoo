<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/notice/faq.css">
<link rel="stylesheet" href="/css/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<div class="wrap">
    
	<p class="title_tag">자주하는 질문</p>

   	<div class="faq_bar">
          <ul >
            <li class="abc"><a href="#faq_bar">전체보기</a></li>
            <li><a href="#faq_bar">주문결제</a></li>
            <li><a href="#faq_bar">배송</a></li>
            <li><a href="#faq_bar">취소</a></li>
            <li><a href="#faq_bar">교환/환불</a></li>
            <li><a href="#faq_bar">회원</a></li>
            <li><a href="#faq_bar">기타</a></li>
          </ul> 
    </div>
      
      <div>
    <div class="faq_box1">
      <select id="faq_select1">
        <option>제목</option>
        <option>내용</option>
      </select>
      <input type="text" id="faq_text">
      <input type="image" src="/img/notice/search.png" id="faq_img">
    </div>

<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <div class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        <i class="fa-solid fa-circle-question"></i> <span class="title"> [배송] 배송날짜를 지정할 수 있나요? </span>
      </button>
    </div>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
        <i class="fa-solid fa-circle-info"></i>
        쇼핑몰 자체 결제 시스템을 이용하여 주문해주시는 경우에는 수령을 원하시는 날짜로 지정할 수 있습니다. <br>
        (현재 네이버페이로 주문해주시는 경우에는 희망수령일 선택이 불가능합니다) <br> 
        수령일 기준 7일까지 희망수령일 선택가능하며, 주문 완료 후 수령일 변경을 원하시는 경우에는 <br>
        1:1 문의 및 고객센터(043-877-1613)로 연락주시면 도와드릴 수 있도록 하겠습니다. <br>
        다만, 주문 마감 시간(오후 2시) 이후에는 수령일 변경이 불가능합니다. <br>
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
       <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [교환/환불]교환 또는 바품 신청시에 사진을 첨부해야하나요? </span>
        </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      2
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [교환/환불] 제품을 반품했는데 아직도 카드 취소가 되지 않았어요 어떻게 된건가요? </span>
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      3
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [취소] 주문 취소는 어떻게 하나요? </span>
      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      4
      </div>
    </div>
  </div>
  
 <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [배송] 주문 후 주문정보를 변경하려고 하는데 어떻게 해야하나요?  </span>
      </button>
    </h2>
    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      5
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSix">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [배송] 묶음 배송이 가능한가요?  </span>
      </button>
    </h2>
    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      6
      </div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [배송] 배송비 어떻게 결제되나요?  </span>
      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      7
      </div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingEight">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [주문결제] 결제내역을 문자나 메일로 받아 볼 수 있나요?  </span>
      </button>
    </h2>
    <div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      8
      </div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingNine">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
      <img src="/img/notice/q.png" class="img" width="30"> <span class="title"> [주문결제] 어떤 결제방법을 제공하나요? </span>
      </button>
    </h2>
    <div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      9
      </div>
    </div>
  </div>
</div>
</div>
  <div class="pageNav">
                <a href="#">처음</a>
                <a href="#">이전</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">다음</a>
                <a href="#">마지막</a>
            </div>
</div>

<script>

  $('.faq_bar a').each( function() {
     $(this).click( function() {
         $('.faq_bar li').removeClass('abc');
         $(this).parents('li').addClass('abc');
     })
 })
 
 
 </script>
