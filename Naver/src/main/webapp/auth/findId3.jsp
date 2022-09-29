<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 목록 : 네이버</title>

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

		<span style="font-size: 14px;">고객님의 정보와 일치하는 아이디 목록입니다.</span>
	</div>	
	<div>
		<div style="position: relative; width: 600px; 
			margin: 0px 155px 0px 155px; height: 100px;
			padding: 50px; border: 1px solid #e5e5e5;">
			<div>
				<label for="together1" style="font-size: 14px; 
					color: #333; cursor: pointer;">
					<input type="radio" id="together1" name="radioGroup">
					<strong><%=request.getAttribute("mid")%></strong>
				<span style="margin-left: 300px;">가입: <%=request.getAttribute("cre_date")%></span>
				</label>
			</div>
		</div>
		<div style="margin: 30px 155px 30px 155px;">
		<div style="margin: 0px 170px 0px 170px;">
			<input type="button" id="sendIdAndPhone" value="로그인하기"
				onclick="location.href='./login'" 
				style="border: 1px solid #e5e5e5; background-color: #30C100; 
				font-size: 14px; width: 150px; height: 40px;
				font-weight: bold; cursor: pointer; color: #FFFFFF;">
		
			<input type="button" id="sendIdAndPhone" value="비밀번호 찾기" 
				onclick="location.href='#'" 
				style="border: 1px solid #e5e5e5; background-color: #FFFFFF; 
				font-size: 14px; width: 150px; height: 40px;
				font-weight: bold; cursor: pointer;">
		</div>	
			
		</div>
		<div style="margin: 30px 155px 30px 155px;">
		<span style="font-size: 12px; margin-left: 5px; color: #888888;">
					가입한 아이디가 보이지 않나요?</span>
				<a href="#" style="font-size: 12px;">
					<select style="width: 110px; height: 26px; 
					font-size: 12px; border: none; color: #888888;
					text-decoration: underline;">
					<option>상세내용 펼치기</option></select></a>
		<br>
		<span style="font-size: 12px; margin-left: 5px; color: #888888;">
			내가 가입하지 않은 아이디가 보인다면?</span>
		<a href="#" style="font-size: 12px;">
			<select style="width: 110px; height: 26px; 
			font-size: 12px; border: none; color: #888888;
			text-decoration: underline;">
			<option>상세내용 펼치기</option></select></a>
		</div>
	</div>
</body>

</html>