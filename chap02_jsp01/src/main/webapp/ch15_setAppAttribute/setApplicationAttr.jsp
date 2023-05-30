<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	
	if(name != null && value != null){
	    // application 객체에 저장할 값 세팅
	    // 세팅된 값은 해당 웹어플리케이션 어디서라도 꺼내 쓸수 있다.
		application.setAttribute(name, value);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>application 속성 지정</title>
</head>
<body>
 <h2>application 객체에 웹어플리케이션 전역에서 사용할 변수 세팅</h2>

<%
	if(name != null && value != null){
%>
application 기본 객체의 속성 설정 :
<%= name %> = <%= value %>
<%
	}else{
%>
application 기본 객체의 속성 설정 안 함
<%
	}
%>
</body>
</html>