<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 로그인</title>

<style type="text/css">
	#mainLogo {
		margin-top: 108px; padding-bottom: 48px; text-align: center;
	}
		
	#titleForm {
		border: 1px solid #BDBDBD; text-align: center; width: 460px; 
		margin: 0 auto; padding-bottom: 20px;
	}
	
	#loginMethodList {
		font-size: 16px; padding: 10px;
	}
	
	#loginMethodList>li {
		display: inline-block; padding-right: 45px;
	}
	
	#loginMethodList>li>a {
		text-decoration: none; color: #333333;
	}
	
 	#otherLoginMethod { 
 		text-align: center;
	
	}
	.idTextBox {
		width: 400px; height: 40px; font-size: 16px; cursor: pointer;
	}
	.loginBtnShape {
		width: 400px; height: 50px; font-size: 18px; font-weight: bold;
		background-color: #03C75A; color: #fff; border: thin;
		margin-bottom: 5px; 
	}
	#alertMessage {
		font-size: 13px; color: #FF003E; text-align: left; padding-left: 30px;
	}
	#otherLoginMethodList {
		display: inline-block; font-size: 14px; color: #888; 
		text-decoration: none; padding: 0px;
	}
	#otherLoginMethodList > li {
		display: inline-block; font-size: 14px; color: #888;
		text-decoration: none;
	}
	#otherLoginMethodList > li > a {
		display: inline-block; font-size: 14px; color: #888; 
		text-decoration: none;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		var idObj = document.getElementById('idBox');
		var pwdObj = document.getElementById('pwdBox');
		var alertMessageObj = document.getElementById('alertMessage');
		var loginBtnObj = document.getElementById('loginBtn');
		
		loginBtnObj.addEventListener('click', function() {
			if (idObj.value == '') {
				event.preventDefault();
				alertMessageObj.style.visibility = 'visible';
				alertMessageObj.innerHTML = '<strong>아이디</strong>를 입력해주세요.';

			} else if (pwdObj.value == '') {
				event.preventDefault();
				alertMessageObj.style.visibility = 'visible';
				alertMessageObj.innerHTML = '<strong>비밀번호</strong>를 입력해주세요.';
			}
		});
	}
</script>

</head>

<body>
	<div>
		<div id='mainLogo'>
			<a href="./login" title="메인으로 이동" target="_self">
				<img src="./NaverLoginLogo.png" alt=""></a>
		</div>
		
		<div id='titleForm'>
			<form action="./login" method="post">
				<div>
					<ul id='loginMethodList'>
						<li><a href="./login">ID 로그인</a>&nbsp;</li>
						<li><a href="#">일회용 번호</a>&nbsp;</li>
						<li><a href="#">QR코드</a></li>
					</ul>
				</div>
				
				<div>
					<input type="text" name="mid" id="idBox" 
						class="idTextBox" placeholder="아이디">
				<br>
					<input type="password" name="pwd" id="pwdBox" 
						class="idTextBox" placeholder="비밀번호">
				</div>
	
				<div style="margin-top: 5px;">
					<label for="together" style="margin-right: 200px; 
						font-size: 14px; color: #888; cursor: pointer;">
					<input type="checkbox" id="together">로그인 상태 유지</label>
						&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="font-size: 14px; color: #888; 
						cursor: pointer;">IP보안</span>
				</div>
				<p id="alertMessage">
					<%=request.getAttribute("loginCkStr")%></p>
				<br>
				
				<div>
					<input type="submit" id="loginBtn" 
						class="loginBtnShape" value="로그인">
				</div>
			</form>
		</div>
		
		<div id="otherLoginMethod">
			<ul id="otherLoginMethodList">
				<li><a href="#">비밀번호 찾기</a>&nbsp;&nbsp;</li>
				<li>I&nbsp;&nbsp;</li>
				<li><a href="./findId">아이디 찾기</a>&nbsp;&nbsp;</li>
				<li>I&nbsp;&nbsp;</li>
				<li><a href="../member/add">회원가입</a></li>
			</ul>
		</div>
	</div>
</body>

</html>