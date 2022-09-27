<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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

		<span style="font-size: 14px;">찾으려는 아이디를 선택해 주세요.</span>
		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span>네이버 아이디</span>
		</div>

		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span style="height: 65px;">로그인 전용 아이디</span>
		</div>

		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span style="height: 65px;">단체 아이디</span>
		</div>
	</div>


</body>

</html>