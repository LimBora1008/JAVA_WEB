<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.javalab.util.*" %>
<%
	// request 영역에 price 이름으로 숫자 저장
	request.setAttribute("price", 123456L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 함수 호출하기</title>
</head>
<body>

<h2>EL에서 함수 호출하기</h2>

<!-- 아래의 price는 request 영역에서 찾음 -->
1. 가격은 : ${ FormatUtil.number(requestScope.price,'#,##0') }
<br>

<!-- 아래의 price는 변수 page > request > session > application 영역에서 순차적으로 찾음 -->
2. 가격은 : ${ FormatUtil.number(price,'#,##0') }
</body>
</html>