<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.javalab.el.*" %>
<%
// request.getAttribute : object 타입으로 나오기 때문에 형변환 해야함
Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL로 객체 핸들링</title>
</head>
<body>

	<h2>EL로 객체 핸들링(전달된 객체에 직접 접근)</h2>
	1. 이름(EL방식 - 메소드로 접근) : ${ member.getName() }
	<br>
	2. 이름(EL방식 - 범위 미지정) : ${ member.name }
	<br>
	3. 이름(EL방식 - 범위 지정 ) : ${ requestScope.member.getName() }
	<!-- 객체 탐색 범위 : pageScope > requestScope > sessionScope > applicationScope -->

	<br>
	
	<h2>기존 방식</h2>
	1. 이름(기존방식) <%= member.getName() %>
	<br>
	2. 나이(기존방식) <%= member.getAge() %>
	<br>
	3. 객체의 멤버 변수에 직접 접근 불가(member2.age)
	<%-- 나이(기존방식) <%= member2.age %> --%>

</body>
</html>