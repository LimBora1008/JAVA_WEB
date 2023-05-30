<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="java.util.*"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포매팅 태그 라이브러리 예제</title>
</head>
<body>
	<h2>fmt의 number 태그를 이용한 숫자 포맷팅 예제.</h2>
	<c:set var="price" value="100000000" />
	
	<!-- type = currency/number/percent -->
	<fmt:formatNumber type="currency" var="priceNumber" value="${price}" />
	
	1. 천단위 통화로 표현 : ${priceNumber}
	
	<h2>formatDate 예제</h2>
	<c:set var="now" value="<%=new Date() %>"/>
	<fmt:formatDate value="${now}" var="dateFormat" pattern="YYYY-MM-dd : hh:mm:ss"/>
	
	2. 날짜 ${dateFormat}
	<br>
</body>
</html>