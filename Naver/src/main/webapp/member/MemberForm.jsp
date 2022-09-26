<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
		
		</style>
		
		<script type="text/javascript">
		
		function testFnc() {
			var must1 = document.getElementById("must1");
			var must2 = document.getElementById("must2");
				
		
				if(must1.checked == false) {
					alert("no");
				}else if (must2.checked == false) {
					alert("no2");
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
		<div>
			<form >
				<input type="checkbox" id='All' onclick="chkFnc();"><br>
				<input type="checkbox" id="must1" name="chk"><br>
				<input type="checkbox" id="must2" name="chk"><br>
				<input type="checkbox"  name="chk"><br>
				<input type="checkbox"  name="chk">
				<input type="button" value="취소" onclick="location.href='./login'">
				<input type="button" value="확인" onclick="testFnc();">
			</form>
		</div>
	
	</body>
</html>