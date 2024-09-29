<%@page import="java.util.Map"%>
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
						<button type="button" class="btn btn-secondary main-hashtag"value="액션">액션</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="crime">범죄</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="sf">SF</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="comedy">코미디</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="slapstick">슬랩스틱</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="romance">로맨스</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="musical">뮤지컬</button>
					</div>
					<div class="genre-bottom">
						<button type="button" class="btn btn-secondary main-hashtag"value="thriller">스릴러</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="horror">공포</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="war">전쟁</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="sports">스포츠</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="fantasy">판타지</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="music">음악</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="melo">멜로</button>
					</div>
				</div>
				<!-- genre div 끝 -->

<!-- sidebar div 시작 -->
		<div style="width: 310px; height: 2361px; float: left;">
			<div id="sidebar">
				<%@ include file="/views/common/basket.jsp"%>
			</div>
			<!-- sidebar div 끝 -->
		</div>
<!-- sidebar div 끝 -->

			<!-- 상단 검색 결과 섹션 -->					
			<div id="printShowMovieList"></div>
				<!-- 검색결과 없음 출력 -->
			<div id="ShwoNoSearch"></div>
			
			<div id="printOTTMovieList"></div>
			<div id="OTTNoSearch"></div>
	</div><!-- main div 끝-->		 


<!-- body부 종료 -->
</body>
	
