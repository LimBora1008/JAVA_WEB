<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.javalab.vo.*"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	// 아이디 비밀번호 입력 체크 함수
	function fn_validate() {
		// 폼 객체의 주소값을 갖고오는데 최고 상위 객체인 document객체를 통해서 찾고옴
		var frmLogin = document.frmLogin; // body부분 form의 name = frmLogin
		var id = frmLogin.id.value; // id입력값
		var pwd = frmLogin.pwd.value; // pwd입력값
		// alert("id : "+id); // [디버깅]

		if (id.length == 0 || id == "") {
			alert("아이디를 입력하세요");
			frmLogin.id.focus(); // 아이디 입력칸으로 포커스가 옮겨짐
		} else if ((pwd.length == 0 || pwd == "")) {
			alert("비밀번호를 입력하세요");
			frmLogin.pwd.focus();
		} else {
			// Form태그의 method속성을 post로 수동으로 지정
			frmLogin.method = "post"; 
			// Form태그의 action속성을 수동으로 지정
			// 위에서 var="contextPath" 형태로 설정한 변수값
			frmLogin.action = "${contextPath}" + "/sessionLogin"; 
			frmLogin.submit();
		}
	}
</script>
<style>
#login_error {
	color: red;
	text-align: center;
}
</style>
</head>
<body>
	<form name="frmLogin" method="post" action="${contextPath}/cookieLogin">

		<h1 style="text-align: center;">로그인</h1>
		
		<table align="center" border="0">
			<tr>
				<td width="200"><p align="right">아이디</td>
				<td width="400"><input type="text" name="id"></td>
			</tr>

			<tr>
				<td width="200"><p align="right">비밀번호</td>
				<td width="400"><input type="password" name="pwd"></td>
			</tr>

			<c:if test="${not empty errorMsg}">
				<tr style="text-align: center;">
					<td colspan="2">
						<p id="login_error">${errorMsg}</p>
					</td>
				</tr>
			</c:if>

			<tr>
				<td width="200"><p>&nbsp;</p></td>
				<td width="400">
					<input type="button" onclick="fn_validate();" value="로그인">
					<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>

	</form>

</body>
</html>