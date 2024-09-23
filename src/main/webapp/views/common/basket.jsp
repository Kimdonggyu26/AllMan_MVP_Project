<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String basketContextPath = request.getContextPath(); // "/mvp"
	//Member loginUser = (Member)session.getAttribute("loginUser");
	// 해당 구문이 실행되는 시점 
	// 로그인 요청 전 페이지 로드시 : null
	// 로그인 성공 후 페이지 로드시 : 조회된 데이터가 담겨있는 Member객체
%>

<a id="compare-link">영화비교(#0)</a> 
<div id="basket">
  <div id="basket-movie">
    <div class="movie-basket-list">
      <img src="<%= basketContextPath%>/assets/image/mainPageImg/movie_image/movie_image_2.png" style="margin-top: 20px;" onclick="removeMovie(this)">
    </div>
    <hr style="border: 1px solid #4a4a4a; width: 127px;">
  </div> <!-- basket-movie div 끝 -->
</div>

<script>
  function updateMovieCount() {
    const movieItems = document.querySelectorAll('.movie-basket-list');
    const count = movieItems.length; // 현재 영화 개수
    document.getElementById('compare-link').innerText = `영화비교(#${count})`; // a 태그 텍스트 업데이트
  }

  function removeMovie(imageElement) {
    const movieItem = imageElement.closest('.movie-basket-list'); // 클릭한 이미지의 부모 div
    movieItem.parentNode.removeChild(movieItem); // 해당 div 삭제
    updateMovieCount(); // 영화 개수 업데이트
  }

  // 페이지 로드 시 영화 개수 업데이트
  window.onload = updateMovieCount;
</script>

<!-- BootStrap버전 -->
<!-- <button type="button" class="btn btn-danger" style="width: 255px; height: 42px; border-radius: 10px; font-size: 16px; margin-top: 30px;">비교하기</button> -->
<button style="background-color: #F33F3F; color: white; font-size: 16px; border-radius: 10px; width: 255px; height: 42px; margin-top: 30px; margin-bottom: 30px; border: 0;">비교하기</button>


<script>
  function removeMovie(element) {
      const movieBasket = document.getElementById('basket-movie');
      const movieCount = movieBasket.children.length;

      // 영화 이미지 제거
      movieBasket.removeChild(element);
      
      // 영화 수가 3개 이하일 경우 추가 가능하도록 로직 추가 가능
      // 예: 추가할 수 있는 버튼이 있는 경우 이 곳에서 관리
  }
</script>