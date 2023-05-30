<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	// 이벤트 핸들러 - json type 변환
	$("#changeBtn").click(function(e){
		// 다음 처리안하면 서버로 요청이 일어남
		//e.preventDefault();
		
		 let id = $('#id').val();   // id에 입력된 값
         let pwd = $('#pwd').val();   // pwd에 입력된 값
         
         // 입력값 디버깅
         console.log('id / pwd', id, pwd); 
         
         // 자바스크립트 객체 생성
         let obj = new Object();
         obj.id = id;
         obj.pwd = pwd;
         
         // [디버깅] 자바스크립트 객체 출력
         console.log('자바스크립트 객체임',obj);
         
         // JSON.stringify(obj) 스트링지 파이 함수
         // - 자바스크립트 객체를 JSON 타입 문자열로 변환
         var jsonData = JSON.stringify(obj);
         console.log('JSON 타입으로 변환된 문자열',jsonData);
         
         // body 부분의 result 출력
         $("#result").html(jsonData);
         
	});
)};
</script>
</head>
<body>
	<h4>
		1. 버튼을 클릭하면 자바스크립가 실행되고 <br> 2. body 부분에 입력값을 조회해서<br> 3. 다시
		body부분에 출력하는 예제
	</h4>

	<br>
	<br>

	<form action="www.naver.com" method="get">
		아이디 : <input type="text" id="id" name="id" value="abc"><br>
		비밀번호 : <input type="password" id="pwd" name="pwd" value="1234">
		<br>
		<br>
		<button id="changeBtn">JSON Type 전송</button>
	</form>
	
	<br>
	<br>
	
	<div id="result"></div>

</body>
</html>