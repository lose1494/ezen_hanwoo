<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/member/join.css">
    
<script>

    $(document).ready(function () {
      setDateBox();
    });
    

    // select box 연도 , 월 표시
    function setDateBox() {
      var dt = new Date();
      var year = "";
      var com_year = dt.getFullYear();

      // 발행 뿌려주기
      $("#member_birth_date_year").append("<option value=''>년도</option>");

      // 올해 기준으로 -50년부터 +1년을 보여준다.
      for (var y = (com_year - 50); y <= (com_year + 1); y++) {
        $("#member_birth_date_year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
      }

      // 월 뿌려주기(1월부터 12월)
      var month;
      $("#member_birth_date_month").append("<option value=''>월</option>");
      for (var i = 1; i <= 12; i++) {
        $("#member_birth_date_month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
      }

      // 일 뿌려주기(1일부터 31일)
      var day;
      $("#member_birth_date_day").append("<option value=''>일</option>");
      for (var i = 1; i <= 31; i++) {
        $("#member_birth_date_day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
      }

    }
    
    function idCheck() {
		var member_id = $('#member_id').val();
		
		if(!member_id){
			alert("아이디를 입력하세요.");
			return false;
		}
		// ajax 용도 : 화면 갱신(reload,redirect)가 없이
		//            부분화면 갱신(통신)을 js에서 한다.
		//           예)네이버 - 실시간검색어, 실시간날씨
		
		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$.ajax({
  			url : 'http://localhost:8090/member/idCheckAjax?member_id='+ member_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
				
				var data_num = Number( data );
				
				if (data_num >= 1) {
					// 1 : 아이디가 중복되는 문구
					alert("아이디가 중복됩니다.");
					$('#member_id_check').val("no");
				} else {
					// 0 : 아이디가 사용 안됨.
					alert("아이디가 사용가능합니다.");
					$('#member_id_check').val("yes");
				}
			}, 
			error : function() {
					console.log("실패");
			}
		});
		
		
	} 

  </script>
  
  <div class="commonSection1">
      <div class="commonContent1">
        <img src="http://bdmp-004.cafe24.com/bizdemo99969/img/main/sub-visual06.jpg" style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
          <div>
            <h3>MEMBER</h3>
          </div>
          <div>
            <p><img src="http://bdmp-004.cafe24.com/bizdemo99969/img/common/icon-home.png"> > 회원가입</p>
          </div> 
        </div>   
      </div>
    </div>
    
    <div class="joinForm container">
      <div class="joinSe1">
        <div><h3>회원가입</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
      </div>
      <div class="wellcome">
        <h3>OOO사이트에 오신 것을 환영합니다.</h3>
        <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
      </div>
      <br><br>
      <div class="contents">
        <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
        <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다. 자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
      </div>
      
      <form action="/member/join2Action" method="post" name="userInfo" onsubmit="return checkValue()">
	      
	      <div class="Information1">
	      
	        <div>기본정보</div>
	        <table>
	          <tr>
	            <td>아이디</td>
	            <td>
	              <input type="text" name="member_id" id="member_id">
	              <a href="javascript:idCheck();"><img src="http://bdmp-004.cafe24.com/cimg/btn_iddupl.gif"></a>
	              (영문 소문자, 숫자4~16자)
	              <input type="hidden" name="member_id_check" id="member_id_check"  value="no">
	            </td>
	          </tr>
	          <tr>
	            <td>비밀번호</td>
	            <td>
	              <input type="password" name="member_pw" id="member_pw">
	              영문/숫자/특수문자('~!@^*()-_+[]{}\:,.<>/) 조합으로 8~16자리. 첫글자는 영문자로 사용
	            </td>
	          </tr>
	          <tr>
	            <td>비밀번호 확인</td>
	            <td><input type="password" id="member_pw_check"></td>
	          </tr>
	          <tr>
	            <td>이름</td>
	            <td><input type="text" id="member_name" name="member_name"></td>
	          </tr>
	          <tr>
	            <td>이메일</td>
	            <td><input type="text" name="member_email_left">@<input type="text" name="member_email_right"></td>
	          </tr>
	          <tr>
	            <td>이메일 수신여부</td>
	            <td>
	                <input type="radio" name="member_email_receive" value=0 checked>수신
	                <input type="radio" name="member_email_receive" value=1>수신안함
	            </td>
	          </tr>
	          <tr>
	            <td>비밀번호 확인시 질문</td>
	            <td>
	              <select class="size" id="member_pw_question" name="member_pw_question">
	                <option value="">========선택========</option>
	                <option value="1">기억에 남는 추억의 장소는?</option>
	                <option value="2">자신의 인생 좌우명은?</option>
	                <option value="3">자신의 보물 제1호는?</option>
	                <option value="4">가장 기억에 남는 선생님 성함은?</option>
	                <option value="5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
	                <option value="6">추억하고 싶은 날짜가 있다면?</option>
	                <option value="7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
	                <option value="8">유년시절 가장 생각나는 친구 이름은?</option>
	                <option value="9">인상깊게 읽은 책 이름은?</option>
	                <option value="10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
	                <option value="11">자신이 두 번째로 존경하는 인물은?</option>
	                <option value="12">친구들에게 공개하지 않은 어릴적 별명이 있다면?</option>
	                <option value="13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
	                <option value="14">다시 태어나면 되고 싶은 것은?</option>
	                <option value="15">내가 좋아하는 캐릭터는?</option>
	                <option value="16">나의 주민등록번호 끝자리는?</option>
	              </select>
	            </td>
	          </tr>
	          <tr>
	            <td>비밀번호 확인시 답변</td>
	            <td><input type="text" id="member_pw_answer" name="member_pw_answer"></td>
	          </tr>
	          <tr>
	            <td>성별</td>
	            <td>
	            	<input type="radio" name="member_gender" value="male" checked>남자
	            	<input type="radio" name="member_gender" value="female">여자
	            </td>
	          </tr>
	          <tr>
	            <td>생년월일</td>
	            <td>
	              <select name="member_birth_date_year" id="member_birth_date_year" title="년도" class="size"></select>
	              <select name="member_birth_date_month" id="member_birth_date_month" title="월" class="size"></select>
	              <select name="member_birth_date_day" id="member_birth_date_day" title="일" class="size"></select>
	            </td>
	          </tr> 
	        </table>
	       
	      </div>
	       
	      <div class="Information2">부가정보</div>
	      <div class="imageBtn2">       
	       
	        <input type="submit" id="submit" name="submit" value="" style="vertical-align:middle;">
	        	
	        <a id="cancel" href="/index">
						<img src="/img/member/btn_cancel.gif" alt="">
					</a>
	      </div>
      </form>
    </div>
    
    
    <script>
    
	function checkValue() {
		
		if(!document.userInfo.member_id.value) { //empty: null, 길이 0
			alert("아이디을 입력해주세요");
			document.getElementById('member_id').focus();
			return false; //submit전송이 안됨
		}
		if(document.userInfo.member_id_check.value == 'no') { //empty: null, 길이 0
			alert("아이디 중복확인을 입력해주세요");
			document.getElementById('member_id').focus();
			return false; //submit전송이 안됨
		}

		if(!document.userInfo.member_pw.value) { //empty: null, 길이 0
			alert("암호을 입력해주세요");
			document.getElementById('member_pw').focus();
			return false; //submit전송이 안됨
		}
			
		if( ! (document.userInfo.member_pw.value == document.userInfo.pwCheck.value) ) {
			alert("암호가 일치하지 않습니다. 다시 입력해주세요");
			document.getElementById('member_pw').focus();
			return false; //submit전송이 안됨
		}
		if(!document.userInfo.member_name.value) { //empty: null, 길이 0
			alert("이름을 입력해주세요");
			document.getElementById('member_name').focus();
			return false; //submit전송이 안됨
		}
		if(!document.userInfo.member_email_left.value) {
			alert("이메일을 입력해주세요");
			document.getElementById('member_email_left').focus();
			return false; 
		}
		if(!document.userInfo.member_email_right.value) {
			alert("이메일을 입력해주세요");
			document.getElementById('member_email_right').focus();
			return false; 
		} 
		
		return true;
	}

	</script>
    
  
  
  
  