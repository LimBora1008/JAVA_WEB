<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.javalab.el.User" %>

<%
// 한글이 깨지지 않도록 post 요청으로 메시지 바디 부분 인코딩
request.setCharacterEncoding("utf-8");
%>

<!-- useBean 액션 태그로 User객체를 생성해서 request영역에 저장함 -->
<jsp:useBean id="user" scope="request" class="com.javalab.el.User" />

<!-- 화면에서 입력받은 값이 위에서 생성한 user 객체에 자동 바인딩됨 -->
<jsp:setProperty property="*" name="user"/>

<%
// 추가적으로 User 객체 생성
User user2 = new User();
user2.setId("dream");
user2.setPassword("5678");
user2.setName("Hone");
user2.setEmail("bb@b.com");

// newUser라는 이름으로 request 영역에 저장
request.setAttribute("newUser", user2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- forward 방식은 서버 내부에서 이동이므로 현재 페이지에서 저장한 request값이 다음 페이지로 전달됨 -->
	<jsp:forward page="showUserInfo.jsp" />

</body>
</html>