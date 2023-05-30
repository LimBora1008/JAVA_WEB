<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.javalab.vo.Movie"%>
<%@ page import="com.javalab.dao.MovieDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 상단 파비콘 삽입 -->
<link rel="shortcut icon" href="images/EZEN.ico">
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet" type="text/css" href="./css/mainPage.css" />
<link rel="stylesheet" type="text/css" href="./css/movieInfo.css" />
<title>나의 영화관 사이트</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>



iframe {
    width: 1087px;
    height: 560px;
    margin-bottom: 100px;
}
.reservation-section {

   width: 1200px;
   margin: 200px auto;
   border: 1px solid #80808030;
   height: 450px;
}

.reservation-date {
   height: 50px;
    border-bottom: 1px solid gray;
}
.reservation-info {display: flex; height: 398px;}
#screenInfo {overflow-y:scroll; width: 48%; padding:13px 0px;}
.movie-box {
    border-right: 1px solid #80808030;
    height: auto;
    display: flex;
    align-items: center;
    padding-left: 20px;
    padding-right: 20px;
}

.location-info {
   list-style: none;
}
.location-button {
   border: none;
    margin-bottom: 5px;
    margin-right: 5px;
    padding: 10px;
    width: 150px;
    text-align: left;
    cursor: pointer;
}
.theater-button {
   border: none;
    margin-bottom: 5px;
    margin-right: 5px;
    padding: 10px;
    width: 150px;
    text-align: left;
    cursor: pointer;
}

ul {
    display: flex;
    flex-direction: column;
    height: 95%;
    margin: 0 5px;
    padding: 10px 0px;
    overflow-y: scroll;
}
.s-movie-info {text-align:center;}
.s-movie-info .movie-name {
	font-size: 20px;
	    width: 200px;
}

.screen-list {
    list-style: none;
    display: flex;
    padding: 15px;
    border: 1px solid #d9d9d9;
    height: 42px;
    width: 93%;
    align-items: center;
    cursor: pointer;
    border-top: none;
    margin-bottom: 10px;
}
.screen-list:hover {
	background-color: #b9b9b94d;
}
.screen-time {
	display:flex;
	flex-direction: column;
}
.screen-time .start-time {
	font-weight:bold;
	font-size:16px;
}
.screen-time .end-time {
	font-size:12px;
}
.screen-list .movie-name {
    flex: auto;
    display: flex;
    margin-left: 34px;
}
.screen-room-info {
	display: flex;
	flex-direction: column;
}
.screen-room-info .room-name {}
.screen-room-info .seat-number {
	font-weight: bold;
    font-size: 12px;
}
/* CSS 스타일링 */
.container {
   max-width: 1000x;
   margin: 0 auto;
   padding: 20px;
}

/* 로그인 툴 */
#login-tools {
 text-align: right;
 padding-right:200px;
}

#login-tools a {
 text-decoration: none;
 color: black;
 margin-left: 10px;
 text-align: right;
}

#login-tools a:first-child {
 margin-left: 0;
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
/*
ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
}
*/
/*
li {
   background-color: #fff;
   margin: 10px;
   padding: 10px;
   border-radius: 5px;
   box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
   width: 300px;
   max-width: 200px;
   min-width: 200px;
}
*/

.movie-info {
   display: none;
   flex-direction: column;
   align-items: center;
   text-align: center;
}

.movie-info.active {
   display: flex;
}

.movie-info button {
    display: block;
    width: 150px;
    padding: 5px 10px;
    text-align: center;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    margin-top: 10px;
    border-radius: 5px;
}

li img {
   width: 100%;
   height: auto;
}

.button a { /* 상영예정작 예매하기 버튼*/
   color: inherit;
   text-decoration: none;
}

p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
   width: 200px;
}

a {
   color: black;
   text-decoration-line: none;
}


.submenu {
   list-style-type: none;
   margin: 0;
   display: flex;
   justify-content: flex-end;
}


.submenu button {
  background-color: #6e6e6e;
  color: white;
  font-weight: bold;
  border: none;
  border-radius: 20px;
  width: 100px;
  height: 30px;
}

.submenu button:active {

    box-shadow: inset -.3rem -.1rem 1.4rem  #FBFBFB, inset .3rem .4rem .8rem #BEC5D0; 
    cursor: pointer;

}

.submenu button:outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}

.submenu button:outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

</style>
<script type="text/javascript">
  var currentPage = 1;
  var pageSize = 46;
 
  function loadMovies() {
    showCurrentMovies();
  }

  function showCurrentMovies() {
    var movieList = document.getElementById("currentMovies");
    movieList.style.display = "block";
    document.getElementById("upcomingMovies").style.display = "none";
  }

  function showUpcomingMovies() {
    var movieList = document.getElementById("currentMovies");
    movieList.style.display = "none";
    document.getElementById("upcomingMovies").style.display = "block";
  }

</script>
</head>

