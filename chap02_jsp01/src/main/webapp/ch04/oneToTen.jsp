<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-10까지의 합</title>
</head>
<body>

	<b>스크립트릿 &it% 자바코드 %&gt</b>
	<br>
	<br>
	<%
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum = sum + i;
	}
	%>
	1 부터 10까지의 합은 <%= sum %> 입니다

</body>
</html>