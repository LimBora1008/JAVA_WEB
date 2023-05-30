<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
	<h1 style="text-align: center;">환영합니다.</h1>
	
	<b>${sessionScope.member.id}</b>님이 로그인 하셨습니다
	<br>
		
	<a href="${pageContext.request.contextPath}/sessionLogout"><b>로그아웃</b></a>
</body>
</html>