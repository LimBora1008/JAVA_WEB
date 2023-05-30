<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<%
//서버로 전달된 파라미터를 주어진 캐릭터셋으로 인코딩
request.setCharacterEncoding("utf-8"); // post타입 message body에 넘어오는 한글을 2바이트로 인코딩한다
%>

<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
	<h2>클라이언트에서 서버로 파라미터 전달하는 방법</h2>
	<br><br>

	<%
	String pName = request.getParameter("name");
	String pAddress = request.getParameter("address");
	System.out.println("pName : " + pName);
	%>

	<h2>1. 파라미터 한개씩 읽어오는 경우</h2>
	
	<b>request.getParameter() 메서드 사용</b><br> 
	name 파라미터 :<%=pName%><br> 
	address 파라미터 :<%=pAddress%><br>
	<br>

	<b>2. 체크박스 같은 여러개의 값을 읽어오는 경우 </b><br>

	<%
	String[] values = request.getParameterValues("pet");
	if (values != null) {
		for (int i = 0; i < values.length; i++) {
	%>

	<%=values[i]%> <!-- pet에 대한 출력 -->

	<%
	} // for
	} //if
	%>
	<br><br>

	<b>3. Map을 통해서 Key-Value 형태로 읽어오는 경우 </b><br>
	
	<b>request.getParameterMap() 메서드 사용</b><br>
	
	<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[]) parameterMap.get("name");
	if (nameParam != null) {
	%>
	
	name = <%=nameParam[0]%>
	
	<%
	} // if
	%>

</body>
</html>