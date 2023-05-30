<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
* {
   list-style: none;
   margin: 0px;
   padding: 0px;
   overflow: hidden;
}

.len {
   display: flex;
   align-items: center;
}

h2.tit {
   padding: 0 0 26px 0;
   font-size: 1.8666em;
   font-weight: 400;
   letter-spacing: -1px;
   line-height: 1.1;
   color: #222;
}

.len .seat-button {
   width: 20px;
   height: 20px;
   margin: 10px;
   border: 1px solid #02bfd3;
   background: #48484a;
   color: #fff;
   cursor: pointer;
}

.seat-select-section {
   border: 1px solid #e3e3e3;
   width: 1120px;
   height: 500px;
   display: flex;
   align-items: center;
   justify-content: space-around;
   float: left;
   border-top: 1px solid #000;
   background: #120c0c;
}

.seat-number {
   background: purple;
   padding: 5px;
   display: inline-block;
}

.seat-result .wrap {
   padding: 15px 20px 0 0;
}

.seat-select-section .screen {
   font-size: 20px;
   text-align: center;
   padding: 10px;
}

.seat-select-section .seat-result {
   overflow: hidden;
   left: 770px;
   top: 0;
   width: 310px;
   height: 430px;
   margin-left: 20px;
   color: #fff;
   background-color: #333;
   border-radius: 10px;
}

.seat-area {
   margin-top: 50px;
}

.seat-select-section .seat-result .wrap {
   position: relative;
   width: 100%;
   height: 100%;
   padding: 15px 20px 0 0;
}

.seat-select-section .seat-result .wrap .tit-area {
   overflow: hidden;
   position: relative;
   padding: 0 0 0 28px;
   border-bottom: 1px solid #434343;
}

.seat-select-section .seat-result .wrap .info-area {
   position: relative;
   min-height: 121px;
   padding: 20px;
   font-size: .8667em;
   border-bottom: 1px solid #434343;
   display: flex;
   justify-content: space-between;
}

.seat-select-section .seat-result .wrap .choice-seat-area {
   overflow: hidden;
   position: relative;
   min-height: 230px;
   margin: 10px 0 0 20px;
   border-radius: 5px;
   border: 1px solid #434343;
}

.seat-select-section .seat-result .wrap .pay-area {
   position: absolute;
   left: 0;
   bottom: 40px;
   width: 100%;
   margin: 0;
   padding: 10px 20px;
}

.seat-select-section .seat-result .wrap .pay-area .money {
   margin-bottom: 11px;
}

.seat-select-section .seat-result .wrap .btn-group {
   position: absolute;
   left: -11px;
   bottom: 15px;
   width: 100%;
   margin: 0;
   padding: 0;
}

.seat-select-section .seat-result .wrap .btn-group .button {
   display: block;
   float: left;
   width: 50%;
   height: 40px;
   margin: 0;
   padding: 0;
   font-size: 1.2em;
   line-height: 40px;
   color: #fff !important;
   border: 0;
   border-radius: 0;
   background-color: #53565b;
   text-align: center;
}

