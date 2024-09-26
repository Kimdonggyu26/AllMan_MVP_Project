<%@page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.mvp.semi.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String searchData = (String) request.getAttribute("searchData"); //Ajax를 위한 데이터
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

		
	<!-- 검색결과 없음 출력 -->
		<div id="noSearch"></div>
		<!-- 
				<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">
					<div id="text" style="display: flex; flex-direction: row;">
						<p>상영 영화</p>
						<div style="display: flex; flex-direction: row; margin-left: 55%; font-size: 2rem;">
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
				-->					

			<!-- 상단 검색 결과 섹션 -->					
			<div id="printMovieList">
				
			</div>
			
	</div><!-- main div 끝-->		 


<!-- body부 종료 -->
</body>
	
	<script>
	
		$(function(){
			fnAjaxShowSearch(1,1);
		})
	
		//상영 리스트
		function fnAjaxShowSearch(showPage, ottPage) { 
			const $searchData = "<%=searchData%>"; //검색
			
			$.ajax({
				url: '<%=contextPath%>/showSearch.ms',
				data: {
					search: $searchData,
					showPage: showPage,
					ottPage: ottPage
				},
				success: function(res){
					// {ottList:[{}, {}], ottPi:{}}  
					// 응답받아야되는 정보 : ott영화list, ott영화pi
					// res.showList => 상영영화list
					// res.ottList => ott영화list
					console.log(res);
					
					let h1El = ""; //검색결과 없음 담기 위한 변수 
					let divEl = "";//영화 리스트를 담기 위한 변수
					
					var r = res.movieList; // 영화 데이터 
					var pi = res.pageInfo; // 페이징
					
					let count = 0;
			
					if(r.length == 0){// 추후에 OTT 작업후  && res.ottList.length == 0 추가
						// 검색결과 없음보여지는 요소작업  - id값 noSearch
						console.log('검색결과 없음');
					
										
						h1El += '<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">'
							 + 		'<h1>일치하는 검색결과가 없어요.</h1>'
							 +  '</div>';
					}else {
						 if(r.length != 0){
							 // 상영영화 목록 요소 작업
							divEl  += '<div style="width: 1561px; height: 2361px; float: right; margin-top: 34px;">'//전체 div
									    +   '<div id="text">'
									    +       '<p>상영 영화</p>'
									    +   '</div>'
									    +   '<div id="movie1">';//전체 movie1
									    for (let i = 0; i < r.length; i++) {
										    if (count == 0 || count == 5) {
										        if (count == 0) {
										            divEl += '<div id="movie1-top">'; //movie1-top
										        } else {
										            divEl += '<div id="movie1-bottom">'; //movie1-bottom
										        }
										        count++;
										    }
									   		  divEl += '<div class="movie1-list">'  //movie1-list
											        +   '<div class="movie-image">'
											        +       '<img src="=contextPath + r.titlePath ">'
											        +   '</div>'
											        +   '<div class="movie-info">' // movie-info
											        +       '<div style="display: flex; align-items: center;">' // a
											        +           '<table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px;">'
											        +               '<tr>'
											        +                   '<td style="color: white; font-weight: 900; font-size: 13px;">안녕,할부지</td>'
											        +               '</tr>'
											        +               '<tr>'
											        +                   '<td>2024.09.04</td>'
											        +               '</tr>'
											        +               '<tr>'
											        +                   '<td>장르 : 다큐멘터리, 애니메이션</td>'
											        +               '</tr>'
											        +               '<tr>'
											        +                   '<td>감독 : 심형준</td>'
											        +               '</tr>'
											        +           '</table>'
											        +           '<i class="fa-regular fa-heart" id="heart"></i>'
											        +		'<div>'// a
											        +    '</div>'// movie-info 닫기
											        +       '<div style="display: flex;">'//b
											        +           '<button type="button" class="btn btn-secondary" id="info">영화정보</button>'
											        +           '<button type="button" class="btn btn-danger" id="compare">'//c
											        +               '<img src="../DG/assets/image/logo/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기'
											        +           '</button>'//c
											        +       '</div>'//b
									        +  '</div>';// movie1-list 닫기
									        
									        count++; // count 증가
	
										    // movie1-top과 movie1-bottom을 닫는 부분
										    if (count == 4) {
											    divEl += '</div>'; // 마지막 movie1-top 닫기
											}
										   if (count == 5) {
										        divEl += '</div>'; // movie1-bottom 닫기
										        count = 0; // count를 다시 0으로 리셋
										    }
										}
							    divEl += '</div>'; // movie1 닫기
								divEl += '</div>'; // 전체 div 닫기
						}
					}
					$('#noSearch').html(h1El);
					$('#printMovieList').html(divEl);
				},
				error: function(){
					console.log('영화 검색 ajax 통신 실패');
				}
			})	
		}
	
		
		//OTT 리스트
			function fnAjaxOttSearch(showPage, ottPage) {
				const $searchData = "<%=searchData%>"; //검색
	
				
				$.ajax({
					url: '<%=contextPath%>/ottSearch.ms',
					data: {
						search: $searchData,
						showPage: showPage,
						ottPage: ottPage
					},
					success: function(res){
						// {ottList:[{}, {}], ottPi:{}}  
						// 응답받아야되는 정보 : ott영화list, ott영화pi
						// res.showList => 상영영화list
						// res.ottList => ott영화list
								console.log(res);
						
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