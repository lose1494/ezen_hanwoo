<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>정보수정</h3>
        <form action="password" id="pwForm" method="post">
	        <div class="backgroundDiv">
	            <p>고객님의 안전한 정보 보호를 위하여 비밀번호를 한번 더 확인합니다.<br>
	            비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.</p>
	            <input type="password" name="pw" class="pw" placeholder="비밀번호를 입력해주세요.">
	        </div>
	        <div class="mypageButton">
	            <div>
	                <button class="bright" onclick="return pwcheck()">확인</button>
	            </div>               
	            <button type="button" class="dark">취소</button>
	        </div>
        </form>
    </div>

    <script>
        function pwcheck() {
                let pw = document.getElementsByClassName('pw')[0].value;
                //널체크 Empty체크
                if( isEmpty(pw) || pw.length < 4 ) {
                    alert('비밀번호를 다시 확인해주세요.');
                    document.getElementsByClassName('pw')[0].focus();
                    //유효하지 않은 값
                    return false; //통신 안됨.(submit 중단)
                }
                return true;     
        }
        
        var isEmpty = function(value){
            if( value == "" || value == null || value == undefined 
                || ( value != null && typeof value == "object" &&
                        !Object.keys(value).length ) ){    
                return true;
            }else{
                return false;
            }
            };
    </script>