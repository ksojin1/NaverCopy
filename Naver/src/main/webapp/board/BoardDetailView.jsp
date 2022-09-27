<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">

	body{
		display: flex;
		justify-content: center;
	}
	
	#container{
		width: 90%;
		height: 900px;
		margin-top: 20px;
	}
	
	#detailTitle{
		text-align: center;
	}
	
	#mainDiv{
		padding: 50px;
	}
	
	h2{
		display: inline-block;
		width: 80px;
	}
	
	#contentDiv{
		position: relative;
	}
	
	#contentDiv > h2 {
		margin-top: 200px;
	}
	
	#content{
		display: inline-block;
		width: 85%;
		height: 450px;
		position: absolute;
		top: 20px;
		resize: none;
		font-size: 20px;
	}
	
	#content:focus {
		outline: none;
	}
	
	a{
		text-decoration: none;
		background: linear-gradient(to top, #44bd32, #b8e994);
		color: #0c2461;
		border-radius: 5px;
		padding: 8px;
		text-align: center;
		font-weight: bold;
	}
	
	#btnDiv{
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 225px;
	}
	
	#backBtn{
		margin-bottom: 25px;
	}
}

</style>

</head>
<body>	
	<div id='container'>
		<h1 id='detailTitle'>게시판 상세</h1>
		<div id='mainDiv'>
			<h2 id='userId'>작성자</h2><span>${boardDto.userId}</span><br>
			<h2 id='title'>제목</h2><span>${boardDto.title}</span><br>
			
			<div id='contentDiv'>
				<h2>내용</h2>
				<textarea id='content' readonly>${boardDto.content}</textarea>
			</div>
			<br>
<!-- 			<textarea rows="40" cols="10">${boardDto.content}</textarea><br> -->
			
<%-- 			<h4 id='userId'>작성자</h4><span>${boardDto.userId}</span><br> --%>
<%-- 			<h4 id='title'>제목</h4><span>${boardDto.title}</span><br> --%>
<!-- 			<h4 id='content'>내용</h4> -->
<%-- 			<div id='contentDiv'>${boardDto.content}</div> --%>
			
			<div id='btnDiv'>
				<a id='backBtn' href='./list'>게시글 목록보기</a>
				
				
				<!-- 로그인 세션 완료 되면 수정 -->
				
	 		<c:if test='${memberDto.id == boardDto.userId}'>
	 			<a id='updateBtn' href='./update?no=${boardDto.getNo()}'>수정하기</a>
	 		</c:if>
			</div>
		</div>
	</div>
</body>
</html>