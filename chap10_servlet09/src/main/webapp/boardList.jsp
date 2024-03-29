<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 본 어플리케이션의 컨텍스트 경로를 갖고와서 변수에 저장해놓고 아래서 사용한다 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판 목록</title>

<style type="text/css">
* {
	font-size: 9pt;
}

p {
	width: 600px;
	text-align: right;
}

table thead tr th {
	background-color: gray;
}
</style>

</head>
<body>
	<h3>게시판 목록 화면</h3>
	<hr>
	<table border="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="70" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${boardList.size() == 0}">
					<tr>
						<td align="center" colspan="4">등록된 게시물이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boardList}" varStatus="i">
						<tr>
							<td align="center"><c:out value="${i.count}" /></td>
							<td align="center">
							<a href="<c:url value='/boardView?no=${board.no}'/>"> 
							<c:out value="${board.subject }" />
							</a></td>

							<td align="center"><c:out value="${board.writer }" /></td>
							<td align="center"><c:out value="${board.hit }" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="4">
					Copyright &copy; javalab Corp. All Rights Reserved
				</td>
			</tr>
		</tfoot>
	</table>
	
	<p>
		<input type="button" value="글쓰기" onclick="location.href='${contextPath}/boardWrite'" />
	</p>	

</body>
</html>
