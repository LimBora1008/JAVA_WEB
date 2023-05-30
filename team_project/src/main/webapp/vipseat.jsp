<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 상단 파비콘  -->
<link rel="shortcut icon" href="images/icon_EZEN.ico">

<title>EZEN CINEMA</title>

<style>
/* CSS 스타일링 */
hr{
	width: 90%;
}

body {
   font-family: Arial, sans-serif;
   padding: 0;
   width: 1500px;
   margin:auto
}

#header1 {
	color: #fff;
	padding: 10px;
	text-align: center;
	width: 100%
}

#header {
 padding: 10px;
 text-align: center;
 width: 100%;
 background: #0a854b;
}

#header h1 {
 display: inline-block;
 vertical-align: middle;
 margin: 0;
 padding: 0;
 font-size: 24px;
 word-spacing: 100px; /*글자 단어 사이 간격 조정*/
}

#header a {
 text-decoration: none;
 color: #fff;
 margin-right: 10px;
 letter-spacing: 2px; /* 글자 간격 조정 */
}
header nav{
 text-align: cneter;
 width: 100%;
}

#content {
	padding: 20px;
}

#content post {
	padding: 20px;
	background-color: #333;
}

.movie-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin-bottom: 20px;
	margin-left: 50px;
	margin-right: 50px;
}

.movie {
	width: calc(33.33% - 10px);
	margin-bottom: 20px;
}

.movie img {
	width: 100%;
	height: auto;
	object-fit: cover;
	border-radius: 10px; /* 원하는 둥근 모서리 크기로 조정 */
}

.movie h3 {
	margin-top: 10px;
	font-size: 16px;
	font-weight: bold;
}

.movie p {
	margin-top: 5px;
	font-size: 14px;
}

/*예매하기 버튼*/
.movie .booking-button {
	display: block;
	width: 150px;
	padding: 5px 10px;
	text-align: center;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	margin-top: 10px;
	border-radius: 5px; /* 원하는 둥근 모서리 크기로 조정 */
	
}

/* 로그인 툴 */
#login-tools {
	text-align: right;
	padding-right:200px;
}

#login-tools a {
	text-decoration: none;
	color: black;
	margin-left: 10px;
	text-align: right;
}

#login-tools a:first-child {
	margin-left: 0;
}

/* 화면 크기에 따른 스타일 조정 */
@media ( max-width : 768px) {
	.container {
		padding: 10px;
	}
}

@media ( max-width : 480px) {
	.container {
		padding: 5px;
	}
}

.d-flex {
	text-align: left;
	padding-left: 150px;
	height: 20pt;
}

.uptop {
	text-align: right;
	text-decoration-line: none;
	color: black;
	height: 50px;
	width: 50px;
}

/*메뉴바*/
.menu {
	width: 100%;
	text-align: center;
	align-content: center;
	overflow: hidden;
	padding-left: 80px;
	height: 20%;
	text-decoration: none;
}

.menu>li {
	width: 20%; /*20*5=100%*/
	float: left;
	text-align: center;
	line-height: 40px;
	background-color: #0a854b;
	text-decoration: none;
	padding: 10px;
}

.menu a {
	color: #fff;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
}

.submenu>li {
	line-height: 50px;
	background-color: #23cd7d;
	text-decoration: none;
}

.submenu {
	height: 0; /*ul의 높이를 안보이게 처리*/
	overflow: hidden;
	text-decoration: none;
}
/* .menu li 에 마우스 올렸을때 색상 변환*/
.menu>li:hover {
	background-color: #23cd7d;
	transition-duration: 0.5s;
}

.menu>li:hover .submenu {
	height: 250px; /*서브메뉴 li한개의 높이 50*5*/
	transition-duration: 1s;
}

.moving{
	display: block;
	width: 150px;
	padding: 5px 10px;
	text-align: center;
	background-color: #0a854b;
	color: #fff;
	text-decoration: none;
	margin-top: 10px;
	margin-left: 650px;
	border-radius: 5px; /* 원하는 둥근 모서리 크기로 조정 */
}

</style>

</head>
<body style="margin:auto; overflow:scroll; width: 1000px;">
	<div id="header1">
		<a href="${contextPath}/mainPage.jsp">
			<img alt="로고" src="${contextPath}/images/cinema_width.png">
			</a>
	</div>
	<div id="login-tools">
		<!-- 로그인 도구를 추가하세요 -->
		<!-- 		<a href="login">로그인</a> <a href="insertMember">회원가입</a> -->
		<div style="text-align: right;">
			<c:if test="${not empty sessionScope.member.id}">
				<strong>${sessionScope.member.name}${sessionScope.member.id}
					님 환영합니다</strong>
				<a href="${pageContext.request.contextPath}/logout"><strong>로그아웃</strong></a>
			</c:if>
			<c:if test="${empty sessionScope.member.id}">
				<a href="${pageContext.request.contextPath}/login"><strong>로그인</strong></a>
				<a href="${pageContext.request.contextPath}/insertMember"><strong>회원가입</strong></a>
			</c:if>
		</div>
	</div>

	<div id="content">
	         <div id="header">
	            <h1>
	               <!--       상단메뉴 네비게이션바 -->
	               <nav class="sitemenu">
                     <a href="${contextPath}/movieList">영화</a> 
                     <a href="${contextPath}/errorPage.jsp">예매</a> 
                     <a href="${contextPath}/errorPage.jsp">상세보기</a> 
                     <a href="${contextPath}/mypage">마이페이지</a>
	               </nav>
	            </h1>
	         </div>
      	</div>


	<div id="content" style="text-align: center;">
		<h2>EZEN CINEMA VIP</h2>
		<br> 
		<hr>
		<br>
	</div>



	<!-- 		영화포스터 -->
	<div id="content post">
		<div class="movie-container">
			<div class="movie">
			<img src="${contextPath}/images/vip/확장스크린.jpg">
			</div>
			<div class="movie">
				<img src="${contextPath}/images/vip/4dx.jpg">
			</div>
			<div class="movie">
				<img src="${contextPath}/images/vip/초대형 스크린.jpg">
			</div>
			<div class="movie">
				<img src="${contextPath}/images/vip/3d입체음향.jpg">
			</div>
			<div class="movie">
				<img src="${contextPath}/images/vip/imax상영관.jpg">
			</div>
			<div class="movie">
				<img src="${contextPath}/images/vip/4dx screen.jpg">	
			</div>
		</div>
</body>
</html>
