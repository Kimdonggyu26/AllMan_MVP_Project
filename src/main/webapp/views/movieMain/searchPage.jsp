<%@page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
<body>
	
	<!-- Header, Nav start -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- Header, Nav end -->
	
	<%
		String searchData = (String)request.getAttribute("searchData");
	  Movie mv = null;
	%>

	<link rel="stylesheet" href="<%= contextPath %>/views/movieMain/css/mainPage.css">

	<!-- body부 시작 -->

	<div id="main">
		<div id="genre">
			<div class="genre-top">
				<button type="button" class="btn btn-secondary main-hashtag"
					value="action">액션</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="crime">범죄</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="sf">SF</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="comedy">코미디</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="slapstick">슬랩스틱</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="romance">로맨스</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="musical">뮤지컬</button>
			</div>
			<div class="genre-bottom">
				<button type="button" class="btn btn-secondary main-hashtag"
					value="thriller">스릴러</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="horror">공포</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="war">전쟁</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="sports">스포츠</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="fantasy">판타지</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="music">음악</button>
				<button type="button" class="btn btn-secondary main-hashtag"
					value="melo">멜로</button>
			</div>
		</div>
		<!-- genre div 끝 -->

		<script>
			document.querySelectorAll('.main-hashtag').forEach(button => {
			    button.addEventListener('click', function() {
			      const result = this.value;
			      console.log(result);  // 클릭한 버튼의 value 값 출력
			    });
			  });
		</script>

			<!-- sidebar div 시작 -->
			<div style="width: 310px; height: 2361px; float: left;">
			   <div id="sidebar">
				 <%@ include file="/views/common/basket.jsp"%>
			   </div> <!-- sidebar div 끝 -->
			</div>
			<!-- sidebar div 끝 -->
			
			
  	<%if(true) {%>
  		<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">
					<div id="text" style="display: flex; flex-direction: row;">
						<p>상영 영화</p>
						<div style="display: flex; flex-direction: row; margin-left: 55%; font-size: 2rem; ">
							<div style="display: flex; align-items: center;">
								<i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i>
							</div>
							<div style="display: flex; align-items: center; margin-left: 10px;">
								<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>	
							</div>
						</div>	
					</div>


					<div id="movie1" style="display: flex; flex-direction: row;">
							<div>
								<div id="movie1-top">
									<div class="movie1-list">
										<div class="movie-image">
											<!--<img src="<%=contextPath + "#" %>">-->
											<img src="" alt="">
										</div>
										<div class="movie-info">
											<div style="display: flex; align-items: center;">
												<table
												style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
													<tr>
														<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
															할부지</td>
														</tr>
													<tr>
														<td>2024.09.04</td>
													</tr>
													<tr>
														<td>장르 : 다큐멘터리, 애니메이션</td>
													</tr>
													<tr>
														<td>감독 : 심형준</td>
													</tr>
												</table>
												<i class="fa-regular fa-heart" id="heart"></i>
											</div>
											<div style="display: flex;">
												<button type="button" class="btn btn-secondary" id="info">영화정보</button>
												<button type="button" class="btn btn-danger" id="compare">
													<img src="../DG/assets/image/logo/download_logo.png"
													style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
												</button>
											</div>
										</div>
								</div>
							</div>
						<!-- movie1-top div 끝 -->
						<div id="movie1-bottom">
							<div class="movie1-list">

								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
										style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
											</button>
									</div>
								</div>
							</div>
						</div>
						<!-- movie1-bottom div 끝 -->
					</div>
				</div>
					<!-- movie1 div 끝 -->
		
					<div id="text">
						<div style="display: flex; flex-direction: row; margin-top: 116px">
								<p>OTT 영화</p>
								<div style="display: flex; flex-direction: row; margin-left: 55%; font-size: 2rem; ">
									<div style="display: flex; align-items: center;">
										<i class="fa-solid fa-circle-chevron-left"></i>
									</div>
									<div style="display: flex; align-items: center; margin-left: 10px;">
										<i class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1);"></i>	
									</div>
								</div>	
						</div>
					</div>
		
					<div id="movie2">
						<div id="movie2-top">
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- movie2-top div 끝 -->
						<div id="movie2-bottom">
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
							<div class="movie2-list">
								<div class="movie-image">
									<img src="./assets/image/movie_image/movie_image_2.png">
								</div>
								<div class="movie-info">
									<div style="display: flex; align-items: center;">
										<table
											style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
											<tr>
												<td style="color: white; font-weight: 900; font-size: 13px;">안녕,
													할부지</td>
											</tr>
											<tr>
												<td>2024.09.04</td>
											</tr>
											<tr>
												<td>장르 : 다큐멘터리, 애니메이션</td>
											</tr>
											<tr>
												<td>감독 : 심형준</td>
											</tr>
										</table>
										<i class="fa-regular fa-heart" id="heart"></i>
									</div>
									<div style="display: flex;">
										<button type="button" class="btn btn-secondary" id="info">영화정보</button>
										<button type="button" class="btn btn-danger" id="compare">
											<img src="../DG/assets/image/logo/download_logo.png"
												style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- movie2-bottom div 끝 -->
					</div>
					<!-- movie2 div 끝 -->
			</div>
	</div>
			<!-- main div 끝-->
	
	 <% } else {%>
	 				<div style="display: flex; height: 500px; align-items: center; ">
						<h1 style="margin-left: 30%">검색결과가 없습니다.</h1>	      
	 				</div>
	  <% }%>

	<!-- body부 종료 -->
