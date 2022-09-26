<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 작성</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action='./add' method='post'>
		작성자	<input type="text" name='mid'><br>
		제목		<input type="text" name='title'><br>
		내용		<input type="text" name='content'><br>
		<input type='submit' value='저장'>
		<input type='button' value='취소' 
			onclick="location.href='/board/list'">
	</form>
</body>
</html>