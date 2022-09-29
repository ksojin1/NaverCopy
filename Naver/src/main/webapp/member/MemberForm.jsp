<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
		
		body{
			margin: 0 auto;  position: relative; background-color: #f5f6f7;
		}
		
		#wrap{
			width: 600px; margin: 0 auto;
		}
		#container{
			margin: 0 auto;
		}
		
		#header{
			text-align: center; padding: 50px 0px -30px 0;
		
		}
		
		#head{
			margin: 0;  padding: 0;  position: relative; 
		}
		.headline{
			position: absolute;  font-weight: bolder;
			font-size: 50px; color: green;
		}
		#termbox_list{
			list-style: none;
		}
		input[type=checkbox] {
    		display:none;
		}
		input[type=checkbox] + label { 
		    cursor: pointer; 
		    padding-left: 30px; 
		    background-repeat: no-repeat;
		    background: url('../auth/check.png') no-repeat 0 1px / contain;
		}
		input[type=checkbox]:checked+label {
	 	   background: url('../auth/checkon.png') no-repeat 0 1px / contain;
		     background-size: 20px 20px;
		}
	
		li{
			padding-top: 30px; 
		}
		
		.termbox{
			overflow: auto; width:100%; height: 100px; border: 1px solid #dadada;
			background-color: white; 
		
		}
		.need{
			color: #08a600;
		}
		
		#agreeBtn{
			background-color: #03c75a; color: white; border: none; width: 48%; height: 50px;
			float: right; font-size: 24px;
		}
		#cancelBtn{
			 background-color: #8e8e8e; color: white; border: none;
			  width: 48%; height: 50px; float: left; margin-right: 5px; font-size: 24px;
		}
		#spanTestId{
		margin-left: 50px:
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
			var chkall = document.getElementById("all");
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
		<div id='wrap'>
		<div id='header'>
			<h1 id='head'> 
				<a href="../auth/login">
					<img style="width: 300px; height: 100px;"  src="../auth/naver.png">
					<span class='headline'></span>
				</a>
			</h1>
		</div>
			
			<div id='container'>
				<form>
				<ul id='termbox_list'>
					<li>
						<span>
							<input type="checkbox" id='all' onclick="chkFnc();">
							<label for="all" style="font-weight: bolder;
							 text-decoration: underline; padding-left: 25px;">
								NAVER한국어네이버 회원가입네이버 이용약관, 개인정보 수집 및 이용, 
								위치기반서비스 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.
							</label>
						</span>
					</li>
					<li>	
						<span>
							<input type="checkbox" id="must1" name="chk" class="must_chk">
							<label for='must1' style="color: black; font-weight: bolder;">
							네이버 이용약관 동의
								<span class="need">
									(필수)
								</span>
							</label>
						</span>
						<div class='termbox' >
							<h3>여러분을 환영합니다.</h3>
							<p>
							네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
							 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를
						 	 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버
						 	  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러
						    여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						    </p>
						</div>
					</li>
					<li>	
						<span>
							<input type="checkbox" id="must2" name="chk" class="must_chk">
							<label for="must2" style="font-weight: bolder;">
							개인정보 수집 및 이용 동의	
								<span class="need">
								(필수)
								</span>
							</label>
						</span>
						<div class='termbox'>
							<p>
							개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목,
							 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부
							  시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
							  1. 수집하는 개인정보이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의
							   네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페,
							    블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 
							    네이버는서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다
							</p>
						</div>
					</li>
					<li>	
						<span>
							<input id='choiceOne' class="chkBox" type="checkbox"  name="chk">
							<label for='choiceOne' style="font-weight: bolder;">
							위치기반서비스 이용약관 동의
								<span style="font-weight: normal; color: gray;">
								(선택)
								</span>
							</label>
						</span>
						<div class='termbox'>
							<p>
							위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버
							 위치기반 서비스를 이용할 수 있습니다.제 1 조 (목적)이 약관은 네이버 주식회사
							  (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리,
							   의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.제 2 조 (약관 외
							   준칙)이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보
							   보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 
							   전기통신사업법
							    등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의
							    합니다.
							</p>
						</div>
					</li>
					<li>	
						<span>
							<input id='choiceTwo' class="chkBox" type="checkbox"  name="chk">
							<label for="choiceTwo" style="font-weight: bolder;">
							프로모션 정보 수신 동의
								<span style="font-weight: normal; color: gray;">
								(선택)
								</span>
							</label>
						</span>
						<div>
							<span>
							네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자),
							 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 
							 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를
							  받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
							</span>
						</div>
					</li>		
						<p id='chk_plz' style="color: red;"></p>
						<div>
							<span>	
								<input id='cancelBtn' type="button" value="취소" 
								onclick="location.href='../auth/login'">
							</span>
							<span>
								<input id='agreeBtn' type="button"  value="확인" 
								onclick="testFnc();">
							</span>
						</div>
					</ul>	
				</form>
			</div>
		</div>
	</body>
</html>