</body>

	$(function(){
			fnAjaxSearch();
		})
	<script>
	
	
		function fnAjaxSearch() {
			
			const $inputData = $(searchData)
			
			$.ajax({
				url: '<%= contextPath%>/movieHeaderSearch.ms',
				data: {search: $inputData.val()},
				success: function(res){
					console.log(res);
				},
				error: function(){
					console.log('영화 검색 ajax 통신 실패');
				}	
			
			})
		}
		
		const movies = [
		    { title: "안녕, 할부지", date: "2024.09.04", genre: "다큐멘터리, 애니메이션", director: "심형준", imgSrc: "movie1.jpg" },
		    { title: "영화 2", date: "2024.09.05", genre: "드라마", director: "감독 2", imgSrc: "movie2.jpg" },
		    { title: "영화 3", date: "2024.09.06", genre: "액션", director: "감독 3", imgSrc: "movie3.jpg" },
		    { title: "영화 4", date: "2024.09.07", genre: "코미디", director: "감독 4", imgSrc: "movie4.jpg" },
		    { title: "영화 5", date: "2024.09.08", genre: "공포", director: "감독 5", imgSrc: "movie5.jpg" },
		    { title: "영화 6", date: "2024.09.09", genre: "액션", director: "감독 6", imgSrc: "movie6.jpg" },
		];

		let currentIndex = 0; // 현재 표시된 영화의 시작 인덱스

		function renderMovies() {
		    const movieList = document.getElementById("movie1-list");
		    movieList.innerHTML = ""; // 기존 영화 목록 제거

		    for (let i = currentIndex; i < currentIndex + 5 && i < movies.length; i++) {
		        const movie = movies[i];
		        const movieItem = document.createElement("div");
		        movieItem.className = "movie-item";
		        movieItem.style.display = "flex"; // flexbox 사용

		        movieItem.innerHTML = `
		            <div class="movie-image">
		                <img src="${movie.imgSrc}" alt="${movie.title}">
		            </div>
		            <div class="movie-info" style="margin-left: 12px;">
		                <table>
		                    <tr><td style="color: white; font-weight: 900; font-size: 13px;">${movie.title}</td></tr>
		                    <tr><td>${movie.date}</td></tr>
		                    <tr><td>장르 : ${movie.genre}</td></tr>
		                    <tr><td>감독 : ${movie.director}</td></tr>
		                </table>
		                <i class="fa-regular fa-heart" id="heart"></i>
		                <div style="display: flex; margin-top: 10px;">
		                    <button type="button" class="btn btn-secondary" id="info">영화정보</button>
		                    <button type="button" class="btn btn-danger" id="compare">
		                        <img src="../DG/assets/image/logo/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
		                    </button>
		                </div>
		            </div>
		        `;
		        movieList.appendChild(movieItem);
		    }
		}

		// 왼쪽 화살표 클릭 시
		document.getElementById("left-arrow").addEventListener("click", () => {
		    currentIndex -= 5; // 인덱스를 감소
		    if (currentIndex < 0) {
		        currentIndex = movies.length - 5; // 첫 페이지로 돌아가기
		    }
		    renderMovies();
		});

		// 오른쪽 화살표 클릭 시
		document.getElementById("right-arrow").addEventListener("click", () => {
		    currentIndex += 5; // 인덱스를 증가
		    if (currentIndex >= movies.length) {
		        currentIndex = 0; // 마지막 페이지 이후 첫 페이지로 돌아가기
		    }
		    renderMovies();
		});

		// 초기 영화 목록 렌더링
		renderMovies();

		
</script>

<!-- $(function(){
		fnAjaxSearch();
	})강의 13번 1시간 27분 38초
 -->

<!-- Footer start -->
<%@ include file="/views/common/footer.jsp"%>
<!-- Footer end -->
</html>