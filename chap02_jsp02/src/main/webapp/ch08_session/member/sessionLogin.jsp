<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

// 세션에 로그인 사용자의 아이디를 저장함
if (id.equals(password)) {
	session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>

로그인에 성공하였습니다.

</body>
</html>

<%
} else { // 아이디 패스워드가 같지 않으면 로그인 실패
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script>
<%
}
%>