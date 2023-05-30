<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="sum" value="0"></c:set>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i}" />
		<c:set var="sum" value="${sum+i}" />
		<br>
	</c:forEach>
	
	sum : ${sum}
</body>
</html>