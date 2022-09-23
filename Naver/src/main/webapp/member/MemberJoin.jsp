<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
		
		</style>
		
		<script type="text/javascript">
		function Fnc() {
			var midObj = document.getElementsByName('mid').value;
			var pwdObj = document.getElementsByName('pwd').value;
			var chkPwdObj = document.getElementsByName('chkPwd').value;
			var mnameObj = document.getElementsByName('mname').value;
			var bdObj = document.getElementsByName('birthDate').value;
			var emailObj = document.getElementsByName('email').value;
			
			if (midObj = '') {
				
			}
		}
		</script>
		
	</head>
	
	<body>
		<form action='./join' method='post'>
		아이디 <input type='text' name='mid'><br>
		비밀번호 <input type='password' name='pwd'><br>
		비밀번호 재확인 <input type='password' name='chkPwd'><br>
		이름 <input type='text' name='mname'><br>
		생년월일 <input type='text' name='birthDate'><br>
		이메일 <input type='text' name='email'><br>
		<input type="submit" value='가입하기' onclick="Fnc();">
	</form>	
		
	</body>
</html>