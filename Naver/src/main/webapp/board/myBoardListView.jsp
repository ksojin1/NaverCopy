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
	
	.btn{
		text-decoration: none;
		background: linear-gradient(to top, #44bd32, #b8e994);
		color: #0c2461;
		border-radius: 5px;
		padding: 5px;
		text-align: center;
		font-weight: bold;
	}
	
	#boardTitle{
		width: 90%;
		border-bottom: 1px solid black;
		padding-bottom: 8px;
		margin: 50px auto;
	}
	
	#titleDiv{
		position: relative;
	}
	
	#userDiv{
		position: absolute;
		top: 0px;
		right: 90px;
	}
	
	#listTableDiv{
		width: 90%;
		margin: 50px auto;
		position: relative;
	}
	
	#loginBtn{
		margin-left: 10px;
	}
	
	#addBtn{
		position: absolute;
		width: 60px;
		bottom: -80px;
	}
	
	table {
		margin: 0px auto;
		border-collapse: collapse;
		width: 100%;
		text-align: center;
	}

	#tableHeader{
		background: linear-gradient(to top, #44bd32, #b8e994);
		color: #0c2461;
		font-weight: bold;
	}
	
	tr{
		border-bottom: 1px solid #079992;
	}
	
	td{
		height: 35px;
	}
	
	
</style>

</head>
<body>	
	<div id='container'>
		<div id='titleDiv'>
			<h2 id='boardTitle'>내 게시글 목록</h2>
			<div id='userDiv'>
				<span id='userId'>${memberDto.getId()}</span>
				<a class='btn' id='listViewBtn' href='./list?num=0'>전체목록보기</a>
				<a class='btn' id='loginBtn' href='../auth/logout'>로그아웃</a>
			</div>
		</div>
		
		<div id='listTableDiv'>
			<table>
				<tr id='tableHeader'>
					<th width="80px">No</th><th>제목</th>
					<th width="200px">날짜</th><th width="150px">등록자</th>
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
			
			<div id='pageNav'>
			<% 
				int maxList = (int)request.getAttribute("maxNum");
				for(int j=1, i=0; i<maxList; i++){
					if(i%10 == 0){%>
						<a href='./myList?id=${memberDto.getId()}&num=<%=i%>'><%=j%></a>
						<%j++;
					}
				}
			%>
			</div>
			
			<a class='btn' id='addBtn' href='./add'>추가</a>
		</div>
	</div>
</body>
</html>