<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
		
		body {
			margin: 0 auto; background: #f5f6f7; position: relative;
		}
		
		#header {
			max-width: 768px; min-width: 460px; margin: 0 auto;
		
		}
		
		#heda {
			margin: 0 auto; position: relative; overflow: hidden;
		}
		.headline {
			font-size: 50px;
		}
		
		.must_chk {
			color: #08a600;
		}
		</style>
		
		<script type="text/javascript">
		
		function testFnc() {
			var must1 = document.getElementById("must1");
			var must2 = document.getElementById("must2");
			var chk = document.getElementById('chk_plz');	
		
				if(must1.checked == false) {
					chk.innerHTML = '네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.';
				}else if (must2.checked == false) {
					chk.innerHTML = '네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.';
				}else {
					location.href='./join';
				}
				
// 			}
			
			
		}
		
		function chkFnc() {
			var chkall = document.getElementById("All");
			var chk = document.getElementsByName("chk");
			if (chkall.checked == true) {
				for (var i = 0; i <= 3; i++) {
					chk[i].checked = true;
					
				}
				
			}if (chkall.checked == false) {
				for (var i = 0; i <= 3; i++) {
					chk[i].checked = false;
					
				}
				
			}
			
			
		}
		</script>
		
	</head>
	
	<body>
	<div id='header' role="banner">
		<h1 id='head'>
			<a href="../auth/login">
				<span class='headline'>NAVER</span>
			</a>
		</h1>
	
	
		<div>
			<form >
				<input type="checkbox" id='All' onclick="chkFnc();">NAVER한국어네이버 회원가입네이버 이용약관
					, 개인정보 수집 및 이용, 위치기반서비스 이
					<br>용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.<br>
					<div></div>
				<input type="checkbox" id="must1" name="chk" class="must_chk">(필수)<br>
				<input type="checkbox" id="must2" name="chk" class="must_chk">(필수)<br>
				<input type="checkbox"  name="chk">(선택)<br>
				<input type="checkbox"  name="chk">(선택)
				<p id='chk_plz'></p>
				<input type="button" value="취소" onclick="location.href='./login'">
				<input type="button" value="확인" onclick="testFnc();">
			</form>
			</div>
		</div>
	
	</body>
</html>