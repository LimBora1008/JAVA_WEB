<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head><title>절대 경로 사용하여 자원 읽기</title></head>
<body>
	<h2>application 기본 객체 사용하여 자원(파일,이미지 등) 읽기</h2>
	<br><br>
<%
	char[] buff = new char[128];
	int len = -1;
	
	//String filePath = "C:/filetest/notice.txt";
	String filePath = "D:/javaworks/tomcats/apache-tomcat-9.0.73/webapps/chap02_jsp01/message/notice.txt";
	
	try(InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "UTF-8")) {
		while ( (len = fr.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("익셉션 발생: "+ex.getMessage());
	}
%>

</body>
</html>
