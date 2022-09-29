<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 : 네이버</title>

<style type="text/css">
	.top {
		background-color: #353B49; height: 30px; margin: 0;
		position: fixed; top: 0; width: 100%;
	}
	.topImg1 {
		padding-top: 6px; display: inline-block; float: left;
	}
	.myInfoBtn {
		color: #FFFFFF; text-decoration: none; font-weight: bold; font-size: 12px;
	}
	.smallLoginBtn {
		width: 45px; height: 20px; font-size: 12px; padding-top: 6px; color: #FFFFFF; 
		text-align: center; float: right; cursor: pointer;
	}
	.menuTable {
		width: 100%; height: 60px; background-color: #5BB91B; margin-top: 30px;
	}
	.menuTableUl {
		padding: 0px 150px 0px 150px;
	}
	.menuTableLi {
		text-decoration: none; display: inline-block;
	}
	.findIdBtn {
		background-color: #5BB91B; color: #FFFFFF; border: none; padding-right: 150px; 
		cursor: pointer; line-height: 55px; font-size: 14px; font-weight: bold; l
	}
	.infoTextDiv {
		margin: 0px 155px 0px 155px; padding: 25px 0px 50px 0px;
	}
	.infoTextDivHr {
		margin-top: 0px; width: 700px;; float: left; margin-bottom: 0px;
	}
	.infoTextDivTxt {
		font-size: 14px;
	}
	.findTypeDivId {
		margin: 25px 0px 25px 0px; border: 1px solid #888; height: 80px; width: 700px;
	}
	.naverId {
		width: 45px; height: 30px; font-size: 16px; padding: 20px 50px 20px 50px;
		color: #333; text-align: center; cursor: pointer; line-height: 80px; margin: 0 auto;
	}
</style>

</head>

<body>
	<div class="top">
		<a href="./login" target="_self">
			<img class="topImg1" src="./findIdSmallLogo.png"></a>
		<a href="./findId" class="myInfoBtn">내정보</a>
		<span class="smallLoginBtn" onclick="location.href='./login'">로그인</span>
	</div>

	<div class="menuTable">
		<ul class="menuTableUl">
			<li class="menuTableLi">
				<input type="button" class="findIdBtn" value="아이디 찾기"
					onclick="location.href='./findId'"></li>
			<li class="menuTableLi">
				<input type="button" class="findIdBtn" value="비밀번호 찾기"
					onclick="location.href='#'"></li>
		</ul>
	</div>

	<div class="infoTextDiv">
		<img src="./h_find_id2.gif"><br>
		<hr color="lightgray" class="infoTextDivHr"><br>
		<span class="infoTextDivTxt">찾으려는 아이디를 선택해 주세요.</span>
		
		<div class="findTypeDivId">
			<span onclick="location.href='./findId2.jsp'" class="naverId">
				네이버 아이디</span>
		</div>

		<div class="findTypeDivId">
			<span onclick="location.href='#'" class="naverId">
				로그인 전용 아이디</span>
		</div>
		
		<div class="findTypeDivId">
			<span onclick="location.href='#'" class="naverId">
				단체 아이디</span>
		</div>
	</div>
</body>

</html>