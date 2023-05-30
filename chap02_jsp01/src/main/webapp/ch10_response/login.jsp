<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response 기본 객체 활용</title>
</head>
<body>

	<h1>response 기본 객체를 통해 사용자에게 새로운 요청 강제하기</h1>

	<%
	// 본 페이지를 요청하면서 다음과 같이 주소창에 입력한다.
	// http://localhost:8080/chap02_jsp01/ch10_response/login.jsp? memberId=bingo
	// memberId=bingo 이면 index.jsp페이지로 이동하고 아니면 "잘못된 아이디입니다."
	String id = request.getParameter("memberId");

	if (id != null && id.equals("bingo")) {
		// response 기본 객체의 sendRedirect()메소드로 사용자의 브라우저에 다른 jsp페이지로 강제 이동시킴
		response.sendRedirect("index.jsp");
	}else{
	%>

	<h3>잘못된 아이디입니다.</h3>

</body>
</html>
<%
}
%>