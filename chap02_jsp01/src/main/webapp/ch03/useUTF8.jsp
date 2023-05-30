<!-- 환경정보 -->

<%@ page contentType="text/html; charset=utf-8"%><!--  charset=UTF-8 : 2바이트씩 인코딩 -->
<%@ page import="java.util.Date"%>

<% // 스크립트릿 태그 : 자바 코드를 여러개 쓸 수 있다
Date now = new Date();
%>

<html>
<head>
<title>현재 시간</title>
</head>
<body>
	현재 시각은 다음과 같다. :
	<%= now %> <!-- 표현 태그 -->
</body>
</html>