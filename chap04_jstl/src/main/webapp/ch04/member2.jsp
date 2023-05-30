<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("utf-8");
%>

<!-- html 주석 -->
<%-- jsp주석 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력 창</title>
</head>
<body>

	<!-- [방법 1] c:if test= 사용 -->
	<c:if test="${not empty sessionScope.userList}"> <!-- empty : 비어있는  / not empty : 비어있지 않다 -->
		<h3>회원이 존재합니다.</h3>
	</c:if>

	<c:if test="${empty sessionScope.userList}">
		<h3>회원이 존재하지 않습니다.</h3>
	</c:if>

	<!-- [방법 2] c:choose when 사용 -->
	<%-- [jsp 주석]
		c:choose c:when test 구문에서는 Html 주석 <!-- -->을 사용하지 말고
		<%-- 로 시작하는 jsp 주석을 사용할것. 
	--%>
	<c:choose>
		<%-- userList가 null인지 체크 --%>
		<c:when test="${not empty sessionScope.userList}">

			<table>

				<tr align="center" bgcolor="lightgreen">
					<td><b>순번</b></td>
					<td><b>아이디</b></td>
					<td><b>비밀번호</b></td>
					<td><b>이름</b></td>
					<td><b>이메일</b></td>
				</tr>

				<%-- [c:foreach] 객체/컬렉션 반복, 저장된 회원수 만큼 반복
				items : 이전 화면에서 전달해준 컬렉션 객체
				var : ArrayList에서 꺼내온 객체 하나를 담는 임시 변수 --%>
				<c:forEach var="user" items="${sessionScope.userList}" varStatus="idx"> <%-- varStatus : 변수의 상태 / idx : 순번을 가지고온다 / idx.count : 1부터 ~ / index. --%>
					<tr>
						<td>${idx.count}</td>
						<td>${user.id}</td>
						<td>${user.password}</td>
						<td>${user.name}</td>
						<td>${user.email}</td>
					</tr>
				</c:forEach>

			</table>

		</c:when>

		<c:otherwise>
			<p>회원 데이터가 존재하지않습니다</p>
		</c:otherwise>
	</c:choose>
</body>
</html>