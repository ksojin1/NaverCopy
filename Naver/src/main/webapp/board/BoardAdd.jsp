<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
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
	
	#addTitle{
		text-align: center;
	}
	
	#addForm{
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
	.btn {
		border: 0;
		outline: 0;
		text-decoration: none;
		background: linear-gradient(to top, #44bd32, #b8e994);
		color: #0c2461;
		border-radius: 5px;
		padding: 8px;
		text-align: center;
		font-weight: bold;
		width: 80px;
	}

	#btnDiv{
		display: flex;
		justify-content: center;
		margin-top: 250px;
	}
	
	.btn:nth-child(1){margin-right: 15px;}
	.btn:nth-child(2){margin-left: 15px;}
	
	#idInput, #titleInput{
		width: 84%;
		height: 30px;
	}
	
	input, textarea {
		font-size: 20px;
	}
}
</style>
</head>
<body>
	<div id='container'>
		<h1 id='addTitle'>글쓰기</h1>
		<form id='addForm' action='./add'
			method='post'>

			<h2 id='userId'>작성자</h2>
			<input id='idInput' type="text" name='mid' readonly
				value="${memberDto.getId()}"><br>

			<h2 id='title'>제목</h2>
			<input id='titleInput' type="text" name='title'><br>

			<div id='contentDiv'>
				<h2>내용</h2>
				<textarea id='content' name='content'></textarea>
			</div>

			<div id='btnDiv'>
				<input class='btn' type='submit' value='저장'>
				<input class='btn' type='button' value='취소'
					onclick="location.href='./list';">
			</div>
		</form>
	</div>
</body>
</html>