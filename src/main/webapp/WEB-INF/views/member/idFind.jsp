<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!-- My CSS -->
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/member/idFind.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>



<div class="wrap">
	<h2>아이디/비밀번호찾기</h2>
	<div id="inputForm">
		<table>
			<tr class="idname">
				<td>
					<h4>아이디 찾기</h4>
				</td>
			</tr>
			<tr>
				<td>
                    <input id="userNameI" type="text" placeholder="이름 ">
				</td>
			</tr>
			<tr>
				<td>
                    <input id="userPhoneI" type="text" placeholder="휴대전화 번호">
				</td>
			<tr>
				<td>
                    <Button class="button" id="idFindBtn">아이디 찾기</Button>
				</td>
			</tr>

			<tr>
				<td>
					<h4>비밀번호찾기</h4>
				</td>
			</tr>
			<tr>
				<td>
                    <input id="userIdP" type="text" placeholder="아이디"></td>
			</tr>
			<tr>
				<td>
                    <input id="userNameP" type="text" placeholder="이름 ">
				</td>
			</tr>
			<tr>
				<td>
                    <input id="userPhoneP" type="text" placeholder="휴대전화 번호 ">
				</td>
			</tr>
            <tr>
				<td>
                    <Button class="button" id="pwFindBtn">비밀번호 찾기</Button>
				</td>
			</tr>
		</table>
	</div>

</div>

<script>
$(function() {
	
        $('#idFindBtn').click(function() {
            var userName = $('#userNameI').val(); 
            var userPhone = $('#userPhoneI').val(); 
		
            var data = {
                userName: userName,
                userPhone: userPhone,
            };
            console.log(data);
            $.ajax({
                async : true,
                type : 'POST',
                data : JSON.stringify(data),
                url : "/member/find",
                /* dataType : "json", */
                contentType : "application/json; charset-UTF-8",
                success : function(data) {
                    console.log("success", data);
                     alert("아이디는 "+ data.USERS_ID +"입니다.");
                   /*  location.href='/member/login';  */
                },
                error : function(error) {
                     console.log("error", error);
                   alert("id다시 시도해주세요.");
                   /*   location.href='/admin/admin_noticewrite'; */
                    return;
                }
            });
        });

         $('#pwFindBtn').click(function() {
            var userId = $("#userIdP").val();
            var userName = $('#userNameP').val();
            var userPhone = $('#userPhoneP').val();
            var data = {
                userId: userId,
                userName: userName,
                userPhone: userPhone,
            };
            console.log(data);
            $.ajax({
                async : true,
                type : 'POST',
                data : JSON.stringify(data),
                url : "/member/find",
                /* dataType : "json", */
                contentType : "application/json; charset-UTF-8",
                success : function(data) {
                    // console.log("success", data);
                    alert("비밀번호는" + data.USERS_PW + "입니다.");
/*                     location.href='/member/login';
 */                },
                error : function(error) {
                    // console.log("error", error);
                    console.log("1111111111111111")
                    alert("pw다시 입력해주세요.");
                    // location.href='/admin/admin_noticewrite';
                    return;
                }
            });
        }); 
         
	 });
</script>
