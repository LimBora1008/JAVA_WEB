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

	<h2>c:if 예제 : 단점은 if else가 안되고 단순하게 if만 가능</h2>

	<c:set var="score" value="69" />

	<c:if test="${score >= 90 }">
		<p>A 학점</p>
	</c:if>

	<c:if test="${score >= 80 && score < 90 }">
		<p>B 학점</p>
	</c:if>

	<c:if test="${score >= 70 && score < 80 }">
		<p>C 학점</p>
	</c:if>

	<c:if test="${score < 70 }">
		<p>공부좀 해!</p>
	</c:if>
	
</body>
</html>