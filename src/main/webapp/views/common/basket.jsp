<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String basketContextPath = request.getContextPath(); // "/mvp"
	//Member loginUser = (Member)session.getAttribute("loginUser");
	// 해당 구문이 실행되는 시점 
	// 로그인 요청 전 페이지 로드시 : null
	// 로그인 성공 후 페이지 로드시 : 조회된 데이터가 담겨있는 Member객체
%>

<a>영화비교(#/3)</a>
<div id="basket">
  <div id="basket-movie">
    <div id="movie-basket-list1">
      <img src="<%= basketContextPath%>/assets/image/mainPageImg/movie_image/movie_image_2.png" style="margin-top: 20px;">
    </div>
    <hr style="border: 1px solid #4a4a4a; width: 127px;">
    <div id="movie-basket-list2">
      <img src="<%= basketContextPath%>/assets/image/mainPageImg/movie_image/movie_image_1.png">
    </div>
    <hr style="border: 1px solid #4a4a4a; width: 127px;">
    <div id="movie-basket-list3">
      <img src="<%= basketContextPath%>/assets/image/mainPageImg/movie_image/movie_image_2.png" style="margin-bottom: 20px;">
    </div>
  </div> <!-- basket-movie div 끝 -->
</div>
<!-- BootStrap버전 -->
<!-- <button type="button" class="btn btn-danger" style="width: 255px; height: 42px; border-radius: 10px; font-size: 16px; margin-top: 30px;">비교하기</button> -->
<button style="background-color: #F33F3F; color: white; font-size: 16px; border-radius: 10px; width: 255px; height: 42px; margin-top: 30px; margin-bottom: 30px; border: 0;">비교하기</button>
