<%@page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
  Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
  Movie mv = null;

  if (map != null) {
      mv = (Movie) map.get("mv");
  }
%>  



	
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
			
			
  <%if (mv != null) {	%>
  		<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">
			<div id="text">
				<p>상영 영화</p>
			</div>
			<div id="movie1">
				<div id="movie1-top">
					<div class="movie1-list">
						<div class="movie-image">
							<img src="<%=contextPath + mv.getTitlePath() %>">
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
	
	 <% } else {
	      
	  }%>
	
			



	<!-- body부 종료 -->



</body>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp"%>
<!-- Footer end -->
</html>