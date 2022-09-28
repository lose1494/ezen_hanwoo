<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <link rel="stylesheet" href="/css/member/join.css" />
    

        <script type="text/javascript" src="event.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
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
           
           
  
        </script>

    <div id="header"></div>
  <div class="header2">
    <h2>회원정보 입력</h2>
  <div class="header3">기본정보입력(필수)</div>
    <form class="fom"method="GET" name="inputForm">
        <table>
         


            <tr>
                
                <td>
                    <input type="text" name="id" placeholder="아이디 ">
                    <input class="fonbutton"type="button" id="check" value="중복확인">
                </td>
            </tr>
            <tr>
             
              <td>
                  <input type="text" name="email" placeholder="이메일 "id="email"> @
                  <input type="text" name="email" placeholder="이메일 "id="email">
                  <select id="email2">
                      <option value="0">직접입력</option>
                      <option value="1">http://www.google.com</option>
                      <option value="2">http://www.naver.com</option>
                      <option value="3">http://www.daum.com</option>
                  </select>
                  
              </td>
          </tr>
            <tr>
               
                <td>
                    <input type="text" name="pwd"placeholder="비밀번호"  > 
                   
                </td>
            </tr>
            <tr>
                
                <td>
                    <input type="text" name="pwdCheck" placeholder="비밀번호 확인">
                </td>
            </tr>
            <tr>
              
              <td>
                  <input type="text" name="sname"  placeholder="이름 "> 
              </td>
          </tr>
            <tr>
                 
                    <td >
                    <input class=""type="date">
                        <hr>
                       

                         <h4>본인인증</h4>
                         <div>이미 가입된 휴대전화 번호로는 가입하실 수 없습니다.</div>
                    </td>
               </tr>
               
               <tr>
                
                <td>
                    <input type="text" name="id" placeholder="휴대전화 번호 " >
                    <input class="fonbutton"type="button" id="check2" value="인증하기">
                </td>
            </tr>
            <tr>
              
              <td>
                  <input type="text" name="id" placeholder="인증번호 입력" >
                  <input class="fonbutton fonbutton3"type="button" id="check" value="인증확인">
              </td>
          </tr>
          
          
            
       
        </table>
      </form>
        <input class="button"type="button" id="join" value="확인">
        <input class="button2"type="submit" value="취소">
      </div>


    