<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>네이버 : 회원가입</title>
		
		<style type="text/css">
		
		</style>
		
		<script type="text/javascript">
		
			window.onload = function () {
				var midObj = document.getElementById('mid');
				var idChkObj = document.getElementById('id_plz');
				var pwdObj = document.getElementById('pwd');
				var pwdChkObj = document.getElementById('pwd_plz');
				var chkPwdObj = document.getElementById('chkPwd');
				var chkPwdChkObj = document.getElementById('chkPwd_plz');
				var mnameObj = document.getElementById('mname');
				var nameChkObj = document.getElementById('name_plz');
				var birthdateObj = document.getElementById('birthdate');
				var emailObj = document.getElementById('email');
				var spptObj = '/[`~!@#$%^&*|\\\'\";:\/?]/gi';
				
				
				midObj.addEventListener('change', function() {
					if (midObj.value == '') {
						idChkObj.innerHTML = '필수정보입니다';
					}else if (midObj.value.length < 5) {
						idChkObj.innerHTML = '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.';
					}else {
						location.href = './check?mid=' + midObj.value;
					}
						
					
				});
				
				pwdObj.addEventListener('blur', function() {
					if (pwdObj.value == '') {
						pwdChkObj.innerHTML = '필수정보입니다';
					}else if (pwdObj.value.length < 8 && spptObj.test(pwdObj.value) == false) {
						pwdChkObj.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
					}else {
						pwdChkObj.innerHTML = '';
					}
				});
				
				chkPwdObj.addEventListener('blur', function() {
					if (chkPwdObj.value == '') {
						chkPwdChkObj.innerHTML = '필수정보입니다';
					}else if (pwdObj.value != chkPwdObj.value) {
						chkPwdChkObj.innerHTML = '비밀번호가 일치하지 않습니다.';
					}else if (pwdObj.value = chkPwdObj.value) {
						chkPwdChkObj.innerHTML = '';
					}	
				});
				
				mnameObj.addEventListener('blur', function() {
					if (mnameObj.value == '') {
						nameChkObj.innerHTML = '필수정보입니다';
					}else {
						nameChkObj.innerHTML = '';
					} 
				});
			}
			
		</script>
		
	</head>
	
	<body>
	<div>
		<form  action='./join' method='post'>
		아이디 <input type='text' id='mid' name='mid' value="<%=request.getAttribute("userId")%>" ><br>
				<p id ='id_plz'><%=request.getAttribute("msg")%></p>
		비밀번호 <input type='password' id='pwd' name='pwd'><br>
				<p id ='pwd_plz'></p>
		비밀번호 재확인 <input type='password' id='chkPwd' name='chkPwd'><br>
				<p id ='chkPwd_plz'></p>
		이름 <input type='text' id='mname' name='mname'><br>
				<p id ='name_plz'></p>
		생년월일 <input type='text' id='birthdate' name='birthdate'><br>
				
		이메일 <input type='text' id='email' name='email'><br>
			<input type="submit" value='가입하기'>
		</form>	
	</div>	
	</body>
</html>