<body style="width: 1400px; margin: auto;">
   <center>
      <a href="${pageContext.request.contextPath}/mainPage.jsp"> <img
         src="images/cinema_width.png" alt="EZEN CINEMA">
      </a>
   </center>
<span style="display: block;margin-top: 50px;margin-bottom: 0px;text-align: right;">
         <c:if test="${not empty sessionScope.member.id}">
           <strong>${sessionScope.member.id} 님 환영합니다</strong>
           <a href="${pageContext.request.contextPath}/logout" style="text-decoration: none;">로그아웃</a>
         </c:if>
         <c:if test="${empty sessionScope.member.id}">
            <a href="${pageContext.request.contextPath}/login"><strong>로그인</strong></a>
            <a href="${pageContext.request.contextPath}/insertMember"><strong>회원가입</strong></a>
         </c:if>
</span>
   <div id="content">
            <div id="header">
               <h1>
                  <!--       상단메뉴 네비게이션바 -->
                  <nav class="sitemenu">
                     <a href="${contextPath}/movieList">영화</a> 
                     <a href="http://www.cgv.co.kr/ticket/">예매</a> 
                     <a href="관람평페이지주소">상세보기</a> 
                     <a href="${contextPath}/mypage">마이페이지</a>
                  </nav>
               </h1>
            </div>
         </div>
   <hr>
	



   <section class="reservation-section">
      <div class="reservation-date">

      </div>
      
      <div class="reservation-info">
         <div class="movie-box">
            <div class="s-movie-info">
               <img src="images/movie/${movieOne.movie_id}.jpg" width="200px" height="300px">
               <div class="movie-name">${movieOne.movie_name }</div>
            </div>
         </div>

         <ul class="location-info">
            <c:choose>
               <c:when test="${locationList.size() == 0 }">
                     등록된 지역이 없습니다.
               </c:when>
               <c:otherwise>
                  <c:forEach var="list" items="${locationList }" varStatus="i">
                     <li class="location-tab">
                        <button class="location-button" value="${list.location_loc }">${list.location_loc }</button>
                     </li>
                  </c:forEach>
               </c:otherwise>
            </c:choose>
         </ul>
         <div id="output"></div>
         <div id="screenInfo"></div>
      </div>
      <div class="reservation-info-seat">
      
      </div>
   </section>


   <script>
      $(function() {
            $('.location-button').on('click', function () {
            let clickedLocationLoc = $(this).val(); 
            $.ajax({
               url: "${contextPath}/reservation", 
               type: "post",
               data: {clickedLocationLoc: clickedLocationLoc},
               dataType: "text",
               success: function(result) {
                  const theaterList = JSON.parse(result);
                  
                  $('#output').empty();
                  $('#screenInfo').empty();

                  var ul = "<ul>";
                  $.each(theaterList, function(index, list) {
                     ul += "<button class='theater-button' value='"+list.theater_name+"'>" + list.theater_name + "</button>";
                  })      
                  ul += "</ul>";
                  $('#output').append(ul);
                  },
               })
            })
            $(document).on('click', '.theater-button', function() {
               let theaterName = $(this).val(); 
               $.ajax({
                  url: "${contextPath}/reservation", 
                  type: "post",
                  data: {
                     theaterName: theaterName,
                     id : <%=request.getParameter("id")%>
                  },
                  dataType: "text",
                  success: function(result) {
                        const screenList = JSON.parse(result);
                        $('#screenInfo').empty();
   
						var li = "";
                        $.each(screenList, function(index, list) {
                        	li += "<input type='hidden' id='theater-name' value='"+list.theater_name+"'> ";
                        	li += "<input id='movie-id-input' type='hidden' value='"+list.movie_id+"'>"
                        	li += "<input id='movie-price-input' type='hidden' value='"+list.movie_price+"'>"
                           li += "<li class='screen-list' id='"+list.screen_no+"' ><div class='screen-time'><span class='start-time'>"+list.screen_start + "</span>" + "<span class='end-time'>~" + list.movie_rtime+"</span></div>";
                           li += "<div class='movie-name'><span>"+ list.movie_name +"</span></div>";
                           li += "<div class='screen-room-info'><span class='room-name'>"+ list.room_name +"</span>";
                           li += "<span class='seat-number'>"+ list.seat_number +"</span></div></li>";
                        })      

                        $('#screenInfo').append(li);
                     },
                  })
            });
            
            $(document).on('click', '.screen-list', function() {   	
            	$('.reservation-info-seat').append("<form class='seatForm' target='seatIframe' method='post' action='${contextPath}/reservation'><input type='text' name='screen-no' value='"+$(this).attr('id')+"'><input name='movie-id' value=${movieOne.movie_id}><input name='theater-name' type='text' value="+$('#theater-name').val()+"></form>");
            	$('.reservation-info-seat').append("<iframe name='seatIframe'></iframe>");
            	$('.seatForm').submit();
            	$('.reservation-info').empty();
				$('.reservation-info').css('display', 'none');
            	$('.seatForm').css('display', 'none');
            });
            

      })
   </script>


</body>
</html>

