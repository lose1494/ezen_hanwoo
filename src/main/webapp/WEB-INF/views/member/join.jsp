<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <link rel="stylesheet" href="/css/member/join.css" />
	<link rel="stylesheet" href="/css/common.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script type="text/javascript" src="event.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--         <script type="text/javascript">
            window.onload = function(){
                function idcheck(){
                    var insertId=document.inputForm.id.value;
                    alert("아이디는 "+insertId+" 입니다.");
                    return;
                }
                function emailcheck(){
                    var email1 = document.inputForm.email.value;
                    var email2 = document.inputForm.email2.value;
                    alert("이메일은 "+email1+email2+" 입니다.");                 
                    return;
                }
                
                function joincheck(){
                    var sname = document.inputForm.sname.value;
                    var gender = document.inputForm.gender.value;
                    var birth1 = document.inputForm.birth1.value;
                    var birth2 = document.inputForm.birth2.value;
                    var birth3 = document.inputForm.birth3.value;
                    var Hobbys = [];
                    for(var i=0; i<document.inputForm.hobby.length; i++){
                        if(document.inputForm.hobby[i].checked) {
                            Hobbys.push(document.inputForm.hobby[i].value);
                        }
                    }
                    alert("이름 : "+sname+"\n"+"성별:"+gender+"\n"
                    +"생년월일:"+birth1+"년"+birth2+"월"+birth3+"일"+"\n"
                    +"취미:"+Hobbys.join("-"));
                    return;
                }
                
                var checkBtn = document.getElementById("check");
                var checkEmail = document.getElementById("check2");
                var joinBtn = document.getElementById("join");
                addEvent(checkBtn, 'click', idcheck);
                addEvent(checkEmail, 'click', emailcheck);
                addEvent(joinBtn, 'click', joincheck);

            }
           
           
  
        </script> -->

  <div class="header2 wrap">
    <h2 id="title">회원정보 입력</h2>

    <form action="/member/joinAction" class="fom" method="POST" name="usersInfo">
    <div class="form_wrap">
        <table class="input_form">
         


            <tr>
                <td> <label>아이디</label> </td>
                <td>
        <input type="text" name="users_id" id="search_id"> 
        <input type="button" name="check_btn" id="check_btn" value="중복확인" class="fonbutton">
        <span id="result"></span>
                </td>
             </tr>
             <tr>
               <td> <label>이름</label> </td>
                <td>
                  <input type="text" name="users_name" > 
              	</td>
             </tr>
             <tr>
               <td> <label>비밀번호</label> </td>
              	<td>
                    <input type="text" name="users_pw"> 
                </td>
            </tr>
            <tr>    <td> <label>비밀번호 확인</label> </td>
                <td>
                    <input type="text" name="pwCheck" >
                </td>
            </tr>
            
                   
               <tr>
                
               <td> <label>이메일</label> </td>
                   <td> <input type="text" name="users_email" >
                   </td>
            </tr>
            <tr><td> <label>핸드폰 번호</label> </td>
            	<td>
            		<input type="text" name="users_phone" >
            	</td>
            </tr>

            <tr>
		    <td> <label>주소</label> </td>
		 	<td><input type="text" id="users_address1" name="users_address1" placeholder="우편번호">
		  		<input type="button" onclick="addressAdd()" value="우편번호 찾기" class="fonbutton1"><br>	
		 	 	<input type="text" id=users_address2 name="users_address2" placeholder="도로명주소"><br>
	 	 		<input type="text" id="users_address3" name="users_address3" placeholder="상세주소"><br>
	 	 	</td>
 			</tr>
 			
 	 		<tr> 
 	 		<td> <label>생년월일</label> </td>
 	 		<td>
 	 		<div>
 	 			<input type="date" name="users_birth_date" > </div>
 	 		</td>
 	 		
 	 		</tr>
  		</table>
  		</div>
        <input class="button" type="submit" id="join" value="확인">
        <input class="button2"type="reset" value="취소"> 
        
        </form>
      </div>
     
<!-- 주소찾기 -->
	<script> 
	   function addressAdd() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('users_address1').value = data.zonecode; //우편번호
	                document.getElementById("users_address2").value = roadAddr; //도로명 
	                document.getElementById("users_address3").value = data.jibunAddress; //상세주소
	                self.close();
	            }
	        }).open();
	    }
	</script>
<!-- 중복확인 -->
    <script>
   $(function() {
	   $("#check_btn").click(function(){

	   var userId = $("#search_id").val();
	   console.log(userId);
	   
	   $.ajax({
		async: true,
		type: 'POST',
		data: userId,
		url: "/member/join",
		dataType: "json",
		contentType: "application/json; charset-UTF-8",
		success: function(data) { 
			console.log( data );
			var data_num = Number( data );
			if ( data_num == 0 ) {
			$("#result").text('사용할 수 있는 아이디입니다.');
		} else {
			
			$("result").text('사용할 수 없는 아이디입니다.');
			result=1;	
			} },
			error : function(error) {
			alert("아이디를 입력해주세요.");
			}
		});
	   });
   });
 
  </script>
  <!-- 알림 -->
  <script>
  function checkValue() { 
		if(!document.userInfo.users_id.value) { //empty: null, 길이 0
			alert("아이디을 입력해주세요");
			document.getElementById('users_id').focus();
			return false; //submit전송이 안됨
		}
		if(document.userInfo.users_id_check.value == 'no') { //empty: null, 길이 0
			alert("아이디 중복확인을 입력해주세요");
			document.getElementById('users_id').focus();
			return false; //submit전송이 안됨
		}

		if(!document.userInfo.users_pw.value) { //empty: null, 길이 0
			alert("암호을 입력해주세요");
			document.getElementById('users_pw').focus();
			return false; //submit전송이 안됨
		}
			
		if( ! (document.userInfo.users_pw.value == document.userInfo.pwCheck.value) ) {
			alert("암호가 일치하지 않습니다. 다시 입력해주세요");
			document.getElementById('users_pw').focus();
			return false; //submit전송이 안됨
		}
		if(!document.userInfo.users_name.value) { //empty: null, 길이 0
			alert("이름을 입력해주세요");
			document.getElementById('users_name').focus();
			return false; //submit전송이 안됨
		}
		
		if(!document.userInfo.users_email.value) {
			alert("이메일을 입력해주세요");
			document.getElementById('users_email').focus();
			return false; 
		} 		
		
		if(!document.userInfo.users_phone.value) {
			alert("전화번호를 입력해주세요");
			document.getElementById('users_phone').focus();
			return false; 
		}
		
		return true;
	}
  </script>