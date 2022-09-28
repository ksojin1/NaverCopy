<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>네이버 : 회원가입</title>
		
		<style type="text/css">
		body{
			margin: 0 auto;
		}
		
		#wrap{
			width: 600px; margin: 0 auto;
		}
		
		#header{
			margin: 0 auto; text-align: center;
		}
		
		}
		.chk_plz{
			color: red;
		}
		
		.bir_yy{
			display: table-cell;
			table-layout: fixed;
			width: 25%;
		}
		.bir_mm{
			display: table-cell;
			width: 25%;
		}
		.bir_dd{
			display: table-cell;
			width: 25%;
		}
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
				var spptObj = /[`~!@#$%^&*|\\\";:\/?]/gi;
				var allchk = document.getElementById('all_chk');
				
				var chk1, chk2, chk3, chk4, chk5, chk6 = false;
				
				chk1 = <%=request.getAttribute("addCheck")%>;
				
				allchk.addEventListener('click', function(e) {
					if (!chk1 || !chk2 || !chk3 || !chk4 || !chk5 || !chk6) {
						e.preventDefault();
					}
				});
				
				midObj.addEventListener('blur', function() {
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
					}else if (pwdObj.value.length < 8) {
						pwdChkObj.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
					}else {
						chk2 = true;
						pwdChkObj.innerHTML = '';
					}
				});
				
				chkPwdObj.addEventListener('blur', function() {
					if (chkPwdObj.value == '') {
						chkPwdChkObj.innerHTML = '필수정보입니다';
					}else if (pwdObj.value != chkPwdObj.value) {
						chkPwdChkObj.innerHTML = '비밀번호가 일치하지 않습니다.';
					}else if (pwdObj.value = chkPwdObj.value) {
						chk3 = true;
						chkPwdChkObj.innerHTML = '';
					}	
				});
				
				mnameObj.addEventListener('blur', function() {
					if (mnameObj.value == '') {
						nameChkObj.innerHTML = '필수정보입니다';
					}else {
						chk4 = true;
						nameChkObj.innerHTML = '';
					} 
				});
				
				birthdateObj.addEventListener('blur', function() {
					if (birthdateObj.value == '') {
					}else {
						chk5 = true;
					} 
				});
				
				emailObj.addEventListener('blur', function() {
					if (emailObj.value == '') {
					}else {
						chk6 = true;
					} 
				});
			}
			
		</script>
		
	</head>
	
	<body>
		<div id='wrap'>
		<div id='header'>
			<h1>
				<a href="../auth/login">
					<img style="width: 300px; height: 100px;"  src="../auth/naver.png">
				</a>
			</h1>
		</div>	
			<form  action='./join' method='post'>
				<div>
					<h3>아이디</h3>
					<span>
					 <input type='text' id='mid' name='mid' value="<%=request.getAttribute("userId")%>" >
				 	</span>
				 </div>	
				 <p id ='id_plz' class="chk_plz"><%=request.getAttribute("msg")%></p>
				 <div>
				 	<h3>비밀번호</h3>
				 	<span>
				 		<input type='password' id='pwd' name='pwd'>
				 	</span>
				</div>
			 	<p id ='pwd_plz' class="chk_plz"></p>
			 	<div>
			 		<h3>비밀번호 재확인</h3>
			 		<span>
			 			<input type='password' id='chkPwd' name='chkPwd'>
			 		</span>
				</div>
				<p id ='chkPwd_plz' class="chk_plz"></p>
				
				<div>
					<h3>이름</h3>
					<span>
				 		<input type='text' id='mname' name='mname'>
					</span>
				</div>
				<p id ='name_plz' class="chk_plz"></p>
				<div class="bir_wrap">
					<h3>생년월일</h3>
					<div class="bir_yy">
						<span>
							<input type="text"  placeholder="년(4자)">
						</span>
					</div>
					<div class="bir_mm">
						<span>
							<select>
								<option value>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</span>
					</div>
					<div class="bir_dd">
						<span>
							<input type="text" placeholder="일">
						</span>
					</div>
					
				 <input type='text' id='birthdate' name='birthdate'><br>
				</div>	
				<div>
					<h3>이메일</h3>
					<div>
						<span>
						 	<input type='text' id='email' name='email'>
						</span>
					</div>	
				</div>
					<input id='all_chk' type="submit" value='가입하기'>
				</div>
			</form>	
		</div>	
	</body>
</html>