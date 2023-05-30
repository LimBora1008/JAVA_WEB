<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 상단 파비콘  -->
<link rel="shortcut icon" href="images/icon_EZEN.ico">

<style>
#header {
 padding: 10px;
 text-align: center;
 width: 100%;
 background: #0a854b;
}

#header h1 {
 display: inline-block;
 vertical-align: middle;
 margin: 0;
 padding: 0;
 font-size: 24px;
 word-spacing: 100px; /*글자 단어 사이 간격 조정*/
}

#header a {
 text-decoration: none;
 color: #fff;
 margin-right: 10px;
 letter-spacing: 2px; /* 글자 간격 조정 */
}
header nav{
 text-align: cneter;
 width: 100%;
}

#header {
 padding: 10px;
 text-align: center;
 width: 100%;
 background: #0a854b;
}

#header h1 {
 display: inline-block;
 vertical-align: middle;
 margin: 0;
 padding: 0;
 font-size: 24px;
 word-spacing: 100px; /*글자 단어 사이 간격 조정*/
}

#header a {
 text-decoration: none;
 color: #fff;
 margin-right: 10px;
 letter-spacing: 2px; /* 글자 간격 조정 */
}
header nav{
 text-align: cneter;
 width: 100%;
}
</style>


<title>EZEN CINEMA</title>
</head>

<body style="margin:auto; overflow:scroll; width: 1000px;">
	<div> <!-- 전체 -->
		<div><!-- 상단 -->
			<a href="${contextPath}/#">
			<img alt="로고" src="${contextPath}/images/cinema_width.png">
			</a>
		</div>
		
		<div id="content">
            <div id="header">
               <h1>
                  <!--       상단메뉴 네비게이션바 -->
                  <nav class="sitemenu">
                     <a href="${contextPath}/movieList">영화</a> 
                     <a href="${contextPath}/errorPage.jsp">예매</a> 
                     <a href="${contextPath}/errorPage.jsp">상세보기</a> 
                     <a href="${contextPath}/mypage">마이페이지</a>
                  </nav>
               </h1>
            </div>
         </div>
		<br><br><br>
		<div style="text-align: center;"><img src="${contextPath}/images/vip/서버점검.jpg"></div>
	
</body>
</html>