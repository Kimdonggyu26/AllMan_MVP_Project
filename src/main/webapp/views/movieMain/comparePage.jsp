<%@ page import="java.util.List" %>
<%@ page import="com.mvp.semi.movie.model.vo.Movie" %>
<%@ page import="com.mvp.semi.ca.review.model.vo.Review" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%	
		String contextPath = request.getContextPath();
    List<Movie> list = (List<Movie>)request.getAttribute("list");
    List<Review> review = (List<Review>)request.getAttribute("review");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=contextPath%>/views/movieMain/css/comparePage.css">



</head>
<body>
		
		<!-- Header, Nav start -->
    <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
		
		
		<!-- body부 시작 -->
		
		<div id="main">
	
	    <div id="result-text"> <!-- result-text div 시작 -->
	      <p>
	       비교어쩌고 저쩌고 아무나 잘써주세요^^🥳
	      </p>
	    </div> <!-- result-text div 끝 -->
			
			
	      <div id="compare-list">
	      <% for(Movie b : list){ %>
	      <div id="compare-list-movie">
	        <img src="../DG/assets/image/logo/delete_logo.png" style="margin-top: 10px; float: right; margin-right: 10px;">
	        <img src="<%= contextPath + b.getTitlePath() %>" id="movie-mainimage" style="width:200px; height:284px;" 
    								 onclick="window.location.href='<%= contextPath %>/showDetail.sd?movieNo=<%= b.getMovieNo() %>';">
	        <hr style="border: 1px solid #ffffff30; width: 270px;">
	        <p style="height:70px" id="movie-title"> <%=b.getMovieTitle() %></p>
	        
	
	        <div id="movie-content"> <!-- movie-content div 시작 -->   
	        <div id="movie-content-top"> <!-- movie-content-top div 시작 -->
	           <div>
	             <p class="p-title">감독</p>
	             <p class="p-content"><%=b.getDirector() %></p>
	           </div>
	           <div>
	             <p class="p-title">배우</p>
	             <p class="p-content" style="height:30px"><%=b.getActor() %></p>
	           </div>
	           <div>
	             <p class="p-title">장르</p>
	             <p class="p-content"><%=b.getGenre() %></p>
	           </div>
	           <div>
	             <p class="p-title">재생시간</p>
	             <p class="p-content"><%=b.getPlayTime() %>분</p>
	           </div>
	           <div>
	             <p class="p-title">연령등급</p>
	             <p class="p-content"><%=b.getAgeLv() %></p>
	           </div>
	           <div>
	             <p class="p-title">제작국가</p>
	             <p class="p-content"><%=b.getCountry() %></p>
	           </div>
	           <div>
	             <p class="p-title">개봉일</p>
	             <p class="p-content"><%=b.getOpenDate() %></p>
	           </div>
	           <div>
	             <p class="p-title">관객수</p>
	             <p class="p-content"><%=b.getAudienceCount() %>만명</p>
	           </div>
	         </div> <!-- movie-content-top div 끝 -->
	
	          <div id="movie-content-bottom" style="height:800px"> <!-- movie-content-bottom div 시작 -->
	            <div id="rating">
	            
	              <p style="margin-bottom: 4px;">평점</p>
	              
	              <div id="rating-list">
	                <div class="mvp-rating">
	                  <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
	                    <div style="height: 24px; text-align: center;"><span>무비픽 평점</span></div>
	                      <div>
	                        <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
	                        <span><%=b.getGrade() %></span>
	                      </div>
	                  </div>
	                </div>
	                <div class="naver-rating">
	                  <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
	                    <div style="text-align: center;"><span style="color: #33F833;">네이버</span>&nbsp;<span>평점</span></div>
	                    <div>
	                      <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
	                      <span>0.00</span>
	                    </div>
	                  </div>
	                </div>
	                
	              </div> <!-- rating-list div 끝 -->
	            </div> <!-- rating div 끝 -->
	            
	            
							
						<div id="mvp-review" style="height:100px">
						  <span style="font-size: 22px;">무비픽 관련 리뷰</span>
						  <div class="review-list" >
						    <% 
						      boolean hasReview = false; // 리뷰가 있는지 확인하는 플래그
						      for (Review r : review) { 
						        if (r != null && r.getMovieNo() == b.getMovieNo()) { // 영화 번호로 리뷰 필터링
						          hasReview = true; // 리뷰가 존재함을 표시
						    %>
						          <div style="margin-top: 8px;"><%= r.getReviewContent() %></div>
						          <a href="#" style="color: #E7F33F; margin-bottom: 33px;">더보기</a>
						    <% 
						        } // if문 끝
						      } // for문 끝
						
						      // 리뷰가 없는 경우 처리
						      if (!hasReview) { 
						    %>
						        <div style="margin-top: 8px;">리뷰가 없습니다</div>
						    <% 
						      } 
						    %>
						  </div>
						</div>
	            	
	
	            <div id="introduce">
	              <span style="font-size: 25px;">소개</span>
	              <div style="margin-top: 8px;"><%=b.getMovieContent() %></div>
	            </div>
	          </div> <!-- movie-content-bottom div 끝 -->
	        </div> <!-- movie-content div 끝 -->   
	      </div> <!-- compare-list-movie div 끝 -->
	      <% } %>
	     </div> <!-- compare-list div 끝 -->
   </div> <!-- main div div 끝 -->   
  
  	<!-- body부 종료 -->
  	
 			 <!-- Footer start -->
  		 <%--  <%@ include file="/views/common/footer.jsp" %> --%>
 			 <!-- Footer end -->
  	
</body>
</html>