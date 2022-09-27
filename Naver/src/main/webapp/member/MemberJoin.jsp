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
		
		
		</script>
		
	</head>
	
	<body>
	<div>
		<form name='joinForm' action='./join' method='post'>
		아이디 <input type='text' name='mid'><br>
				<p id ='chk'></p>
		비밀번호 <input type='password' name='pwd'><br>
		비밀번호 재확인 <input type='password' name='chkPwd'><br>
		이름 <input type='text' name='mname'><br>
		생년월일 <input type='text' name='birthdate'><br>
		이메일 <input type='text' name='email'><br>
			<input type="submit" value='가입하기' onclick="joinFnc();">
		</form>	
	</div>	
	</body>
</html>