<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Form</title>
</head>
<body>
	<form action="memberInsert.jsp" method="post">
	
	<label for="id">id:</label>
	<input type="text" name="id" id="id"><br>
	
	<label for="password">password:</label>
	<input type="password" name="password"" id="password"><br>
	
	<label for="name">name:</label>
	<input type="text" name="name"" id="name"><br>
	
	<label for="email">email:</label>
	<input type="email" name="email"" id="email"><br>
	
	<input type="submit" value="Submit">
	</form>

</body>
</html>