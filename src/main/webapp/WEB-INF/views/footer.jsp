<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  <link rel="stylesheet" href="/css/footer.css">

<div class="footer03">
<div class="cs">
	<h4>고객센터</h4>
	<div>
	<h3>000-000-0000</h3>
	<p>
		평일 (09:00 ~ 18:00)
		<br>
		점심시간 (12:00 ~ 13:00)
		<br>
		휴일 (토요일,일요일,공휴일)
	</p>
	
	</div>
</div>
<div class="bank">
	<h4>배송안내</h4>
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
<h4>교환&환불</h4>
<br>
<b>반품주소</b>
<br>
경기도 의정부시 OOO OOOO
</div>
</div>
<a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
  <img src="/img/icon-top.png">
</a>

  
  <div class="footer01">
    <ul>
      <li><a href="#">이용안내</a></li>
      <li><a href="#">이용약관</a></li>
      <li><a href="#">개인정보처리방침</a></li>
    </ul>
  </div>
  <div class="footer02">
    <div class="address">
      회사 : 코딩강사, 주소 : 경기도 성남시 123-45 오케이빌딩 101호, 대표 : 홍길동, <br>
      고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호
    </div>
    <div class="copy">
      COPYRIGHT(C) 2020 CODING_GANGSA. ALL RIGHT RESERVED.
    </div>
    <div>
      <ul >
        <li style="display: inline-block;"><a href="./index.html"><img src="./img/mf-icon01.png" alt=""></a></li>
        <li style="display: inline-block;"><a href="#"><img src="./img/mf-icon02.png" alt=""></a></li>
        <li style="display: inline-block;"><a href="#"><img src="./img/mf-icon03.png" alt=""></a></li>
        <li style="display: inline-block;"><a href="#"><img src="./img/mf-icon04.png" alt=""></a></li>
      </ul>
    </div>
  </div>
  
  

<script> 
   
  $(document).ready(function(){
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        console.log('fadeIn');
        $('#back-to-top').fadeIn();
      } else {
        console.log('fadeOut');
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
   
</script>
  
</body>
</html>