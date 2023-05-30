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
<link rel="shortcut icon" href="images/icon_EZEN.ico">
<title>EZEN CINEMA</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<style>





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
.movie-info {
   display: none;
   flex-direction: column;
   align-items: center;
   text-align: center;
}
*/

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
.movie-info-section {
	width:1200px;
	margin: 0 auto;
	margin-bottom: 400px;
}

.movie-info-section .banner-wrap {
	position: relative;
	width:100%;
	height:500px;
}

.movie-info-section .banner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	filter: blur(3px);
    background: center;
    background-size: cover;
    position: absolute;
	z-index: -1;
	height:100%;
	right: -366px;
    width: 2000px;
}
.banner-inner {
	display: flex;
    align-items: center;
    justify-content: space-around;
    height: 100%;
	
}
.movie-info-section .left .movie-name {
    font-weight: bold;
    color: #fff;
    font-size: 59px;
}

.movie-info-section .right {
	display: flex;
    flex-direction: column;
}

.movie-info-section .right a{
	background: dodgerblue;
    height: 40px;
    border: 1px solid gray;
    cursor: pointer;
    font-size: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    color: #fff;
}
.movie-info-section .right a:hover {
	background: #57a3ed;
}
.movie-info-section .content{margin-top:100px;}
.movie-info-section .content .content-wrap {
	display: flex;
    margin: 0px;
    list-style: none;
    padding: 0px;
    border: 1px solid #0000003d;
    justify-content: space-around;
}

.movie-info-section .content .content-wrap .content-tab {
	width: 100%;
    text-align: center;
    height: 100%;
    padding: 20px 0px;
    cursor:pointer;
    color: #0a854b;
    font-weight:bold;
}
.movie-info-section .content .content-wrap .content-tab:hover {
	opacity: 0.8;
}

.movie-info-section .content .movie-info-wrap {
	margin-top: 30px;
}

.movie-info-section .content .movie-info-wrap .movie-intro{
	padding: 20px 0px;
    font-size: 25px;
    letter-spacing: 1px;
    border-bottom: 1px solid #80808036;
}

.movie-info-section .content .movie-info-wrap .movie-info {
	margin-top: 20px;
	font-size: 23px;
}

.review {
    display: flex;
    align-items: center;
    width: 100%;
    border-top: 1px solid #c7c7c773;
    padding: 17px 0px;
    position: relative;
}
.review .review-delete-btn {
	position: absolute;
	right:0;
	cursor: pointer;
}

.review .member-id {
	margin-right: 20px;
    font-size: 22px;
    margin-right: 30px;
    width: 100px;
}

.review .review-score {
    font-size: 36px;
    color: #0a854b;
    margin-right: 40px;
    border-right: 1px solid #0a854b;
    padding-right: 40px;
    width: 40px;
    margin-left: 30px;
}

.review-input-box {
	margin: 30px 0px;
}

.review-input-box .content-input {
font-size: 20px;
    width: 89%;
    margin-right: 10px;
    padding: 10px;
}

.review-input-box  .score-input {
    font-size: 20px;
    width: 38px;
    padding: 10px;
}

.review-input-box .score-span {
    font-size: 20px;
    color: #0a854b;

}

