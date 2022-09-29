<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 : 네이버</title>

<style type="text/css">
	.top {
		background-color: #353B49;
		height: 29px;
		margin: 0 0 0 auto;
	}

	
</style>

<script type="text/javascript">
	window.onload = function () {
		var hide1Obj = document.getElementById("hide1");
		var hide2Obj = document.getElementById("hide2");
		var hide3Obj = document.getElementById("hide3");
		var hide4Obj = document.getElementById("hide4");
		
	
		var radioSelectObj = document.getElementsByClassName("radioSelect");
			radioSelectObj[0].addEventListener('change', aNh1);
			radioSelectObj[1].addEventListener('change', aNh2);
			radioSelectObj[2].addEventListener('change', aNh3);
			radioSelectObj[3].addEventListener('change', aNh4);
		
		var nameObj = document.getElementById("nameTable");
		var emailObj = document.getElementById("emailTable");
		var sendIdAndPhoneObj = document.getElementById('sendIdAndPhone');
		
		sendIdAndPhoneObj.addEventListener('click', function() {
			
			if (nameObj.value == '') {
				event.preventDefault();
				alert("이름을 입력해 주세요");

			} else if (emailObj.value == '') {
				event.preventDefault();
				alert("이메일 주소를 정확하게 입력해 주세요.");
			} 
		});
		
		function aNh1() {
			console.log('in');
			if(radioSelectObj[0].checked == true) {
				console.log('in1');
				hide1Obj.style.display = "block";
				hide2Obj.style.display = "none";
				hide3Obj.style.display = "none";
				hide4Obj.style.display = "none";
			}
		}
		function aNh2() {
			if(radioSelectObj[1].checked == true) {
				console.log('in2');
				hide1Obj.style.display = "none";
				hide2Obj.style.display = "block";
				hide3Obj.style.display = "none";
				hide4Obj.style.display = "none";
			}
		}
		function aNh3() {
			if(radioSelectObj[2].checked == true) {
				console.log('in3');
				hide1Obj.style.display = "none";
				hide2Obj.style.display = "none";
				hide3Obj.style.display = "block";
				hide4Obj.style.display = "none";	
			}
		}
		function aNh4() {
			if(radioSelectObj[3].checked == true) {
				console.log('in4');
				hide1Obj.style.display = "none";
				hide2Obj.style.display = "none";
				hide3Obj.style.display = "none";
				hide4Obj.style.display = "block";	
			}
		}
		radioSelectObj[1].checked = true;
		aNh2();
	}	
</script>

</head>

