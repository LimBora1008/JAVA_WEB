<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.text.*" %>    
<%@ page import="java.util.Date" %>    
<%@ page import="com.javalab.jsp.*" %>

<%
	// 한글이 깨지지 않도록 post 요청으로 메시지 바디 부분에 담겨오는 파라미터들을 인코딩
	request.setCharacterEncoding("utf-8");
%>    

<!-- useBean 액션태그로 Member객체를 생성함 -->
<jsp:useBean id="member" scope="request" class="com.javalab.jsp.Member" />

<!--  
[중요] 파라미터 자동 포집!!
화면에서 입력받은 값이 위에서 생성한 member 객체에 자동 세팅됨.
입력화면 엘리먼트들의 name 속성의 이름과 member 프로퍼티의 이름이 같아야만 가능함 즉 자바빈즈 규약에 맞아야 가능함!
 -->

<jsp:setProperty name="member" property="*" />
<!-- member라는 이름으로 Member클래스의 객체를 생성하고 setProperty 속성을 이용하여 객체의 빈데이터에 값을 전달한다. -->
<!-- 위에서 property(속성)이 '*':모든 속성이 아닌 개별 속성의 이름으로 되어 있다면 value="" 속성을 추가해야 한다. 모든 속성으로 설정하면 모든 데이터를 getter로 가져옴 -->


<%
/* 
	// 아랫 부분 코드가 불필요함
	// 입력 화면에서 파라미터 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 폼에서 입력된 회원 정보로 Member 객체 생성
	Member newMember = new Member();
	newMember.setId(id);
	newMember.setPassword(password);
	newMember.setName(name);
	newMember.setEmail(email);
	
*/
	// 화면에서 입력한 정보로 생성된 회원 객체를 request 기본 객체에 저장
	request.setAttribute("newMember", member); // setAttribute : request객체에 정보를 저장한다
	
%>

<jsp:forward page="showMember.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>