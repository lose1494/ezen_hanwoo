<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>정보수정</h3>
        <div class="backgroundDiv">           
            <form action="userUpdate" method="post" class="editForm">                
                <table>
                    <tr>        
                        <td colspan="2"><div class="editDiv">*변경할 정보를 입력하세요.</div></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="id" class="readonly" value="${ member.users_id }" readonly></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name" class="readonly" value="${ member.users_name }" readonly></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pw" placeholder="비밀번호"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" placeholder="비밀번호 확인"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" value="${ member.users_email }"></td>
                    </tr>
                    
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="phone" value="${ member.users_phone }"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                        <input type="text" name="address1" id="address1" value="${ member.users_address1 }" readonly>
                        <button type="button" class="dark" onclick="inputAddress()">우편번호 찾기</button><br>
                        <input type="text" name="address2" id="address2" value="${ member.users_address2 }" readonly><br>
                        <input type="text" name="address3" id="address3" value="${ member.users_address3 }">
                        </td> 
                    </tr>
                </table>                    
        </div>
                <div class="mypageButton">
                    <div>
                        <button class="bright">확인</button>
                    </div>               
                    <button type="button" class="dark" onclick="javascript:history.back();">취소</button>
                </div>
            </form>  
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        function inputAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('address1').value = data.zonecode;
                    document.getElementById("address2").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address3").focus();
                }
            }).open();
        }
    </script>