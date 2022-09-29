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

		<span style="font-size: 14px;">찾으려는 아이디를 선택해 주세요.</span>
		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span onclick="location.href='./findId2.jsp'" style="width: 45px; 
			height: 30px; font-size: 16px; padding: 20px 50px 20px 50px; color: #333; 
			text-align: center; cursor: pointer; line-height: 65px; 
			margin: 0 auto;">네이버 아이디</span>
		</div>

		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span onclick="location.href='#'" style="width: 45px; 
			height: 30px; font-size: 16px; padding: 20px 50px 20px 50px; color: #333; 
			text-align: center; cursor: pointer; line-height: 65px; 
			margin: 0 auto;">로그인 전용 아이디</span>
		</div>

		<div style="margin: 25px 0px 25px 0px; border: 1px solid #888; height: 65px;">
			<span onclick="location.href='#'" style="width: 45px; 
			height: 30px; font-size: 16px; padding: 20px 50px 20px 50px; color: #333; 
			text-align: center; cursor: pointer; line-height: 65px; 
			margin: 0 auto;">단체 아이디</span>
		</div>
	</div>


</body>

</html>