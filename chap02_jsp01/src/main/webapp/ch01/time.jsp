<!-- 환경정보 -->
<!--  charset=UTF-8 : 2바이트씩 인코딩 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>
	<!-- 자바의 Date 클래스를 풀경로로 사용(불편) -->
	지금 : <%=new java.util.Date()%>
</body>
</html>