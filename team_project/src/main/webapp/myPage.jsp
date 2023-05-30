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
</style>

<script>
  function deleteMember() {
    var confirmDelete = confirm("회원 탈퇴하시겠습니까?");
    
    if (confirmDelete) {
      var xhr = new XMLHttpRequest();
      
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
          if (xhr.status === 200) {
            alert("회원 탈퇴가 완료되었습니다.");
            window.location.href = "mainPage.jsp"; // 메인 페이지로 이동
          } else {
            alert("회원 탈퇴에 실패하였습니다.");
          }
        }
      };
      
      xhr.open("GET", "${contextPath}/mypageDelete", true);
      xhr.send();
    }
  }
</script>

<title>MyPage</title>
</head>

<body style="margin:auto; overflow:scroll; width: 1000px;">
	<div> <!-- 전체 -->
		<div><!-- 상단 -->
			<a href="${contextPath}/#">
			<img alt="로고" src="${contextPath}/images/cinema_width.png">
			</a>
			
			<div style="float: right; margin-top: 25px; vertical-align: bottom;">
				<p style="margin-top: 50px; margin-bottom: 0px; ">${sessionScope.member.id} 님 환영합니다 <a href="${pageContext.request.contextPath}/logout" style="text-decoration: none;">로그아웃</a></p>
			</div>
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
		
		<table style="margin-top: 40px; width:70%; float:left; border-bottom-left-radius:30px; border-bottom-right-radius:30px; border-top-right-radius:30px; border-top-left-radius:30px; background-color: #bffd9f">
			<tr>
				<td colspan="3">
					<h1 style="text-align:center;">MY PAGE</h1>
				</td>
			</tr>
			
			<tr>
				<td style="vertical-align: top;">
					<h5 style="text-align:center; margin: 0px;">프로필</h5>
					<img src="${contextPath}/images/no-photo.png" style="background-color: white; border: 1px solid grey; width:100px; height:100px; display: block; margin: auto;">
				</td>
				
				<td style=" vertical-align: top;">
					<br><br>
					아이디 <br><br>
					이름
				</td>
				
				<c:forEach var="member" items="${memberList}">
					<td style="vertical-align: top; text-align: left; width: 250px;">
						<br><br>
						${member.id}<br><br>
						${member.name}<br><br>
					</td>
				</c:forEach>
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2" style="text-align: left;"><button onclick="deleteMember()" style="border-color:#AAFC7E; background-color:#AAFC7E; width: 60%;">회원탈퇴</button>
</td>
			</tr>
			
			<tr>
				<td><br><br></td>
			</tr>
		</table>

		<table style="width:30%; float: right;">
			<tr style="position: fixed; left: 80%;">
			 	<td>
					<h6 style="text-align: center; margin: auto;">광고</h6>
					<img src="${contextPath}/images/movie_poster.gif" style="max-width: 100%; height: 300px; display: block; margin: auto;">
				</td>
			</tr>
		</table>
		
		<table> <!-- 테이블 사이 여백 -->
			<tr>
				<td style="padding-top: 300px;"><br><br><br></td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test="${empty ticketList }">
			 	<h3>회원님의 예매 기록</h3>
				<table style="border: 1px solid grey; width:70%;">
					<tr>
						<td style="text-align: center;"><h5>예매 기록이 없습니다</h5></td>
					</tr>
				</table>
			</c:when>
			
			<c:otherwise>
				<h3>${sessionScope.member.id} 회원님의 예매 기록</h3>
					<c:forEach var="ticket" items="${ticketList}">
						<table style="width:70%;"><!-- background-color: #bffd9f -->
							<tr>
								<td rowspan="3" style="width: 200px;padding-left: 10px;padding-top: 20px;">
								<a href="${contextPath}/movieInfo?id=${ticket.movie_id}" style="text-decoration: none;">
								<img src="${contextPath}/images/mypage-image/${ticket.movie_id}.jpg" style="width: 200px; height: 300px;">
								</a>
								</td>
							</tr>
						
							<tr>
								<td></td>
								
								<td style="padding-top:50px; text-align:center; vertical-align: top; width: 100px;">
									티켓번호<br><br>
									영화이름<br><br>
									예매일자<br><br>
									금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액<br><br>
								</td>
								
								<td style="padding-top:50px; text-align:left; vertical-align: top; padding-left: 10px;">
									${ticket.ticket_code}<br><br>
									<a href="${contextPath}/movieInfo?id=${ticket.movie_id}" style="text-decoration: none;">
										${ticket.movie_name}&nbsp;&nbsp;&nbsp;<%-- <button type="button" onclick="location.href='${contextPath}/movieInfo?id=${ticket.movie_id}'" style="border-color:#AAFC7E; background-color:#AAFC7E; width: 30%;">상세정보</button> --%><br><br>
									</a>
									${ticket.ticket_date}<br><br>
									${ticket.ticket_price}<br><br>
								</td>
							</tr> 
						</table>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	</div> <!-- 전체 틀 -->
</body>
</html>