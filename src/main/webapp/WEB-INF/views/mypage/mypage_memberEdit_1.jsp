<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
         <h3>정보수정</h3>
         <div class="backgroundDiv">           
             <form action="" class="editForm">                
                 <table>
                     <tr>
                        <td></td>
                        <td> <div class="editDiv">*변경할 정보를 입력하세요.</div> </td>
                     </tr>
                     <tr>
                     	<td></td>
                     	<td><input type="text" class="readonly" value="${ member.users_id }" readonly></td>
                   	 </tr>
                     <tr>
                     	<td colspan="2">
                     		<input type="text" placeholder="이메일"> @ <input type="text" placeholder="이메일">
                            <select name="" id="">
                                <option value="">직접입력</option>
                                <option value="">naver.com</option>
                                <option value="">daum.net</option>
                                <option value="">gmail.com</option>
                            </select>
                     	</td>
                   	 </tr>
                     <tr>
	                     <td></td>
	                     <td><input type="password" placeholder="비밀번호"></td>
                     </tr>
                     <tr>
	                     <td></td>
	                     <td><input type="password" placeholder="비밀번호 확인"></td>
                     </tr>
                     <tr>
	                     <td></td>
	                     <td><input type="text" class="readonly" placeholder="이름" readonly></td>
                     </tr>
                     <tr>
	                     <td></td>
	                     <td><input type="text" placeholder="휴대전화 번호"></td>
                     </tr>
                 </table>
              </form>                
         </div>
         <div class="mypageButton">
             <div>
                 <button class="bright">확인</button>
             </div>               
             <button class="dark">취소</button>
         </div>
    </div>