.seat-select-section .seat-result .wrap .btn-group .button.active {
   color: #fff !important;
   background-color: #329eb1;
}
.len .len-name { color: #fff;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <h2 class="tit">빠른예매</h2>
   <div class="seat-select-section">

      <div class="seat-section">

         <div class="screen" style="color: #fff;">SCREEN</div>
         <hr>
         <ul class="seat-area">
            <li class="A len">
               <div class="len-name">A</div>
               <button class='seat-button' value="A-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="A-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="A-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="A-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="A-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="A-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="A-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="A-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="A-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="A-10">
                  <span>10</span>
               </button>
            </li>
            <li class="B len">
               <div class="len-name">B</div>
               <button class='seat-button' value="B-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="B-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="B-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="B-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="B-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="B-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="B-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="B-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="B-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="B-10">
                  <span>10</span>
               </button>
            </li>
            <li class="G len">
               <div class="len-name">C</div>
               <button class='seat-button' value="C-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="C-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="C-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="C-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="C-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="C-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="C-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="C-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="C-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="C-10">
                  <span>10</span>
               </button>
            </li>
            <li class="G len">
               <div class="len-name">D</div>
               <button class='seat-button' value="D-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="D-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="D-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="D-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="D-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="D-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="D-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="D-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="D-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="D-10">
                  <span>10</span>
               </button>
            </li>
            <li class="G len">
               <div class="len-name">E</div>
               <button class='seat-button' value="E-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="E-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="E-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="E-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="E-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="E-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="E-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="E-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="E-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="E-10">
                  <span>10</span>
               </button>
            </li>
            <li class="G len">
               <div class="len-name">F</div>
               <button class='seat-button' value="F-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="F-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="F-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="F-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="F-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="F-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="F-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="F-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="F-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="F-10">
                  <span>10</span>
               </button>
            </li>
            <li class="G len">
               <div class="len-name">G</div>
               <button class='seat-button' value="G-1">
                  <span>1</span>
               </button>
               <button class="seat-button" value="G-2">
                  <span>2</span>
               </button>
               <button class="seat-button" value="G-3">
                  <span>3</span>
               </button>
               <button class="seat-button" value="G-4">
                  <span>4</span>
               </button>
               <button class="seat-button" value="G-5">
                  <span>5</span>
               </button>
               <button class="seat-button" value="G-6">
                  <span>6</span>
               </button>
               <button class="seat-button" value="G-7">
                  <span>7</span>
               </button>
               <button class="seat-button" value="G-8">
                  <span>8</span>
               </button>
               <button class="seat-button" value="G-9">
                  <span>9</span>
               </button>
               <button class="seat-button" value="G-10">
                  <span>10</span>
               </button>
            </li>
         </ul>
      </div>
      <div class="seat-result">
         <div class="wrap">
            <div class="tit-area">
               <span class="movie-grade small age-all age-12">${screenOne.movie_age}세이상관람가</span>
               <p class="tit">${screenOne.movie_name}</p>

            </div>
            <div class="info-area">
               <div class="left-info">
                  <input type="hidden" id="movieId" value="${screenOne.movie_id }">
                  <input type="hidden" id="screenNo" value="${screenOne.screen_no }">
                  <p class="theater">이젠영화관 ${screenOne.theater_name}점</p>
                  <p class="special">${screenOne.room_name }</p>
                  <p class="date">
                     <span>${screenOne.screen_date }</span><em></em>
                  </p>
                  <div>${screenOne.screen_start }~${screenOne.screen_end }</div>
                  <div class="seat-number"></div>

               </div>
               <div class="right-info">
                  <div class="poster">
                     <img src="${contextPath}/images/movie/${screenOne.movie_id}.jpg" width="100px" height="150px">
                  </div>
               </div>

            </div>
            <div class="pay-area">
               <p class="count"></p>
               <div class="pay">
                  <p class="tit">최종결제금액</p>
                  <input type="hidden" id="priceValue"
                     value="${screenOne.movie_price }">
                  <div class="money">
                     <em>${screenOne.movie_price }</em> <span>원</span>
                  </div>
               </div>
            </div>
            <div class="btn-group">
               <a href="#" class="button" id="pagePrevious"
                  title="이전">이전</a> <a href="#"
                  class="button disabled" id="pageNext" title="다음">결제</a>
            </div>
         </div>
      </div>
   </div>
   <script>
      $(function() {
         $('.seat-button').on('click', function() {
            $('.seat-number').empty();
            $('.seat-number').append($(this).val())

         });

         $('#pageNext').on('click', function() {
            let len = $('.seat-number').text().split("-")[0];
            let wid = $('.seat-number').text().split("-")[1];
            $.ajax({
               url : "${contextPath}/reservation",
               type : "post",
               data : {
                  moviePrice : $('#priceValue').val(),
                  movieId : $('#movieId').val(),
                  seatCode : $('.seat-number').text(),
                  userId : '${sessionScope.member.id}',
                  len : len,
                  wid : wid,
                  screenNo : $('#screenNo').val(),
                  theme : "예약하기"
               },
               dataType : "text",
               success : function(result) {
                  console.log(result);
                  if(result === 'true') {
                     alert("예약이 완료 되었습니다.");
                     window.parent.location.href = ${contextPath}/+"mypage";
                  } else if (result == 'alreadySeat') {
                     alert("이미 예약된 좌석입니다.");
                  } else if (result == 'false') {
                     alert("로그인 후 이용 가능합니다.");
                  }
               }
            });
         });

      })
   </script>
</body>
</html>