.review-input-box button {
	font-size: 17px;
    padding: 5px 0px;
    width: 102px;
    background: #0a854b;
    border: 1px solid #fff;
    color: #fff;
    cursor: pointer;
    float: right;
    margin: 20px 10px;
}
.review-input-box button:hover {
	opacity: 0.8;
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
<style>


</style>

<section class="movie-info-section">

	<div class="banner-wrap">
		<div class="banner" style="background-image: url('images/movie/${movieOne.movie_id}.jpg')">
		</div>
		
		<div class="banner-inner">
			<div class="left">
				<h1 class="movie-name">${movieOne.movie_name}</h1>
			</div>
			<div class="right">
				<img src="images/movie/${movieOne.movie_id}.jpg" width="250px"
					height="300px"> <a
					href='<c:url value='/reservation?id=${movieOne.movie_id }'></c:url>'>
					예매하기 </a>
			</div>
		</div>

	</div>


	<div class="content">
		<ul class="content-wrap">
			<li class="content-tab info-tab">주요정보</li>
			<li class="content-tab review-tab">실관람평</li>
		</ul>
		<div class="movie-info-wrap">
			<div class="movie-intro">${movieOne.movie_intro }</div>
			<div class="movie-info">
				<div class="director">감독:${movieOne.movie_director}</div>
				<div class="genre">장르:${movieOne.movie_genre}</div>
				<div class="runtime">런타임:${movieOne.movie_rtime}</div>
				<div class="movie-age">${movieOne.movie_age}세이상관람가</div>
				<div class="movie-release">개봉일 : ${movieOne.movie_release}</div>
				<div class="cast">출연진:${movieOne.movie_cast}</div>
			</div>
		</div>
	</div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

let contentTab = document.querySelectorAll('.content-tab');


$(function() {

	$( ".content-tab" ).each(function(index) {
		
	    $(this).on("click", function(){
	        if ($(this).text() == "주요정보") {
	        	const template = `<div class="movie-info-wrap">
					    			<div class="movie-intro">${movieOne.movie_intro }</div>
					    			<div class="movie-info">
					    				<div class="director">감독:${movieOne.movie_director}</div>
					    				<div class="genre">장르:${movieOne.movie_genre}</div>
					    				<div class="runtime">런타임:${movieOne.movie_rtime}</div>
					    				<div class="movie-age">${movieOne.movie_age}세이상관람가</div>
					    				<div class="movie-release">개봉일 : ${movieOne.movie_release}</div>
					    				<div class="cast">출연진:${movieOne.movie_cast}</div>
					    			</div>
	    						   </div> `;
	        	$('.movie-info-wrap').empty();
	        	$('.movie-info-wrap').append(template);
	        } else if ($(this).text() == "실관람평") {
	        	
	        	$('.movie-info-wrap').empty();
	        	let reviewInput = "<form action='"+${contextPath}/+"reviewWrite' method='post' class='review-input-box'>";
	        			reviewInput += "<input type='hidden' name='movieId2' value='"+${movieOne.movie_id}+"'>";
	        			reviewInput += "<input type='text' name='content' class='content-input' placeholder='영화 리뷰를 작성해주세요'>";
			        	reviewInput += "<input type='number' max='10' min='0' name='score' class='score-input'> <span class='score-span'>점</span>";
			        	reviewInput += "<button type='submit'>작성</button>";
	        	     reviewInput += "</form>";
	        	$('.movie-info-wrap').append(reviewInput);
	        	
	             $.ajax({
	                 url: "${contextPath}/review", 
	                 type: "post",
	                 data: {
	                    movieId: ${movieOne.movie_id}
	                 },
	                 dataType: "text",
	                 success: function(result) {
	                	 
	                	 $('.movie-info-wrap').append(JSON.parse(result));
						 console.log(JSON.parse(result));
						 const reviewList = JSON.parse(result);
						 var li = "";
						 $.each(reviewList, function(index, list) { 
							 li += "<li class='review'>";
								 li += "<div class='member-id'>"+ list.member_id +"</div>";
								 li += "<div class='review-score'>"+ list.review_score +"</div>";
								 li += "<div class='review-content'>"+ list.review_content +"</div>";
								 li += "<button style='border:none;' class='review-delete-btn'>삭제</butto>"
							 li += "</li>";
						 });

						 $('.movie-info-wrap').append(li);
	                    }
	               });
	               
	        }
	    });
	});
	

	$(document).on('click', '.review-delete-btn', function() {
		let bool = confirm("리뷰를 삭제하시겠습니까?");
		if (bool == true) {
			window.location.href = ${contextPath}/ + "reviewDelete";
		} else {
			return;
		}
	})

})
	
	




</script>


</body>
</html>