<script>
	//장르 선택 값
	var result = "";	
	  document.querySelectorAll('.main-hashtag').forEach(button => {
	      button.addEventListener('click', function() {
	        result = this.value;
	        console.log(result);  // 클릭한 버튼의 value 값 출력
	        const url = "https://example.com"; // 열고자 하는 링크
	        window.location.href = "http://localhost:9999/mvp/searchPage.mv?search=" + result;
	      });
	  });
	  
  $(function(){
		fnAjaxShowSearch(1);
		fnAjaxOttSearch(1);
	})	  



	// 상영 리스트
	function fnAjaxShowSearch(showPage) { 
	    $.ajax({
	        url: '<%=contextPath%>/showMainList.ml',
	        data: {
	            showPage: showPage,
	        },
	        success: function(res) {
	            console.log(res);
	            
	            let h1El = ""; // 검색결과 없음 담기 위한 변수 
	            let divEl = ""; // 영화 리스트를 담기 위한 변수
	            
	            var r = res.movieList; // 영화 데이터 
	            var p = res.pageInfo; // 페이징
	            
	            let count = 0;

	            if (r.length == 0) { // 추후에 OTT 작업후 && res.ottList.length == 0 추가
	                console.log('결과 없음');
	                
	                h1El += '<div style="width: 1561px; float: right; margin-top: 34px;">'
	                    + '<div id="text">'
	                    + '<p>상영 영화</p>'
	                    + '</div>'
	                    + '<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">'
	                    + '<h1>텅....이거 출력되면 망한거임</h1>'
	                    + '</div>'
	                    + '</div>';
	            } else {
	                if (r.length != 0) {
	                    // 상영영화 목록 요소 작업
	                    divEl += '<div style="width: 1561px; float: right; margin-top: 34px;">'
	                        + '<div id="text" style="display: flex; flex-direction: row;">'
	                        + '<p>상영 영화</p>'
	                        + '<ul style="margin-left: 55%; font-size: 2rem; display: flex; list-style-type: none;">'
	                        + '<li>'
	                        + '<a onclick="fnAjaxShowSearch(' + (p.currentPage == 1 ? p.maxPage : (p.currentPage - 1)) + ')">'
	                        + '<i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i>' 
	                        + '</a>'
	                        + '</li>'
	                        + '<li>'
	                        + '<a onclick="fnAjaxShowSearch(' + (p.currentPage == p.maxPage ? 1 : (p.currentPage + 1)) + ')">' 
	                        + '<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>'
	                        + '</a>' 
	                        + '</li>' 
	                        + '</ul>'
	                        + '</div>'
	                        + '<div id="movie1">'; // 전체 movie1
	                    for (let i = 0; i < r.length; i++) {
	                        if (count === 0) {
	                            divEl += '<div id="movie1-top">'; // movie1-top 시작
	                        }
	                        divEl += '<div class="movie1-list">' +  // movie1-list 시작
						    '    <div class="movie-image">' +
						    '        <img src="/mvp'+r[i].titlePath+'">' +  // contextPath에 r[i].titlePath 추가  
						    '    </div>' +
						    '    <div class="movie-info">' +  // movie-info 시작
						    '        <div style="display: flex; align-items: center;">' +  // a 시작
						    '            <table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px; width:130px; table-layout: fixed;">' +
						    '                <tr>' +
						    '                    <td style="color: white; font-weight: 900; font-size: 13px;">'+ r[i].movieTitle +'</td>' +
						    '                </tr>' +
						    '                <tr>' +
						    '                    <td>'+ r[i].openDate +'</td>' +
						    '                </tr>' +
						    '                <tr>' +
						    '                    <td>장르 : '+ r[i].genre +'</td>' +
						    '                </tr>' +
						    '                <tr>' +
						    '                    <td>감독 : '+ r[i].director +'</td>' +
						    '                </tr>' +
						    '            </table>' +
						    '            <i class="fa-regular fa-heart" id="heart" style=""></i>' +  // heart 아이콘
						    '        </div>' +  // a 닫기
						    '        <div style="display: flex;">' +  // b 시작
						    '            <button type="button" class="btn btn-secondary" id="info">영화정보</button>' +
						    '            <button type="button" class="btn btn-danger" id="compare" onclick="fnComparisonAdd(\'' + r[i].movieNo + '\', \'' + r[i].titlePath + '\');">' +  // c 시작
						    '                <img src="assets/image/mainPage/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기' +
						    '            </button>' +  // c 닫기
						    '        </div>' +  // b 닫기
						    '    </div>' +  // movie-info 닫기
						    '</div>';  // movie1-list 닫기

	                        count++; // count 증가

	                        // movie1-top을 닫는 부분
	                        if (count === 5) { // 5개 후 movie1-top 닫기
	                            divEl += '</div>'; // movie1-top 닫기
	                        }

	                        // movie1-bottom을 시작
	                        if (count === 5) { // 5개 후
	                            divEl += '<div id="movie1-bottom">'; // movie1-bottom 시작
	                        }

	                        // movie1-bottom을 닫는 부분
	                        if (count === 10) { // 8개 후 movie1-bottom 닫기
	                            divEl += '</div>'; // movie1-bottom 닫기
	                            count = 0; // count 리셋
	                        }
	                    }
	                    divEl += '</div>'; // movie1 닫기
	                    divEl += '</div>'; // 전체 div 닫기
	                }
	            }
	            $('#ShwoNoSearch').html(h1El);
	            $('#printShowMovieList').html(divEl);
	        },
	        error: function() {
	            console.log('영화 검색 ajax 통신 실패');
	        }
	    });	
	}

	// OTT 리스트
	function fnAjaxOttSearch(ottPage) {
	    $.ajax({
	        url: '<%=contextPath%>/ottSearch.ms',
	        data: {
	            ottPage: ottPage
	        },
	        success: function(res){
	            console.log(res);
	            
	            let h1El = ""; // 검색결과 없음 담기 위한 변수 
	            let divEl = ""; // 영화 리스트를 담기 위한 변수
	            
	            var r = res.ottMovieList; // 영화 데이터 
	            var p = res.ottPageInfo; // 페이징 정보
	            
	            let count = 0;
	
	            if(r.length == 0) {
	                // 검색결과 없음
	                console.log('검색결과 없음');
	                
	                h1El += '<div style="width: 1561px; float: right; margin-top: 34px;">'
	                     +  '<div id="text">'
	                     +  '<p>OTT 영화</p>'
	                     +  '</div>'
	                     +  '<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">'
	                     +  '<h1>일치하는 검색결과가 없어요.</h1>'
	                     +  '</div>'
	                     +  '</div>';
	            } else {
	                if(r.length != 0) {
	                    divEl += '<div style="width: 1561px; float: right; margin-top: 100px;">'
	                          +  '<div id="text" style="display: flex; flex-direction: row;">'
	                          +  '<p>OTT 영화</p>'
	                          +  '<ul style="margin-left: 55%; font-size: 2rem; display: flex; list-style-type: none;">'
	                          +  '<li>'
	                          +  '<a onclick="fnAjaxOttSearch(' + (p.currentPage == 1 ? p.maxPage : (p.currentPage - 1)) + ')">'
	                          +  '<i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i>' 
	                          +  '</a>'
	                          +  '</li>'
	                          +  '<li>'
	                          +  '<a onclick="fnAjaxOttSearch(' + (p.currentPage == p.maxPage ? 1 : (p.currentPage + 1)) +')">' 
	                          +  '<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>'
	                          +  '</a>'
	                          +  '</li>'
	                          +  '</ul>'
	                          +  '</div>'
	                          +  '<div id="movie1">';
	
	                    for (let i = 0; i < r.length; i++) {
	                        if (count === 0) {
	                            divEl += '<div id="movie1-top">';
	                        }
	                        
	                        divEl += '<div class="movie1-list">'
	                              +  '<div class="movie-image">'
	                              +  '<img src="/mvp'+r[i].titlePath+'">'  // r[i].titlePath 추가해야 함
	                              +  '</div>'
	                              +  '<div class="movie-info">'
	                              +  '<div style="display: flex; align-items: center;">'
	                              +  '<table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px; width:130px; table-layout: fixed;">'
	                              +  '<tr>'
	                              +  '<td style="color: white; font-weight: 900; font-size: 13px;">'+ r[i].movieTitle +'</td>'
	                              +  '</tr>'
	                              +  '<tr>'
	                              +  '<td>'+ r[i].openDate +'</td>'
	                              +  '</tr>'
	                              +  '<tr>'
	                              +  '<td>장르 : '+ r[i].genre +'</td>'
	                              +  '</tr>'
	                              +  '<tr>'
	                              +  '<td>감독 : '+ r[i].director +'</td>'
	                              +  '</tr>'
	                              +  '</table>'
	                              +  '<i class="fa-regular fa-heart" id="heart"></i>'
	                              +  '</div>'
	                              +  '<div style="display: flex;">'
	                              +  '<button type="button" class="btn btn-secondary" id="info">영화정보</button>'
	                              +  '<button type="button" class="btn btn-danger" id="compare" onclick="fnComparisonAdd(\'' + r[i].movieNo + '\', \'' + r[i].titlePath + '\');">'
	                              +  '<img src="assets/image/mainPage/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기'
	                              +  '</button>'
	                              +  '</div>'
	                              +  '</div>'
	                              +  '</div>';
	                        
	                        count++;
	                        
	                        if (count === 5) {
	                            divEl += '</div>'; // movie1-top 닫기
	                        }
	                        
	                        if (count === 5) {
	                            divEl += '<div id="movie1-bottom">';
	                        }
	                        
	                        if (count === 10) {
	                            divEl += '</div>'; // movie1-bottom 닫기
	                            count = 0;
	                        }
	                    }
	                    divEl += '</div>'; // movie1 닫기
	                    divEl += '</div>'; // 전체 div 닫기
	                }
	            }
	
	            // 결과를 페이지에 반영
	            $('#OTTNoSearch').html(h1El);
	            $('#printOTTMovieList').html(divEl);
	        },
	        error: function() {
	            console.log('영화 검색 ajax 통신 실패');
	        }
	    });
	}	
	

	function fnComparisonAdd(movieNo, titlePath) {
	    const basketMovie = document.getElementById('basket-movie');

	    // 현재 담긴 영화 개수 체크
	    if (basketMovie.childElementCount >= 3) {
	        alert("최대 3개까지만 담을 수 있습니다."); // 경고 메시지
	        return; // 3개 이상일 경우 함수 종료
	    }

	    // 이미 추가된 영화인지 체크
	    const existingMovies = basketMovie.getElementsByClassName('movie-basket-list');
	    for (let i = 0; i < existingMovies.length; i++) {
	        const existingMovieNo = existingMovies[i].getAttribute('data-movie-no');
	        if (existingMovieNo === movieNo) {
	            alert("이미 추가된 영화입니다."); // 경고 메시지
	            return; // 이미 추가된 경우 함수 종료
	        }
	    }

	    // 영화 이미지 요소 생성
	    const movieItem = document.createElement('div');
	    movieItem.className = 'movie-basket-list';
	    movieItem.setAttribute('data-movie-no', movieNo); // 영화 번호 저장

	    const imgElement = document.createElement('img');
	    imgElement.src = '<%= basketContextPath %>' + titlePath; // 올바른 이미지 경로
	    imgElement.style.marginTop = '15px';
	    imgElement.style.marginBottom = '15px';
	    imgElement.onclick = function() { removeMovie(this); }; // 클릭 시 제거 기능 추가

	    movieItem.appendChild(imgElement);
	    basketMovie.appendChild(movieItem); // movieItem을 basketMovie에 추가

	    updateMovieCount(); // 영화 개수 업데이트
	}
	
	

</script>
	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</html>