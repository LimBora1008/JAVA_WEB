<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 본 어플리케이션의 컨텍스트 경로를 갖고와서 변수에 저장 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty memberList }">
			회원이 존재하지 않습니다
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr> <!-- 테이블의 열(가로) -->
					<th>순번</th> <!-- 테이블의 헤드(굵은글씨) -->
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
				</tr>
				<c:forEach var="member" items="${memberList}" varStatus="idx">
					<tr>
						<td>${idx.count}</td> <!-- 테이블 데이터 -->
						<td><a href="${contextPath}/view?id=${member.id}"> ${member.id} </a></td>
						<td>${member.pwd}</td>
						<td>${member.name}</td>
						<td>${member.email}</td>
					</tr>
				</c:forEach>
				
			</table>
			<br>
			<a href="${pageContext.request.contextPath}/memberInsertForm.jsp">추가</a>				
		</c:otherwise>
	</c:choose>
</body>
</html>