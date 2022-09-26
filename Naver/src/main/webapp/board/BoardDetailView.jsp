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
</style>

</head>
<body>	
	<h1>게시판 상세</h1>
	<form action='./update?no=${boardDto.getNo()}' method='get'>
		작성자	<input type="text" name='userId' value="${boardDto.userId}"><br>
		제목		<input type="text" name='title' value="${boardDto.title}"><br>
		내용		<input type="text" name='content' value="${boardDto.content}"><br>
		<input type='button' value='뒤로' onclick="location.href='./list';">
		
			<!-- 로그인 세션 완료 되면 수정 -->
			<a href='./update?no=${boardDto.getNo()}'>수정</a>
<%-- 		<c:if test='${mid == boardDto.userId}'> --%>
<!-- 			<input type='submit' value='수정'> -->
<%-- 		</c:if> --%>
	</form>
</body>
</html>