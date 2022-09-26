<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
</head>
<body>	
	<h1>게시판 목록</h1>
	<a href='./add'>추가</a>
	
	<c:forEach var="boardDto" items="${boardList}">
		${boardDto.getNo()}
		<a href='./update?no=${boardDto.getNo()}'>${boardDto.getTitle()}</a>,
		${boardDto.getUserId()},
		${boardDto.getCreateDate()}
	</c:forEach> 
	
</body>
</html>