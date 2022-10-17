<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 


    <!-- My CSS -->
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="/css/member/idFind.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  


 <div class="wrap">
    <h2>아이디/비밀번호찾기</h2>  
    <form class="fom"method="GET" name="inputForm">
        <table>
        
             <tr class=idname>     
                <td>
                    <h4>아이디 찾기</h4>
                </td>
            </tr>         
            <tr>
                <td>
                    <input type="text" name="sname"  placeholder="이름 "> 
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="id" placeholder="휴대전화 번호">
                </td>
                <tr>
                <td>
                 <input class="button"type="button" id="join" value="확인">
                 </td>
                 </tr>
                    
            <tr>     
                <td>
                    <h4>비밀번호찾기</h4>
                </td>
            </tr>
            <tr>
               <td>
                <input type="text" name="id" placeholder="아이디">               
                </td>
            </tr>
            <tr>            
                <td>
                    <input type="text" name="sname"  placeholder="이름 "> 
                </td>
            </tr>               
            <tr>
                <td>
                    <input type="text" name="id" placeholder="휴대전화 번호 " >                    
                </td>   
            </tr>
            <tr>      
              <td>
                  <input type="text" name="id" placeholder="인증번호" >              
              </td>
          </tr>
          <tr>
         	 <td >
            	<h6>전송받은 인증번호를 입력하신 후 '확인'을 눌러주세요.</h6>
             </td>
          </tr>
        </table>
              <input class="button"type="button" id="join" value="확인">
      </form>
        
     </div>
