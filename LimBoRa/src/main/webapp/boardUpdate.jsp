<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세</title>

<style>
body {
	margin: 0 auto;
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: center;
}

td {
	text-align: center;
	padding: 10px;
}
</style>
</head>
<body>
	<h1>게시물 상세</h1>
	<form action="boardUpdate" method="post">
		<input type="hidden" name="bno" value="${board.bno}"> <label
			for="title">제목:</label> <input type="text" id="title" name="title"
			value="${board.title}"><br> <label for="content">내용:</label><br>
		<textarea id="content" name="content" rows="5">${board.content}</textarea>
		<br> <input type="submit" value="수정">
	</form>
</body>
</html>
