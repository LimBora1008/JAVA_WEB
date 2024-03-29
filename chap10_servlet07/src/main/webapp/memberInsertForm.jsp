<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 본 어플리케이션의 컨텍스트 경로룰 갖고와서 변수에 저장하고 아래서 사용 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 화면</title>
</head>
<body>
	<form action="${contextPath }/insert" method="post">
		
		<table>
			<tr>
				<th>회원 추가</th>
			</tr>
			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required"> </td> <!-- required : 필수 -->
			</tr>				
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" required="required"> </td>
			</tr>			
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"> </td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"> </td>
			</tr>
						
		</table>
		
		<input type="submit" value="저장하기">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>