<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 상단 파비콘 삽입 -->
<link rel="shortcut icon" href="images/EZEN.ico">
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet" type="text/css" href="./css/mainPage.css" />
<link rel="stylesheet" type="text/css" href="./css/movieInfo.css" />
<title>나의 영화관 사이트</title>

</head>
<body>
	<div id="header1">
		<a href="${pageContext.request.contextPath}/main"> <img
			src="images/cinema_width.png">
		</a>
	</div>
	<div id="login-tools">


		<c:if test="${not empty sessionScope.member.id}">
			<strong>${sessionScope.member.name}${sessionScope.member.id}님</strong>
			<a href="${pageContext.request.contextPath}/logout"><strong>로그아웃</strong></a>
		</c:if>
		<c:if test="${empty sessionScope.member.id}">
			<a href="${pageContext.request.contextPath}/login"><strong>로그인</strong></a>
			<a href="memberInsertForm.jsp"><strong>회원가입</strong></a>
		</c:if>
	</div>
	<div>
		<form class="d-flex" role="search">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" style="height: 26px;">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>

	<div id="content">
		<div id="header">
			<h1>
				<!-- 		상단메뉴 네비게이션바 -->
				<nav class="sitemenu">
					<a href="영화페이지주소"><img src="images/menu.w.png" alt="메뉴열기"></a>
					<a href="영화페이지주소">영화</a> <a href="예매페이지주소">예매</a> <a
						href="관람평페이지주소">관람평</a> <a href="${contextPath}/mypage">마이페이지</a>
				</nav>
			</h1>
		</div>
	</div>