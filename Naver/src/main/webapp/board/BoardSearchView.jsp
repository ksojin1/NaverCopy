<%@page import="spms.dao.BoardDao"%>
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
		bottom: 0px;
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
	
	#listTable tr{
		border-bottom: 1px solid #079992;
	}
	
	#listTable td{
		height: 35px;
	}
	
	#searchDiv{
		width: 90%;
		margin: 0 auto;
		position: relative;
	}
	
	#searchTable{
		width: 30%;
		text-align: center;
		position: absolute;
		top:-45px;
		right: 0;
	}
	
	#search{
		width: 90%;
		height: 30px;
	}
	#searchText{
		width: 90%;
		height: 25px;
	}
	#searchBtn{
		width: 100%;
		height: 30px;
		border: none;
		outline: none;
	}
	
	#pageNav{
		width: 90%;
		margin: 0 auto;
		margin-top : 30px;
		display: flex;
		justify-content: center;
	}
	
	.page {
		margin-right: 20px;
	}
	
	#listBtn{
		position: absolute;
		right: 0;
		bottom: 0;
	}
	
</style>

<script type="text/javascript">
</script>

</head>
<body>	
	<div id='container'>
		<div id='titleDiv'>
			<h2 id='boardTitle'>게시판 목록</h2>
			<div id='userDiv'>
				<span id='userId'>${memberDto.getId()}</span>
				<a class='btn' id='myListViewBtn' href='./myList?id=${memberDto.getId()}&num=0'>내게시글</a>
				<a class='btn' id='loginBtn' href='../auth/logout'>로그아웃</a>
			</div>
		</div>

		<div id='searchDiv'>	
			<form action="./search?num=0" name='search' method='get'>
				<table id='searchTable'>
					<tr>
						<td><select name='search' id='search'>
							<option value='TITLE'>제목</option>
							<option value='CONTENT'>내용</option>
							<option value='MID'>작성자</option>
						</select></td>
						<td><input type='text' id='searchText'
							placeholder="검색어 입력" name="searchText"
							maxlength="100">
							<input type="hidden" name="num" value='0'>
						</td>
						<td><input class='btn' id='searchBtn' type="submit" value='검색' ></td>
					</tr>
				</table>
			</form>
		</div>

		<div id='listTableDiv'>
			<table id='listTable'>
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
						<a class='page' href='./search?search=${search}
							&searchText=${searchText}&num=<%=i%>'><%=j%></a>
						<%j++;
					}
				}
			%>
			</div>
			
			<a class='btn' id='addBtn' href='./add'>추가</a>
			
			<a class='btn' id='listBtn' href='./list?num=0'>전체 목록 보기</a>
		</div>
		
	</div>
</body>
</html>