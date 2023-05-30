<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javalab.vo.Movie" %>
<%@ page import="com.javalab.dao.MovieDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 상단 파비콘 삽입 -->
<link rel="shortcut icon" href="images/icon_EZEN.ico">
<title>EZEN CINEMA</title>
<style>
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

ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
}

li {
   background-color: #fff;
   margin: 10px;
   padding: 10px;
   border-radius: 5px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   width: 300px;
   max-width: 200px;
   min-width: 200px;
}

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
                     <a href="#">영화</a> 
                     <a href="${pageContext.request.contextPath}/errorPage.jsp">예매</a> 
                     <a href="${pageContext.request.contextPath}/errorPage.jsp">상세보기</a> 
                     <a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
                  </nav>
               </h1>
            </div>
         </div>
   <br>
   <div id="movieList" class="container" style="padding-bottom: 0px;padding-top: 0px;">
      <div class="wrap-movie-list">
         <div class="tit-heading-wrap">
            <div
               style="display: flex; justify-content: space-between; align-items: center;">
               <h1 style="margin: 0; padding-left: 100px;">영화목록</h1>
               <ul class="submenu">
           <class="on current-movies"><button class="current-movies-link" onclick="showCurrentMovies()" style="">현재 상영작</button>
           <button onclick="showUpcomingMovies()">상영 예정작</button>
         </ul>
            </div>
            <hr style="border: solid 1px black;">
      <div id="currentMovies">
         <ul>
            <%
               String pageParam = request.getParameter("page");
               String pageSizeParam = request.getParameter("pageSize");
               
               int currentPage = pageParam != null ? Integer.parseInt(pageParam) : 1;
               int pageSize = pageSizeParam != null ? Integer.parseInt(pageSizeParam) : 46;
               
               MovieDao movieDao = new MovieDao();
               ArrayList<Movie> movieListData = movieDao.getMovieList(currentPage, pageSize);
               
               int count = 0;
               for (Movie movie : movieListData) {
                  int movie_id = movie.getMovie_id();
                   String movieImage = movie.getMovie_image();
                   String movieName = movie.getMovie_name();
                   count++;
            %>
            <li>
               <div class="movie-info" style="display: flex; justify-content: center;">
                  <a href="<%= request.getContextPath() + "/movieInfo?id=" + movie_id %>">
                     <img src="<%= request.getContextPath() + "/" + movieImage %>" alt="<%= movieName %>">
                  </a>
                  <p style="font-size: 14px; font-weight: bold;"><%= movieName %></p>
                  <button class="button" onclick="location.href= '<%= request.getContextPath() + "/reservation?id=" + movie_id%>'">예매하기</button>
               </div>
            </li>
            <% 
               if (count % 5 == 0) {
            %>
         </ul>
         <ul>
            <% 
               }
            %>
            <% } %>
         </ul>
      </div>
               <div id="upcomingMovies" style="display: none;"> 
               <ul class="upcoming-movies">
               <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=47">
                 <img src="images/movie/47.jpg" alt="줄리아"></a>
                 <p style="font-size: 14px; font-weight: bold;">줄리아의 인생극장</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=47">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=48">
                 <img src="images/movie/48.jpg" alt="스프린터"></a>
                 <p style="font-size: 14px; font-weight: bold;">스프린터</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=48">예매하기</a></button>
             </div>
            </li>   
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=49">
                 <img src="images/movie/49.jpg" alt="둘리"></a>
                 <p style="font-size: 14px; font-weight: bold;">아기공룡 둘리 : 얼음별 대모험 리마스터링</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=49">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=50">
                 <img src="images/movie/50.jpg" alt="카일리"></a>
                 <p style="font-size: 14px; font-weight: bold;">카일리 블루스</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=50">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=51">
                 <img src="images/movie/51.jpg" alt="내아내이야기"></a>
                 <p style="font-size: 14px; font-weight: bold;">내아내이야기</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=51">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=52">
                 <img src="images/movie/52.jpg" alt="빅트립2"></a>
                 <p style="font-size: 14px; font-weight: bold;">빅트립2: 아기곰 배달 대작전</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=52">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=53">
                 <img src="images/movie/53.jpg" alt="범죄도시3"></a>
                 <p style="font-size: 14px; font-weight: bold;">범죄도시3</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=53">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=54">
                 <img src="images/movie/54.jpg" alt="말없는소녀"></a>
                 <p style="font-size: 14px; font-weight: bold;">말없는 소녀</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=54">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=55">
                 <img src="images/movie/55.jpg" alt="드림팰리스"></a>
                 <p style="font-size: 14px; font-weight: bold;">드림팰리스</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=55">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=56">
                 <img src="images/movie/56.jpg" alt="라이드온"></a>
                 <p style="font-size: 14px; font-weight: bold;">라이드 온</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=56">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=57">
                 <img src="images/movie/57.jpg" alt="사랑하는당신에게"></a>
                 <p style="font-size: 14px; font-weight: bold;">사랑하는 당신에게</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=57">예매하기</a></button>
             </div>
            </li>   
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=58">
                 <img src="images/movie/58.jpg" alt="포켓몬스터"></a>
                 <p style="font-size: 14px; font-weight: bold;">극장판 포켓몬스터DP : 아르세우스 초극의 시공으로</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=58">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=59">
                 <img src="images/movie/59.jpg" alt="슬기로운아내수업"></a>
                 <p style="font-size: 14px; font-weight: bold;">슬기로운 아내 수업</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=59">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=60">
                 <img src="images/movie/60.jpg" alt="타임이즈업"></a>
                 <p style="font-size: 14px; font-weight: bold;">타임 이즈 업2</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=60">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=61">
                 <img src="images/movie/61.jpg" alt="이윽고바다에닿다"></a>
                 <p style="font-size: 14px; font-weight: bold;">이윽고 바다에 닿다</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=61">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=62">
                 <img src="images/movie/62.jpg" alt="그여름"></a>
                 <p style="font-size: 14px; font-weight: bold;">그 여름</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=62">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=63">
                 <img src="images/movie/63.jpg" alt="블랙워터"></a>
                 <p style="font-size: 14px; font-weight: bold;">블랙워터: 어비스</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=63">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=64">
                 <img src="images/movie/64.jpg" alt="나의사소한슬픔"></a>
                 <p style="font-size: 14px; font-weight: bold;">나의 사소한 슬픔</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=64">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=65">
                 <img src="images/movie/65.jpg" alt="수라"></a>
                 <p style="font-size: 14px; font-weight: bold;">수라</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=65">예매하기</a></button>
             </div>
            </li>
            <li>
                 <div class="movie-info" style="display: flex; justify-content: center;">
                 <a href="${pageContext.request.contextPath}/movieInfo?id=66">
                 <img src="images/movie/66.jpg" alt="파이어하트"></a>
                 <p style="font-size: 14px; font-weight: bold;">파이어하트</p>
                 <button class="button"><a href="${pageContext.request.contextPath}/reservation?id=66">예매하기</a></button>
             </div>
            </li>
            </ul>
            </div>
         </div>
      </div>
   </div>  
  </body>
 </html>