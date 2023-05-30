<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalab.vo.MemberVo"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
	<h2 style="text-align: center;">로그인 사용자</h2>
	1. ${sessionScope.member.id}님 세션에 이미 정보가 있습니다
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/sessionLogin">로그아웃</a>
</body>
</html>