<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>이미지 갤러리</title>
</head>
<body>

   <h1>이미지 갤러리</h1>
   
   <c:forEach var="imgPath" items="${imageList}">
      <div>
         <img src="${imgPath}" width="200" height="200">
         
         <form method="get" action="<c:url value='/download.do'/>">
         
               
            <input type="hidden" name="file" value="${imgPath}">
            <button type="submit">Download</button>
            
         </form>
         
      </div>
   </c:forEach>

</body>
</html>