<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/footer.css">

<div class="footer">
<hr>
  <div class="footer01"> 
    <div class="cs">
      <h5>고객센터</h5> 
      <br>
      <h3>000-000-0000</h3>
      <p>
        평일 (09:00 ~ 18:00)
        <br>
        점심시간 (12:00 ~ 13:00)
        <br>
        휴일 (토요일,일요일,공휴일)
      </p>
    </div>
    <div class="bank">
      <h5>배송안내</h5>
      <br>
      <b>택배배송</b>
      <br>
      <b>월 ~ 금 : 오후 2시 이후 ~ 일요일 결제완료</b>
      - 
      <u>당일 발송</u>
      <br>
      <b>금요일 오후 2시 이후 ~ 일요일 결제완료</b>
      <br>
      - 
      <u>월요일 발송</u>
      (공휴일 제외) 
    </div>
    <div class="return">
      <h5>교환&환불</h5>
      <br>
      <b>반품주소</b>
      <br>
      경기도 의정부시 신흥로 258번길 25 해태프라자2층
    </div>
  </div>
  
  
  <div class="footer02">
    <div class="footerLink">
      <ul>
        <li><a href="#">이용안내</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
      </ul>
    </div>
    <div class="footerInfo">
      <div class="address">
        회사 : (주)이젠한우, 주소 : 경기도 의정부시 신흥로 258번길 25 해태프라자2층, 대표 : 김민수, <br>
        고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : ezenhanwoo@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호
      </div>
      <div class="copy">
        COPYRIGHT<i class="fa-regular fa-copyright"></i> 2020 CODING_GANGSA. ALL RIGHT RESERVED.
      </div>
    </div>
  </div>
</div>
   <a id="back-to-bottom" href="#" class="back-to-bottom" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block; ">
  <img src="/img/down.png">
</a>
  
<a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
  <img src="/img/up.png">
</a>
  

<script> 
   
  $(document).ready(function(){
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        	
        $('#back-to-top').fadeIn();
      } else {
        
        $('#back-to-top').fadeOut();
      }
    });
    
    $('#back-to-top').click(function () {
      console.log('click');
      $('#back-to-top').tooltip('hide');
      $('body,html').animate({
          scrollTop: 0
      }, 500);
      return false;
    });
    $('#back-to-top').tooltip('show');
  });
  $(document).ready(function(){
	    $(window).scroll(function () {
	      if ($(this).scrollTop() < 3000) {
	      
	        $('#back-to-bottom').fadeIn();
	      } else {
	    
	        $('#back-to-bottom').fadeOut();
	      }
	    });
	    
	    $('#back-to-bottom').click(function () {
	      console.log('click');
	      $('#back-to-bottom').tooltip('hide');
	      $('body,html').animate({
	          scrollTop: 9999
	      }, 500);
	      return false;
	    });
	    $('#back-to-bottom').tooltip('show');
	  });
</script>
  
</body>
</html>