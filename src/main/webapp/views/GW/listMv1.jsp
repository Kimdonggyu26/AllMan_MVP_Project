<%@ page import="java.util.List" %> 
<%@ page import="com.mvp.semi.movie.model.vo.Movie" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Movie> list = (List<Movie>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body>

	<!-- Header, Nav start -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- Header, Nav end -->
	<link rel="stylesheet" href="<%=contextPath%>/views/movieMain/css/mainPage.css">

	<!-- body부 시작 -->
	<div id="main">
	<!-- sidebar div 시작 -->
	<div style="width: 310px; height: 2361px; float: left;">
		<div id="sidebar">
				<%@ include file="/views/common/basket.jsp"%>
			</div>
			<!-- sidebar div 끝 -->
		</div>


   <div style="width: 1561px; float: right; margin-top: 34px;">
    <div id="text">
        <p>상영 영화</p>
    </div>

    <div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">
        <h1>상영 영화 목록</h1>
    </div>

    <div id="movie1">
        <%
            // 서버에서 전달받은 영화 목록을 사용하여 HTML을 동적으로 생성
            int count = 0;

            for (Movie movie : list) {
                if (count % 5 == 0) {
                    out.println("<div id='movie1-top'>"); // movie1-top 시작
                }
        %>
                <div class="movie1-list">
                    <div class="movie-image">
                        <img src="<%= contextPath + movie.getTitlePath() %>" alt="영화 포스터">
                    </div>
                    <div class="movie-info">
                        <div style="display: flex; align-items: center;">
                            <table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px; width:130px; table-layout: fixed;">
                                <tr>
                                    <td style="color: white; font-weight: 900; font-size: 13px;"><%= movie.getMovieTitle() %></td>
                                </tr>
                                <tr>
                                    <td><%= movie.getOpenDate() %></td>
                                </tr>
                                <tr>
                                    <td>장르: <%= movie.getGenre() %></td>
                                </tr>
                                <tr>
                                    <td>감독: <%= movie.getDirector() %></td>
                                </tr>
                            </table>
                            <i class="fa-regular fa-heart" id="heart" style=""></i>
                        </div>
                        <div style="display: flex;">
                            <button type="button" class="btn btn-secondary" onclick="location.href='<%= contextPath %>/showDetail.sd?movieNo=<%= movie.getMovieNo() %>'">영화정보</button>
                            <button type="button" class="btn btn-danger" onclick="fnComparisonAdd('<%= movie.getMovieNo() %>', '<%= movie.getTitlePath() %>');">
                                <img src="<%= contextPath %>/assets/image/mainPage/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기
                            </button>
                        </div>
                    </div>
                </div>
        <%
                count++;
                if (count % 5 == 0) {
                    out.println("</div>"); // movie1-top 닫기
                }
            }
        %>
    </div>
</div>
</div><!-- main div 끝-->		 

<script>
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
	    imgElement.src = '<%= contextPath %>' + titlePath; // 올바른 이미지 경로
	    imgElement.style.marginTop = '15px';
	    imgElement.style.marginBottom = '15px';
	    imgElement.onclick = function() { removeMovie(this); }; // 클릭 시 제거 기능 추가

	    movieItem.appendChild(imgElement);
	    basketMovie.appendChild(movieItem); // movieItem을 basketMovie에 추가

	    updateMovieCount(); // 영화 개수 업데이트
	}
</script>

<!-- body부 종료 -->
</body>
</head>
	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</html>