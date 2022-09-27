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
	
	#menuTable {
		display: none;
	}

</style>

<script type="text/javascript">
	window.onload function () {
		function findIdFnc() {
			var idObj = document.getElementById("idTable");
			var pwdObj = document.getElementById("pwdTable");
			
			if(status == 1) {
				idObj.style.display = "block";
				idObj.style.color = "#FBFD14";
				pwdObj.style.display = "none";
			} else {
				idObj.style.display = "none";
				pwdObj.style.display = "block";
			}
		}
	}
</script>

</head>

<body>
	<div class="top">
		<a href="./login" target="_self">
		<img style="padding-top: 5px; display: inline-block; float: left;"
			src="./findIdSmallLogo.png"></a>
		<a href="./findId.jsp" style="color: #FFFFFF; text-decoration: none; 
			font-weight: bold; font-size: 12px;">내정보</a>
		<span onclick="location.href='./login'" style="width: 45px; 
			height: 20px; font-size: 12px; padding-top: 5px; color: #FFFFFF; 
			text-align: center; float: right; cursor: pointer;">로그인</span>
	</div>

	<div style="height: 60px;" id="menuTable">
		<form>
			<ul>
				<li id="idTable" style="text-decoration: none; display: inline-block;">
					<input type="button" value="아이디 찾기" onclick="findIdFnc()">
				</li>
				<li id="pwdTable" style="text-decoration: none; display: inline-block;">
					<input type="button" value="비밀번호 찾기" onclick="findIdFnc()">
				</li>

			</ul>
		</form>
	</div>

	<div style="margin: 0px 155px 0px 155px; padding: 25px 0px 50px 0px">
		<img src="./h_find_id2.gif">
		<br>
		<hr color="lightgray" width='100%' style="margin-top: 0px; 
		float: left; margin-bottom: 10px;">

		<span style="font-size: 14px;">아이디 찾는 방법을 선택해 주세요.</span>
		
		<div style="position: relative; z-index: 100; 
			padding: 39px 40px 20px; border: 1px solid #e5e5e5;">
			<div>
				
				<label for="together" style="margin-right: 200px; 
					font-size: 14px; color: #333; cursor: pointer;">
					<input type="radio" id="together" checked="checked">
					<strong>회원정보에 등록한 휴대전화로 인증</strong>
				</label>
				<p style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 
					인증번호를 받을 수 있습니다.</p>
			</div>
			
			<div>
				<span style="font-size: 12px;">
				<strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
				<input type="text" style="width: 200px; height: 20px;"></span>
			</div>
			<div>
				<span style="font-size: 12px;">
					<strong>휴대전화&nbsp;</strong>
					<select style="width: 70px; height: 20px; font-size: 12px;">
					<option value="82">+82</option></select>
				</span><input type="text" style="width: 160px; height: 20px;">
			</div>
		alert()	<%=request.getAttribute("mid")%>
			
	
		</div>
	</div>
</body>

</html>