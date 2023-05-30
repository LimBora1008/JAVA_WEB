<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@page import="com.javalab.vo.*"%>
 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta content="text/html; charset=UTF-8">
   <!-- 상단 파비콘 삽입 -->
<link rel="shortcut icon" href="images/icon_EZEN.ico">
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		.errorMsg{
			color : red;
			text-align: center;
		}
		.okMsg{
			color : blue;
			text-align: center;
		}
	</style>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>         
		$(document).ready(function(){
			// 이벤트 핸들러 
			$("#btnCheck").on('click', function(e){  
				// 다음 처리 안하면 서버로 요청이 일어남
				e.preventDefault();
			
				let id = $('#id').val();	// id에 입력된 값
				
				if(id.length == 0 || id == ""){
					alert("아이디를 입력하세요.");
					$('#id').focus();
					return;
				} 
				
				// 입력값 디버깅
				console.log('id', id); 
				
				// ajax 호출
				$.ajax({
					url : '${contextPath}/idCheck',  // 서버 url
					type : 'get',           	// 요청방식 (get, post, put 등등)
				    data : {id: id},			// 서버로 전송할 데이터(key:value)
				    dataType : 'text',       	// 전달받을 데이터타입(html,xml,json,text)
				    success : function(result) {// 결과 성공 콜백함수
				        console.log(result);	// [디버깅]받은 결과 출력
				        if(result === 'true'){
	                        $('#result').removeClass('okMsg')
	                        .addClass('errorMsg').text('사용중인 아이디 입니다.');

				        }else{
	                        $('#result').removeClass('errorMsg')
	                        .addClass('okMsg').text('사용 가능한 아이디입니다.');			        	
				        }
				    },
				    error : function(request, status, error) { // 결과 에러 콜백함수
				        console.log(error)
				    }
				})	// end ajax
				
			}); // end btnCheck
			   
		});	// end ready
	</script>	
	
<script type="text/javascript">
		function fn_signUpCheck(){
			var meminsert = document.meminsert;
			var id = meminsert.id.value;
			var pw = meminsert.pw.value;
			var pwCheck = meminsert.pwCheck.value;
			var name = meminsert.name.value;
			var birthyy = meminsert.birthyy.value;
			var birthmm = meminsert.birthmm.value;
			var birthdd = meminsert.birthdd.value;
			
			//확인
  		   if(id === ""){
		   	alert("아이디를 입력해주세요.");
		   	meminsert.id.focus();
  		   }else if(!isNaN(document.meminsert.id.value.substr(0,1))) {
  			alert("아이디는 영문 또는 영문+숫자로 입력가능합니다.");
  			document.meminsert.id.focus();
  		   }else if((id < "0" || id > "9") && (id <"A" || id >"Z") && (id < "a" || id > "z")) {
   			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
   			document.meminsert.id.focus();
		   }else if(pw === ""){
			 alert("비밀번호를 입력해주세요.");
			 meminsert.pw.focus(); 
		   }else if(pw !== pwCheck){
			   alert("비밀번호가 일치하지 않습니다.");
			   meminsert.pwCheck.focus();
		   }else if(name === ""){
			   alert("이름을 입력해주세요.");
			   meminsert.name.focus();
		   }else if(birthyy === ""){
			   alert("생년월일을 입력해주세요.");
			   meminsert.birthyy.focus();
		   }else if(birthmm === ""){
			   alert("생년월일을 입력해주세요.");
			   meminsert.birthmm.focus();
		   }else if(birthdd === ""){
			   alert("생년월일을 입력해주세요.");
			   meminsert.birthdd.focus();
		   }else{
			   alert("가입이 완료되었습니다.");
			   meminsert.method = "post";
			   meminsert.action = "${contextPath}" + "/insertMember";
			   meminsert.submit();
		   }
		}
		</script>
</head>
<body>
	<center><a href="${pageContext.request.contextPath}/mainPage.jsp"><img src="images/cinema_width.png" alt="EZEN CINEMA"></a></center>
	<hr>
	<br>
	<form name= "meminsert" method="post" >
	<h1  style="text-align:center">회원가입</h1>
	<table  align="center">
	    <tr>
	       <td width="200"><p align="right">아이디</td>
	       <td width="400"><input type="text" name="id" id="id" >
	       <button id="btnCheck">중복확인</button>
	       <tr>
				<td colspan="2">
					<p style="" id="result"></p>
				</td>
			</tr>
	   
	    <tr>
	        <td width="200"><p align="right">비밀번호</td>
	        <td width="400"><input type="password"  name="pw"></td>
	    </tr>
	    <tr>
	        <td width="200"><p align="right">비밀번호재확인</td>
	        <td width="400"><input type="password"  name="pwCheck"></td>
	    </tr>
	    <tr>
	        <td width="200"><p align="right">이름</td>
	        <td width="400"><p><input type="text"  name="name"></td>
	    </tr>
	    <tr>
	        <td width="200"><p align="right">생년월일</td>
	        <td><select name="birthyy">
      		 <%for(int i=2023; i>=1900; i--){ %>
       		<option value="<%=i %>"><%=i %></option>
       		<%} %>
     		</select>년
    		 <select name="birthmm">
       		<%for(int i=1; i<=12; i++){ %>
       		<option value="<%=i %>"><%=i %></option>
      		 <%} %>
     		</select>월 
   			<select name="birthdd">
       		<%for(int i=1; i<=31; i++){ %>
       		<option value="<%=i %>"><%=i %></option>
       		<%} %>
     		</select>일 
	       </td>
	    </tr>

	    <tr>
	        <td width="200"><p>&nbsp;</p></td>
	        <td width="400">

		<input type="button" value="가입하기" onClick="fn_signUpCheck();"
		style="width:80px;height:40px; background-color: green;color:white; border:0">
		<input type="reset" value="다시입력"
		style="width:80px;height:40px; background-color: gray;color:white; border:0">
	  </td>
	    </tr>
	 
</table>
</form>
</body>
</html>
