<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="3;url=./findId2.jsp">
<title>로그인 실패</title>

<style type="text/css">
	.top {
		background-color: #353B49;
		height: 29px;
		margin: 0 0 0 auto;
	}
</style>

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

		<span style="font-size: 14px;">아이디를 찾을 수 없습니다.
		<br>이름과 이메일을 확인해 주세요.
		<br>잠시 후 이전 화면으로 이동합니다.</span>
	</div>	
		
</body>
</html>