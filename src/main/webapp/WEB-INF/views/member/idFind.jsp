<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
    maximum-scale=1.0, minimum-scale=1.0">

    <!-- My CSS -->
    <link rel="stylesheet" href="/css/member/idFind.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <title>회원아이디 찾기</title>
  </head>

  <body>
    <div class="main">
	    <%
			String member_id = (String)request.getAttribute("member_id");
				//null체크
			if (member_id != null) {
		%>
		<!-- 찾은 아이디 출력 -->
		
		회원님의 아이디는 <%= member_id %> 입니다.
		
		<%
		} else {
		%>
		<!-- 아이디 찾기 -->
	
      <form method="post" action="idFindAction">
      <table>
        <tr>
          <td colspan="2">아이디 찾기</td>
        </tr>
        <tr>
          <td colspan="2">아이디를 잊어버리셨나요?<br>회원님의 성명과 이메일을 입력하여 주세요.</td>
        </tr>
        <tr>
          <td style="width: 20%;"><img src="http://bdmp-004.cafe24.com/cimg/txt_join1.gif"><img src="http://bdmp-004.cafe24.com/cimg/txt_email.gif"></td>
          <td style="width: 80%;">
          	<input type="text" name="member_name">
          	<input class="em" type="text" name="member_email">
          </td>
        </tr>
        
      </table>
      
      <div><input type="image" name="submit" value="submit" formaction="idFindAction"  src="http://bdmp-004.cafe24.com/cimg/btn_confirm.gif"></div>
      <%
		}
	  %>
      <div><input type="image" onclick="javascript:window.close();" src="http://bdmp-004.cafe24.com/cimg/btn_close.gif"></a></div>
      </form>
    </div>
    
  </body>
</html>