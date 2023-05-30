<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalab.util.Cookies" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>

<!-- getContextPath : 프로젝트 path만 얻어온다. -->
<form action="<%= request.getContextPath() %>/ch07_cookie/member/login.jsp" method="post">

아이디 <input type="text" name="id" size="10">
암호 <input type="password" name="password" size="10">

<input type="submit" value="로그인">
</form>

</body>
</html>