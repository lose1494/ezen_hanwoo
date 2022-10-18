<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/member/join.css" />
<link rel="stylesheet" href="/css/common.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="event.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="header2 wrap">
	<h2 id="title">회원정보 입력</h2>

	<div id="form" class="fom">
		<div class="form_wrap">
			<table class="input_form">
				<tr>
					<td><label>아이디</label></td>
					<td><input type="text" name="users_id" id="search_id" class="inputData">
						<input type="button" name="check_btn" id="check_btn" value="중복확인" class="fonbutton"> 
						<span id="result"></span>
					</td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" name="users_name" class="inputData"></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="users_pw" class="inputData"></td>
				</tr>
				<tr>
					<td><label>비밀번호 확인</label></td>
					<td><input type="password" name="pwCheck"></td>
				</tr>


				<tr>

					<td><label>이메일</label></td>
					<td><input type="text" name="users_email" class="inputData"></td>
				</tr>
				<tr>
					<td><label>핸드폰 번호</label></td>
					<td><input type="text" name="users_phone" class="inputData"></td>
				</tr>

				<tr>
					<td><label>주소</label></td>
					<td>
						<input type="text" id="users_address1" name="users_address1" placeholder="우편번호" class="inputData"> 
						<input type="button" onclick="addressAdd()" value="우편번호 찾기" class="fonbutton1"><br> 
						<input type="text" id="users_address2" name="users_address2" placeholder="도로명주소" class="inputData"><br>
						<input type="text" id="users_address3" name="users_address3" placeholder="상세주소" class="inputData"><br></td>
				</tr>

				<tr>
					<td><label>생년월일</label></td>
					<td>
						<div>
							<input type="date" name="users_birth_date" class="inputData">
						</div>
					</td>

				</tr>
			</table>
		</div>
		<button id="submitBtn" class="button">확인</button>
		<button class="button2">취소</button>

	</div>
</div>

<script>
	//주소찾기 
	function addressAdd() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
	
						var roadAddr = data.roadAddress; // 도로명 주소 변수
	
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('users_address1').value = data.zonecode; //우편번호
						document.getElementById("users_address2").value = roadAddr; //도로명 
						document.getElementById("users_address3").value = data.jibunAddress; //상세주소
						self.close();
					}
				}).open();
	}
	$(function() {
		
		
		
		//중복확인 
		var idCheck = false;
		$("#check_btn").click(function() { //check_btn 클릭 시 실행되는 함수 

			var userId = $("#search_id").val();  //userID = search_id 값
			console.log(userId);                 //console.log에 usersId 값 확인 체크

			$.ajax({                             // $.ajax({    }); = ajax 공식 (비동기식 데이터 통신)
				async : true,                    // asynchronous : true ( default 값 , 비동기식 동작 )
				type : 'POST',                   // type : GET or POST
				data : userId,                   // data : 서버로 보낼 데이터 (String or Map)
				url : "/member/idCheck",         // url : 요청이 전송되는 경로url  
				dataType : "json",               // dataType: 서버측에서 전송받은 데이터의 형식 (default : xml, json, script, text, html)
				contentType : "application/json; charset-UTF-8",  //contentType: 서버로 데이터를 보낼 때 content 유형
				success : function(data) {                        //success : 성공 시 실행되는 함수 
					var data_num = Number(data);                 
					if (data_num == 0) {
						$("#result").text('사용할 수 있는 아이디입니다.');
						idCheck = true;
					} else {

						$("#result").text('사용할 수 없는 아이디입니다.');
						result = 1;
					}
				},
				error : function(error) {
					alert("사용할 아이디를 입력해주세요.");
				}
			});
		});
		
		// 유효성 체크
		$("#submitBtn").click(function() {
			if (idCheck) {
				var data = {}; //
				var inputData = document.querySelectorAll(".inputData"); // inputData클래스 전체 선택 == getElementsByClassName
				try {
					inputData.forEach(function(item, idx) {            	 // forEach Callback => 변수.forEach(function( element, index) { });
						if($(item).val() === "") {                       // === : dataType까지 같다. 
							if ($(item)[0].name ==="users_id") {
								alert("아이디를 입력해 주세요.");
								throw new Error("");                     // 강제로 Exception 객체를 생성. 한번 더 예외처리
							} else if ($(item)[0].name ==="users_name"){
								alert("이름을 입력해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_pw"){
								alert("비밀번호를 입력해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_email"){
								alert("이메일을 입력해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_phone"){
								alert("핸드폰번호를 입력해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_address1"){
								alert("주소를 확인해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_address2"){
								alert("주소를 확인해 주세요.");
								throw new Error("");
							} else if ($(item)[0].name ==="users_address3"){
								alert("주소를 확인해 주세요.");
								throw new Error("");
							}					 
						} else {
							if ($(item)[0].name ==="users_id") {
								data.users_id = $(item)[0].value;
							} else if ($(item)[0].name ==="users_name"){
								data.users_name = $(item)[0].value;
							} else if ($(item)[0].name ==="users_pw"){
								data.users_pw = $(item)[0].value;
							} else if ($(item)[0].name ==="users_email"){
								data.users_email = $(item)[0].value;
							} else if ($(item)[0].name ==="users_phone"){
								data.users_phone = $(item)[0].value;
							} else if ($(item)[0].name ==="users_address1"){
								data.users_address1 = $(item)[0].value;
							} else if ($(item)[0].name ==="users_address2"){
								data.users_address2 = $(item)[0].value;
							} else if ($(item)[0].name ==="users_address3"){
								data.users_address3 = $(item)[0].value;
							}	
						}
					});
					console.log(data);
				} catch(err) {
					return;
				}
				$.ajax({
					async : true,
					type : 'POST',
					data : JSON.stringify(data), 
					url : "/member/joinAction",
					// dataType : "json"생략,
					contentType : "application/json; charset-UTF-8",
					success : function(data) {
						// console.log("success", data);
						alert("회원가입이 완료되었습니다.");
						location.href='/member/login';
					},
					error : function(error) {
						// console.log("error", error);
						alert("다시 시도해주세요.");
						location.href='/member/join';
						return;
					}
				});
			} else {
				alert("아이디 중복확인을 해주세요.");
			}
		});
	});
</script>
