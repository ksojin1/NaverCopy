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
	
	.btn{
		text-decoration: none;
		background-color: #AAEBAA;
		color: #006400;
		border-radius: 5px;
		padding: 3px;
		width: 80px;
	}
	
	#loginBtn{
		text-align: center;
		
	}
	
	#container{
		border: 1px solid black;
		width: 90%;
		height: 900px;
		margin-top: 20px;
		display: flex;
		flex-direction: column;
	}
	
	#tableHeader{
		background-color: #AAEBAA;
		color: #006400;
	}
	
	#boardTitle{
		width: 90%;
		border-bottom: 1px solid black;
	}
	table {
		border-collapse: collapse;
		width: 90%;
		padding: 0 auto; 
	}
	
</style>

</head>
<body>	
	<div id='container'>
	
		<h4 id='boardTitle'>게시판 목록</h4>
		<a class='btn' id='loginBtn' href='#'>로그아웃</a>
		<a class='btn' id='addBtn' href='./add'>추가</a>
		<br>
		<table>
			<tr id='tableHeader'>
				<td>No</td><td>제목</td><td>날짜</td><td>아이디</td>
			</tr>
			<c:forEach var="boardDto" items="${boardList}">
				<tr>
					<td>${boardDto.getNo()}</td>
					<td><a href='./detail?no=${boardDto.getNo()}'>${boardDto.getTitle()}</a></td>
					<td>${boardDto.getCreateDate()}</td>
					<td>${boardDto.getUserId()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>