<body>
	<div class="top">
		<a href="./login" target="_self">
		<img style="padding-top: 5px; display: inline-block; float: left;" 
			src="./findIdSmallLogo.png"></a>
		<a href="./findId" style="color: #FFFFFF; text-decoration: none; 
			font-weight: bold; font-size: 12px;">내정보</a>
		<span onclick="location.href='./login'" style="width: 45px; 
			height: 20px; font-size: 12px; padding-top: 5px; color: #FFFFFF; 
			text-align: center; float: right; cursor: pointer;">로그인</span>
	</div>

	<div style="width: 100%; height: 60px; background-color: #5BB91B; 
		margin: 0px;" id="menuTable">
		<ul style="padding: 0px 150px 0px 150px;">
			<li id="idTable" style="text-decoration: none; display: inline-block;">
				<input type="button" value="아이디 찾기" onclick="location.href='./findId'"
					style="background-color: #5BB91B; color: #FFFFFF; border: none;
					padding-right: 200px; cursor: pointer; line-height: 55px;
					font-size: 14px; font-weight: bold;"></li>
			<li id="pwdTable" style="text-decoration: none; display: inline-block;">
				<input type="button" value="비밀번호 찾기" onclick="location.href='#'"
					style="background-color: #5BB91B; color: #FFFFFF; border: none;
					padding-right: 200px; cursor: pointer; line-height: 55px;
					font-size: 14px; font-weight: bold;"></li>
		</ul>
	</div>
	
	<div style="margin: 0px 155px 0px 155px; padding: 25px 0px 50px 0px">
		<img src="./h_find_id2.gif">
		<br>
		<hr color="lightgray" width='100%' style="margin-top: 0px; 
		float: left; margin-bottom: 10px;">

		<span style="font-size: 14px;">아이디 찾는 방법을 선택해 주세요.</span>
		
		<div style="position: relative; width: 600px;
			padding: 39px 40px 20px; border: 1px solid #e5e5e5;">
			<div>
				
				<label for="together1" style="margin-right: 200px; 
					font-size: 14px; color: #333; cursor: pointer;">
					<input type="radio" id="together1" value="1"
					 class="radioSelect" name="radioGroup">
					<strong>회원정보에 등록한 휴대전화로 인증</strong>
				</label>
				<p style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 
					인증번호를 받을 수 있습니다.</p>
			</div>
		<div id="hide1">	
		<form action="./findId" method="post">
			<div>
				<span style="font-size: 12px;">
				<strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
				<input type="text" style="width: 237px; height: 20px;"></span>
			</div>
			<div>
				<span style="font-size: 12px;">
					<strong>휴대전화&nbsp;&nbsp;</strong>
					<select style="width: 70px; height: 26px; font-size: 12px;">
					<option value="82">+82</option></select>
				</span><input type="text" style="width: 160px; height: 20px;" 
					placeholder="휴대전화번호">
				<input type="button" value="인증하기" 
					style="border: 1px solid #888; background-color: #FFFFFF; 
					font-weight: bold; height: 24px; cursor: pointer;">
			</div>
			<div>
				<span style="color: #888888; font-size: 12px; 
					margin: 1px 0px 0px 80px;">인증번호가 오지 않나요</span>
				<input type="checkbox">
			</div>
		</form>
		</div>
			
			<hr color="#e5e5e5" style="margin: 30px 0px 30px 0px;">
			
			<div>
				<label for="together2" style="margin-right: 200px; 
					font-size: 14px; color: #333; cursor: pointer;">
					<input type="radio" id="together2" name="radioGroup" 
					checked="checked" value="2" class="radioSelect">
					<strong>본인확인 이메일로 인증</strong>
				</label>
				<p style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 
					인증번호를 받을 수 있습니다.</p>
			</div>
		<div id="hide2">		
		<form action="./findId" method="post">
			<div>
				<span style="font-size: 12px;">
				<strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
				<input type="text" id="nameTable" name="name"
					style="width: 217px; height: 20px;"></span>
			</div>
			
			<div>
				<span style="font-size: 12px;">
					<strong>이메일 주소&nbsp;&nbsp;</strong></span>
				<input type="text" id="emailTable" name="email" style="width: 218px; 
					height: 20px;">
				<input type="submit" id="sendIdAndPhone" value="인증하기"
					style="border: 1px solid #888; background-color: #FFFFFF; 
					font-weight: bold; height: 24px; cursor: pointer;">
				<br>
				<input type="text" placeholder="인증번호 6자리 숫자 입력" 
					style="color: #888888; background-color: #FAFAFA;
					height: 22px; border: 1px solid #888; 
					margin: 1px 0px 0px 80px;" disabled="disabled">
			</div>
			<div>
				<span style="color: #888888; font-size: 12px; 
					margin: 1px 0px 0px 80px;">인증번호가 오지 않나요</span>
				<input type="checkbox">
			</div>
		</form>
		</div>
		</div>
		<br>
			<div style="position: relative; width: 600px;
				padding: 39px 40px 20px; border: 1px solid #e5e5e5;
				padding-bottom: 50px;">
			<div>
				<p style="font-size: 14px; font-weight: bold;">
				등록한 회원정보로 찾기 어려우시면, 본인 확인 후 아이디를 찾아드립니다.</p>
				<label for="together3" style="font-size: 14px; color: #333; 
					cursor: pointer;">
					<input type="radio" id="together3" name="radioGroup" value="3"
						 class="radioSelect">
					<strong>본인 명의 휴대전화로 인증</strong>(본인 주민등록번호로 가입된 휴대전화)
				</label>
			<div id="hide3">
				<p style="font-size: 12px; margin-left: 30px;">
					내 명의(주민등록번호)로 가입한 아이디를 찾을 수 있습니다.</p>
			</div>
			</div>
			<div>
			<hr color="#e5e5e5" style="margin: 30px 0px 30px 0px;">
				<label for="together4" style="font-size: 14px; color: #333; 
					cursor: pointer;">
					<input type="radio" id="together4" name="radioGroup" value="4"
						 class="radioSelect">
					<strong>아이핀 인증</strong>
				</label>
				<br>
			<div id="hide4">
				<span style="font-size: 12px; margin-left: 30px;">
					내 명의(주민등록번호)로 가입한 아이디의 일부분을 볼 수 있습니다.<br>
					아이핀이 없다면, 바로 발급받아 사용할 수 있습니다.</span>
				<a href="#" style="color: #1DDB16; font-size: 12px;">
					아이핀 발급받기</a>
			</div>
			</div>
			</div>
		<div style="margin: 30px 270px 30px 270px;">
			<form action="./findId3" method="post">
			<input type="button" id="sendIdAndPhone" value="다음" 
				style="border: 1px solid #e5e5e5; background-color: #FFFFFF; 
				font-size: 14px; width: 60px; height: 35px;
				font-weight: bold; cursor: pointer;">
			</form>
		</div>
		<span style="font-size: 12px; margin-left: 5px; color: #888888;">
					단체 아이디 찾기 시 문제가 있나요?</span>
				<a href="#" style="font-size: 12px;">
					<select style="width: 110px; height: 26px; 
					font-size: 12px; border: none; color: #888888;
					text-decoration: underline;">
					<option>상세내용 펼치기</option></select></a>
		<br>
		<span style="font-size: 12px; margin-left: 5px; color: #888888;">
			아이디 찾기 시 문제가 있나요?</span>
		<a href="#" style="font-size: 12px;">
			<select style="width: 70px; height: 26px; 
			font-size: 12px; border: none; color: #888888;
			text-decoration: underline;">
			<option>바로가기</option></select></a>
	</div>
</body>

</html>