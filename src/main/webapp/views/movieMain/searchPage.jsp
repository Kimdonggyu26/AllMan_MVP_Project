<%@page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.mvp.semi.common.model.vo.PageInfo"%>
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
		String searchData = (String) request.getAttribute("searchData"); //Ajax를 위한 데이터
	%>

	<link rel="stylesheet"href="<%=contextPath%>/views/movieMain/css/mainPage.css">

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
			</div>
			<!-- sidebar div 끝 -->
		</div>
		<!-- sidebar div 끝 -->

			<div>
			
			</div>
		
		<!-- 검색결과 없음 출력 -->
			<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">
				<h1 id="noSearch"></h1>
			</div>

				
				<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">
					<div id="text" style="display: flex; flex-direction: row;">
						<p>상영 영화</p>
						<div
							style="display: flex; flex-direction: row; margin-left: 55%; font-size: 2rem;">
							<div style="display: flex; align-items: center; <%=pi.getCurrentPage() == 1 ? "disabled" : "" %>">
								<a href="<%=contextPath%>/movieSearch.ms?page=<%=pi.getCurrentPage()-1%>"><i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i></a>
							</div>
							<div style="display: flex; align-items: center; margin-left: 10px;">
								<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>
							</div>
						</div>
					</div>
					
					<div id="movie1" style="display: flex; flex-direction: row;">
								<% for(Movie mv : list){ %>
								<% int count = 0; %>
									<% if(pi.getListCount() % 5 == 0){ %>
									<div>
										<div id="movie1-top">
											<div class="movie1-list">
												<div class="movie-image">
													<img src="<%=contextPath + mv.getTitlePath()%>">
												</div>
												<div class="movie-info">
													<div style="display: flex; align-items: center;">
														<table
															style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">
															<tr>
																<td style="color: white; font-weight: 900; font-size: 13px;"><%=mv.getTitlePath() %></td>
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
							<div
								style="display: flex; flex-direction: row; margin-left: 55%; font-size: 2rem;">
								<div style="display: flex; align-items: center;">
									<i class="fa-solid fa-circle-chevron-left"></i>
								</div>
								<div
									style="display: flex; align-items: center; margin-left: 10px;">
									<i class="fa-solid fa-circle-chevron-left"
										style="transform: scaleX(-1);"></i>
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
						</div>
						<!-- movie2-bottom div 끝 -->
					</div>
					<!-- movie2 div 끝 -->
				</div>
			</div>
			<!-- main div 끝-->


	<!-- body부 종료 -->
</body>

<script>

$(function(){
	fnAjaxSearch(1,1);
})

	function fnAjaxSearch(showPage, ottPage) { // 영화 리스트
		const $searchData = "<%=searchData%>"; //검색
		$.ajax({
			url: '<%=request.getContextPath()%>/movieSearch.ms',
			data: {
				search: $searchData,
				showPage: showPage,
				ottPage: ottPage
			},
			success: function(res){
				// {showList:[{},{}], showPi:{}, ottList:[{}, {}], ottPi:{}}  
				// 응답받아야되는 정보 : 상영영화list, 상영영화pi, ott영화list, ott영화pi
				// res.showList => 상영영화list
				// res.ottList => ott영화list
				
				
				
				if(res.showList.length == 0 && res.ottList.length == 0){
						// 검색결과 없음보여지는 요소작업  - id값 noSearch
						$('#noSearch').html("검색결과를 찾지 못했어요.");
				}else {
					
				 if(res.showList.length != 0){
					 // 상영영화 목록 요소 작업
					 for(let i=0; let<배열전체){
						 
						 if(i == 0 || i == 5) {
							 <div id='movie1-top | movie1-bottom'>
							 
							 
							 
						 }
						 
						 <div id='movie-list'>
						 	영화요소
						 </div>
						 	
						 if(i == 4 || 마지막인덱스일 경우){
							 <botto/div>
						 }
						 
					 }
				 }
				 
				 if(res.ottList.length != 0){
					 // ott영화 목록 요소 작업 
						for(let i=0; let<배열전체){
						 
						if(i가 0또는 5일 경우) {
							 <div id='movie1-top | movie1-bottom'>
							 
							 
							 
						}
						 
						<div id='movie-list'>
							영화요소
						</div>
						 	
						if(i가 4 또는 마지막인덱스일 경우){
						 </div>
						}
						 
					}
				}
				 
			}
				
				만들어진 요소 div에 뿌리기
				*/
				
				
				
				console.log(res);
				
				if(res == null){
				//버튼 삭제?
				//상영 영화 or ott 중 없는 영화는 안보이게
				}else{
					//영화 리스트?
				}
				
				
			},
			error: function(){
				console.log('영화 검색 ajax 통신 실패');
			}	
		})
	}

</script>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp"%>
<!-- Footer end -->
</html>