<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/css/member/join2.css" />

​
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
​
<script>
  $(document).ready(function(){
    $('#header').load("/header.html");
    $('#footer').load("/footer.html");
  });
</script>
​
</head>
<body>
  <div id="header"></div>
  <!-- 헤더 -->
  <div id="headerTop"></div>
  <div id="header" class="sticky-top"></div>
​
  <!-- 메인 -->
  <!-- COMMON -->
  <div class="commonSection1">
    <div class="commonContent1">
     
        
      <div class="commonContent2 text-center">
        <div>
          <h3>회원가입 약관동의</h3>
        </div>
       
      </div>
    </div>
  </div>
​
  <!-- 메인 -->
  <!-- 회원가입 -->
  <div class="joinForm container">
    <div class="joinSection1">
     
     
    </div>
    
    <!-- 이용약관 -->
    <div class="term1">
     
      <div>
        <textarea name="" id="textarea" cols="100" rows="10 ">
          약관내용
        </textarea>
        <div class="select"><input class="check" type="checkbox"> 이용약관에 동의합니다.(필수)</div>
      </div>
    <!-- 개인정보보호정책 -->
    <div class="term2">
     
      <div>
        <textarea name="" id="textarea" cols="100" rows="10">
          
        </textarea>
        <div class="select"><input class="check" type="checkbox"> 개인정보 수집.이용 동의</div>
      </div>
    </div>
    <!-- 개인정보의 수집 및 이용목적 -->
    <div class="term3">
      
      <div>
        <textarea name="" id="textarea" cols="100" rows="10">
          약관내용
        </textarea>
        <div class="select"><input type="checkbox"> 문자 수신 동의(선택)</div>
      </div>
    </div>

​
    <div class="imageBtn">
      <input class="bottom"type="submit"  onclick="agree()" value="동의">
      <input class="bottom2"type="submit" value="취소">
    </div>
   
  </div>
</div>
  <!-- 푸터 -->
  <div id="footer"></div>
​
  <script>
    // 약관동의 3개 체크박스를 확인.
    function agree() {
      //다 동의 한것으로 설정.
      let isAllCheck = true;
      var checkboxArray = document.getElementsByClassName('check');
      for( var cbx of checkboxArray ) {
        if( cbx.checked == false ) {
          isAllCheck = false;
          break; //탈출0
        }
      }
      if( isAllCheck == true ) {
        window.location.href = "./join2.html";
      }else{
        alert("이용약관에 모두 동의하셔야 회원으로 가입하실 수 있습니다.");
      }
      
    }
    
    
  </script>
  <div id="header"></div>
</body>
</html>