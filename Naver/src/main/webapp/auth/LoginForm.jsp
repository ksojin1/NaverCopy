<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#mainLogo {
	color: #47C83E;
	font-size: 20px;
	font-weight: bold;
}

.titleForm {
	width: 400px;
}
</style>

<title>네이버 : 로그인</title>

<script type="text/javascript">
window.onload = function() {
	var idObj = document.getElementById('mid');
		idObj.style.color = '#FF0000';
		idObj.value = '아이디를 입력해주세요.';

		idObj.addEventListener('focusout', function(e) {
		if (idObj.value == '') {
			this.style.color = '#FF0000';
			this.value = '아이디를 입력해주세요.';
		}
	});

		idObj.addEventListener('focus', function(e) {
		this.style.color = 'black';
		if (idObj.value == 'insert Id') {
			this.value = '';
		}
	});
	
	var createBtn = document.getElementById('createID');
	createBtn.style.backgroundColor = 'green';
	createBtn.style.color = 'white';
	createBtn.addEventListener('click', function(e) {
		if (inputPass1Obj.value == inputPass2Obj.value) {
			location.href = './naverCongratu.jsp';
		} else {
			alert('정보를 올바르게 입력해주세요');
		}
	});
</script>

</head>

<body>
	<div id='mainLogo'>
		<h1>NAVER</h1>
	</div>

	<form action="./login.jsp" method="post">
		<div style="border: 1px solid black;">
			<ul>
				<li>ID 로그인</li>
				<li>일회용 번호</li>
				<li>QR코드</li>
			</ul>

			<div>
				<input type="text" name="mid" placeholder="아이디"><br> <input
					type="password" name="pwd" placeholder="비밀번호">
			</div>

			<br>

			<div>
				<input type="checkbox" style="color: #EAEAEA">
				<span onclick="keepLoginStatusFnc();">로그인 상태 유지</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span>IP보안</span>
			<br>
				<input type="submit" value="로그인">
			</div>
		</div>
	</form>
		<span>비밀번호 찾기</span>&nbsp;<span>아이디 찾기</span>&nbsp;<span>회원가입</span>
</body>

</html>