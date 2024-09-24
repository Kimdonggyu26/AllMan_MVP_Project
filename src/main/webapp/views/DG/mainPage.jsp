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

	<!-- body부 시작 -->
	<style>
		@import
			url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css')
			;
		
		#main {
			width: 1920px;
			height: 2500px;
			background-color: #131313;
			margin: auto;
			font-family: pretendard;
		}
		
		#genre {
			width: 674px;
			height: 77px;
			margin: auto;
			margin-top: 28px;
		}
		
		p {
			width: 220px;
			height: 66px;
			color: white;
			font-size: 55px;
			font-weight: bold;
			margin-bottom: 16px;
		}
		
		#movie1 {
			width: 1187px;
			height: 768px;
			margin-top: 6px;
		}
		
		#movie2 {
			width: 1187px;
			height: 768px;
			margin-top: 16px;
		}
		
		.genre-top {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 19px;
		}
		
		.genre-top button {
			padding: 0%;
			width: 80px;
			height: 30px;
			border-radius: 16px;
			font-size: 16px;
		}
		
		.genre-bottom {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 19px;
		}
		
		.genre-bottom button {
			padding: 0%;
			width: 80px;
			height: 30px;
			border-radius: 16px;
			margin-top: 17px;
			font-size: 16px;
		}
		
		.movie1-list {
			width: 182.5px;
			height: 359px;
			background-color: #262626;
			border-radius: 11px;
		}
		
		.movie2-list {
			width: 182.5px;
			height: 359px;
			background-color: #262626;
			border-radius: 11px;
		}
		
		#movie1-top {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 68.5px;
		}
		
		#movie1-bottom {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 68.5px;
			margin-top: 50px;
		}
		
		#movie2-top {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 68.5px;
		}
		
		#movie2-bottom {
			display: flex;
			flex-direction: row;
			justify-content: center;
			gap: 68.5px;
			margin-top: 50px;
		}
		
		.movie1-image {
			width: 182.47px;
			height: 260.02px;
		}
		
		.movie-info {
			width: 182px;
			height: 98px;
		}
		
		.movie-info tr {
			color: rgba(255, 255, 255, 0.61);
			font-size: 8px;
		}
		
		#info {
			width: 92px;
			height: 34px;
			padding: 0%;
			border-top-left-radius: 3px;
			border-top-right-radius: 3px;
			border-bottom-left-radius: 10px;
			border-bottom-right-radius: 1px;
			font-size: 14px;
		}
		
		#compare {
			width: 92px;
			height: 34px;
			padding: 0%;
			border-top-left-radius: 3px;
			border-top-right-radius: 3px;
			border-bottom-left-radius: 1px;
			border-bottom-right-radius: 10px;
			font-size: 14px;
		}
		
		#heart {
			color: white;
			font-size: 23px;
			margin-left: 40px;
		}
		
		body {
			color: white;
			font-family: pretendard;
		}
		
		#sidebar {
			width: 255px;
			height: 670px;
			margin-left: 33px;
			margin-top: 104px;
			position: sticky;
			top: 220px;
		}
		
		#sidebar a {
			font-size: 24px;
		}
		
		#basket {
			width: 255px;
			height: 520px;
			border-radius: 15px;
			background-color: #30303057;
			overflow-y: scroll;
			overflow-x: hidden;
		}
		
		.inner_content {
			height: 25px;
		}
		
		#movie-basket div {
			width: 127px;
			height: 182px;
		}
		
		#basket::-webkit-scrollbar {
			width: 12px;
		}
		
		#basket::-webkit-scrollbar-track {
			background-color: transparent;
		}
		
		#basket::-webkit-scrollbar-thumb {
			border-radius: 3px;
			background-color: gray;
		}
		
		.scroll_box::-webkit-scrollbar-button {
			width: 0;
			height: 0;
		}
		
		#basket-movie {
			width: 127px;
			height: 563px;
			display: flex;
			flex-direction: column;
			gap: 22px;
			margin-left: 64px;
			margin-right: 64px;
		}
		
		#basket-movie img {
			width: 127px;
			height: 182px;
		}
		
		#heart {
			cursor: pointer;
		}
	</style>


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
		<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">
			<div id="text">
				<p>상영 영화</p>
			</div>
			<div id="movie1">
				<div id="movie1-top">
					<div class="movie1-list">
						<div class="movie-image">


							<img src="<%= contextPath %>">

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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
					<div class="movie1-list">
						<div class="movie-image">
							<img src="./assets/image/movie_image/movie_image_1.png">
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
				<!-- movie1-bottom div 끝 -->
			</div>
			<!-- movie1 div 끝 -->

			<div id="text">
				<p style="margin-top: 116px">OTT 영화</p>
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

	<!-- body부 종료 -->



</body>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp"%>
<!-- Footer end -->
</html>