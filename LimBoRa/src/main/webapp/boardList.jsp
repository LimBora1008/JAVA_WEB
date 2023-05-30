<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.limbora.bbs.vo.Board"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
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
	<h1>게시물 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<%
		List<Board> boardList = (List<Board>) request.getAttribute("boardList");

		for (Board board : boardList) {
		%>
		<tr>
			<td><%=board.getBno()%></td>
			<td><a href="boardUpdate?bno=<%=board.getBno()%>"><%=board.getTitle()%></a></td>
			<td><%=board.getRegdate()%></td>
			<td><%=board.getHitno()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<button onclick="location.href='boardInsert.jsp'">게시물 등록</button>
</body>
</html>
