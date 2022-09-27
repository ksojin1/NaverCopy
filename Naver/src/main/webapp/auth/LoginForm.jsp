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
		display: inline-block; margin-top: 108px; vertical-align: top;
	}
		
	#titleForm {
		border: 1px solid #222; text-align: center; width: 460px; 
		height: 300px; margin: 0 auto;
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
	
	#otherLoginMethodList {
		display: inline-block; font-size: 14px; color: #888; 
		text-decoration: none; text-align: center;
	}
	
	#otherLoginMethodList>li {
		display: inline-block; font-size: 14px; color: #888;
		text-decoration: none; text-align: center;
	}
	
	#otherLoginMethodList>li>a {
		display: inline-block; font-size: 14px;
		color: #888; text-decoration: none;
	}
	
	#boxSizeAjdust1 {
		width: 400px; height: 40px;
		font-size: 16px; cursor: pointer;
	}
	
	#boxSizeAjdust2 {
		width: 400px; height: 40px; font-size: 16px; cursor: pointer;
	}
	
	#loginBtnSizeAjdust {
		width: 400px; height: 50px; font-size: 18px; font-weight: bold;
		background-color: #03C75A; color: #fff;
		margin-bottom: 5px;
	}
	
	#alertMessage {
		font-size: 14px; color: #FF003E; text-align: left;
	}
</style>

<script type="text/javascript">
	window.onload = function() {
		var idObj = document.getElementById('boxSizeAjdust1');
		var pwdObj = document.getElementById('boxSizeAjdust2');
		var alertMessageObj = document.getElementById('alertMessage');
		var loginBtnSizeAjdustObj = document.getElementById('loginBtnSizeAjdust');
		
		loginBtnSizeAjdustObj.addEventListener('click', function() {
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
	${memberDto.id}
	<div id='mainLogo'>
		<a href="./login" 
			title="메인으로 이동" target="_self">
		<img src="./NaverLoginLogo.png" alt=""></a>
	</div>
	
	<div id='titleForm'>
		<form action="./login" method="post">
			<div>
				<ul id='loginMethodList'>
					<li><a href="./login">ID 로그인</a>&nbsp;</li>
					<li><a href="./singleUsePwd.jsp">일회용 번호</a>&nbsp;</li>
					<li><a href="./scanQrCode.jsp">QR코드</a></li>
				</ul>
			</div>
			
			<div>
				<input type="text" name="mid" id="boxSizeAjdust1" placeholder="아이디">
			<br>
				<input type="password" name="pwd" id="boxSizeAjdust2" placeholder="비밀번호">
			</div>

			<div style="margin-top: 5px;">
				<label for="together" style="margin-right: 200px; font-size: 14px; 
					color: #888; cursor: pointer;">
				<input type="checkbox" id="together">로그인 상태 유지</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<span onclick="ipProtectFnc();" style="font-size: 14px; color: #888; 
					cursor: pointer;">IP보안</span>
			</div>
			
<!-- 			<span id="alertMessage" style="visibility:hidden">아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.' -->
<!--  					<br>입력하신 내용을 다시 확인해주세요.</span> -->
			<span id="alertMessage"><%=request.getAttribute("loginCkStr")%></span>
			
			
			<br>
			<br>

			<div>
				<input type="submit" id="loginBtnSizeAjdust" value="로그인">
			</div>
		</form>
	</div>
	
	<div>
		<ul id="otherLoginMethodList">
			<li><a href="#">비밀번호 찾기</a>&nbsp;</li>
			<li>I</li>
			<li><a href="./findId">아이디 찾기</a>&nbsp;</li>
			<li>I</li>
			<li><a href="../member/add">회원가입</a></li>
		</ul>
	</div>
</div>
</body>

</html>