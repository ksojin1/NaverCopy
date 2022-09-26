<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 작성</title>
</head>
<body>
	<h1>글쓰기(수정)</h1>
	<form action='./update' method='post'>
		작성자	<input type="text" name='userId' value="${boardDto.userId}"><br>
		제목		<input type="text" name='title' value="${boardDto.title}"><br>
		내용		<input type="text" name='content' value="${boardDto.content}"><br>
		<input type='submit' value='저장'>
		<input type='button' value='취소' onclick="location.href='/board/list';">
		<input type='button' value='삭제' onclick="location.href='./delete?no=${boardDto.getNo()}';">
	</form>
</body>
</html>