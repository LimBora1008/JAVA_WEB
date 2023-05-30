<!-- 환경정보 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!--  charset=UTF-8 : 2바이트씩 인코딩 -->
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 라이브러리 import</title>
</head>
<body>
	<!-- 페이지 설정 부분에서 자바의 Date 클래스 import해서 사용하는 쪽에서는 단순하게 클래스 이름으로 객체 생성 -->
	지금 : <%=new Date()%>
	<br> <br>
	<b>표현식 &lt%= 자바 코드에서 계산된 값 %&gt</b>
	<br>
	자바 코드 부분에서 계산된 값을 HTML 페이지 표시
</body>
</html>