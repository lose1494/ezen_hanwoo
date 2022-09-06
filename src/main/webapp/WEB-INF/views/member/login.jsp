<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
    
    <link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/login.css">

    <div class="commonSection1">
      <div class="commonContent1">
        <img src="/img/visual04.jpg" style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
          <div>
            <h3>MEMBER</h3>
          </div>
          <div>
            <p><img src="/img/icon-home.png"> > 로그인</p>
          </div> 
        </div>   
      </div>
    </div>
    
    
    <div class="loginForm container text-center">
      <div class="loginSe1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
      </div>
      <div class="loginMain">
      <form action="loginAction" method="post">
        <table class="main1">
          <tr>
            <td>
              아이디<br>
              비밀번호
            </td>
            <td>
              <input type="text" name="member_id"><br>
              <input type="password" name="member_pw">  
            </td>
            <td>
              <!-- <input type="image" class="loginImg" src="/img/member/btn_login.gif"> -->
              <div class="login-img">
		       	<input type="image" src="/img/member/btn_login.gif" name="submit" value="submit"  align="absmiddle">
		      </div>
            </td>
          </tr>
        </table>
        </form>
        <div class="loginSe2">
          <table class="main2">
            <tr>
              <td>-아이디를 잊으셨나요?</td>
              <td><input type="image" onclick="window.open('/member/idFind', '아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')" src="/img/member/btn_id_find.gif"></td>
            </tr>
            <tr>
              <td>-비밀번호를 잊으셨나요?</td>
              <td><input type="image" onclick="window.open('/member/passwordFind', '비밀번호찾기', 'width=430,height=340,location=no,status=no,scrollbars=no')" src="/img/member/btn_pw_find.gif"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
	
