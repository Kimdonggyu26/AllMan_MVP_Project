<%@ page import="java.util.List" %>
<%@ page import="com.mvp.semi.user.model.vo.User"%>
<%@ page import="com.mvp.semi.movie.model.vo.Movie" %>
<%@ page import="com.mvp.semi.board.model.vo.Board" %>
<%@ page import="com.mvp.semi.cs.inquiry.model.vo.Inquiry" %>
<%@ page import="com.mvp.semi.board.model.service.TBoardService" %>
<%@ page import="com.mvp.semi.board.model.service.FBoardService" %>
<%@ page import="com.mvp.semi.cs.inquiry.model.service.InquiryService" %>
<%@ page import="com.mvp.semi.movie.model.service.MovieService" %>
<%@ page import="com.mvp.semi.board.model.service.TBoardService" %>
<%@ page import="com.mvp.semi.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
</head>



<%@ include file="/views/common/header.jsp" %> 
<style>
body {
    background-color: #131313;
    font-family: 'pretandard';
    margin: 0;
    padding: 0;
    color: white;
}

.container {
    width: 1270px;
    margin: 0 auto;
    padding: 20px;
    height: 1580px;
}


.mypage {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.mypage img {
    border-radius: 50%;
    width: 100px;
    height: 100px;
}

.mypage-info {
    margin-left: 20px;
}

.mypage-info h2 {
    margin: 0;
    font-size: 24px;
}

.mypage-info .button {
    background-color: #F33F3F;
    padding: 5px 10px;
    color: white;
    border-radius: 5px;
    margin-top: 10px;
    cursor: pointer;
}

.mypage-info .button:hover {
    background-color: #cc0000;
}
.favorite-section hr{
    width: 1100px;
    margin-left: 0;
}
.favorite-section {
    margin-bottom: 20px;
    width: 1270px;
}

.favorite-section h3 {
    margin-bottom: 10px;
    font-size: 20px;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 10px;
}

.grid-item {
    background-color: #555;
    height: 150px;
    border-radius: 5px;
}

.grid-item:last-child {
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}

.grid-item:last-child::after {
    content: '>';
    font-size: 24px;
    color: white;
}

.post-section, .inquiry-section {
    margin-bottom: 20px;
}

.post-section h3, .inquiry-section h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

.list-container {

    padding: 10px;
    border-radius: 5px;
}

.list-item {
    padding: 10px;
    background-color: #444;
    margin-bottom: 5px;
    border-radius: 5px;
}

.pagination {
    text-align: center;
    margin-top: 10px;
    justify-content: center;
    
}

.pagination span:hover {
    text-decoration: underline;
}
.pagination .page-link {
    color: white; /* 기본 링크 색상을 검정으로 설정 */
    background-color: #131313;
    border: none;
}
hr{
    background-color: white;
}
.title{
     font-size: 50px;
     color : white;
}
#rechange{
    color: gray;
    margin-top: 20px;
}
#like{
    color: #FE7D7D;
    font-size: 40px;
}
a {
    color: inherit;
  font-style: normal;
  color: white;
  text-decoration-line : none;
}
a:link {
  color : white;
  text-decoration: none;
}
a:visited {
  text-decoration: none;
}
a:hover {
  color : white;
  text-decoration: none;
}
a:active {
  color : white;
  text-decoration: none;
}
#logout{
    border:  none;
    margin-left: 1000px;
    background-color: red;
    color: white;
}
</style>
<%
    // 로그인된 사용자 정보 가져오기
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // tBoards 리스트 가져오기
    
    List<Board> board = (List<Board>) request.getAttribute("board");
    List<Inquiry> inquiries = (List<Inquiry>)request.getAttribute("inquiries");
    PageInfo pi = (PageInfo) request.getAttribute("pi");
		PageInfo po = (PageInfo) request.getAttribute("po");
%>

<!-- body 시작부 -->
<body>
		<form action="<%= contextPath %>/mypage.us" method="post">
    <div class="container">
        <div class="title">마이페이지</div> 
        <button type="button" id="logout"><a href="<%=contextPath%>/logout.us">로그아웃</a></button>
        <hr>
        <div class="mypage">
            <img src="<%=contextPath + loginUser.getFilePath() %>" > 
            <div class="mypage-info">
                <h2 id="like"><%= user.getUserNick() %></h2>
                <div class="button"><a href="<%= contextPath %>/taste.t0">취향다시분석하기</a></div>
                <div><a href="<%=contextPath%>/modifyuser.us" id="rechange">회원정보 수정</a></div>
            </div>
        </div>
    
         <div class="post-section">
            <h3>나의 게시글</h3>
            <hr>
   		        <% if (board != null && board.size() > 0) { %>
    			<% for (Board b : board) { %>
        <div class="list-item" style="overflow: hidden;"> 
            <a href="<%= contextPath %>/detail.tbo?no=<%= b.getBoardNo() %>">
                <span style="float: left;"><%= b.getBoardTitle() %></span> 
                <span style="float: right;"><%= b.getRegistDate() %></span>
            </a>
        
					        </div>
					    <% } %>
					<% } else { %>
					    <p>게시글이 없습니다.</p>
					<% } %>

 
 
       <% if (po != null) { %>
        <ul class="pagination">
            <li class="page-item <%= po.getCurrentPage() == 1 ? "disabled" : "" %>">
                <a class="page-link" href="<%= contextPath %>/mypage.us?page2=<%= po.getCurrentPage()-1 %>"> < </a>
            </li>
            <% for (int p = po.getStartPage(); p <= po.getEndPage(); p++) { %>
                <li class="page-item <%= p == po.getCurrentPage() ? "active" : "" %>">
                    <a class="page-link" href="<%= contextPath %>/mypage.us?page2=<%= p %>"><%= p %></a>
                </li>
            <% } %>
          		  <li class="page-item <%= po.getCurrentPage() == po.getMaxPage() ? "disabled" : "" %>">
                <a class="page-link" href="<%= contextPath %>/mypage.us?page2=<%= po.getCurrentPage()+1 %>"> > </a>
           		 </li>
      		  </ul>
		    <% } else { %>
		        
		    <% } %>
				</div>
						    
				        
				<div class="inquiry-section">
				    <h3>문의내역</h3>
				    <hr>
				     <% if (inquiries != null && inquiries.size() > 0) { %>
				      <% for (Inquiry i : inquiries) { %>
				    <div class="list-item" style="overflow: hidden;"> <!-- overflow 속성 추가 -->
				        <a href="<%= contextPath %>/detail.iq?no=<%= i.getInquiryNo() %>" style="display: block;">
				            <span style="float: left;"><%= i.getInquiryTitle() %></span>
				            <span style="float: right;"><%= i.getRegistDate() %></span>
				        </a>
				    </div>
							<% } %>
				    <% } else { %>
				        <p>문의내용이 없습니다.</p>
				    <% } %> 
				</div>

                <% if (pi != null) { %>
        <ul class="pagination">
            <li class="page-item <%= pi.getCurrentPage() == 1 ? "disabled" : "" %>">
                <a class="page-link" href="<%= contextPath %>/mypage.us?page=<%= pi.getCurrentPage()-1 %>"> < </a>
            </li>
            <% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
                <li class="page-item <%= p == pi.getCurrentPage() ? "active" : "" %>">
                    <a class="page-link" href="<%= contextPath %>/mypage.us?page=<%= p %>"><%= p %></a>
                </li>
            <% } %>
          		  <li class="page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>">
                <a class="page-link" href="<%= contextPath %>/mypage.us?page=<%= pi.getCurrentPage()+1 %>"> > </a>
           		 </li>
      		  </ul>
		    <% } else { %>
		        
		    <% } %>

        </div>
    </div>
    </form>
<!-- body부 종료 -->

		 <%@ include file="/views/common/footer.jsp" %>
	<script>
    let currentPage = 1;
    const maxPage = 5;  // 서버에서 받아와야 할 최대 페이지 수

    function loadPreviousPage() {
        if (currentPage > 1) {
            currentPage--;
            fetchMovies(currentPage);
        }
    }

    function loadNextPage() {
        if (currentPage < maxPage) {
            currentPage++;
            fetchMovies(currentPage);
        }
    }

    function fetchMovies(page) {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `/mypage/us?ottPage=${page}`, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const movies = JSON.parse(xhr.responseText);
                displayMovies(movies);
            }
        };
        xhr.send();
    }

    function displayMovies(movies) {
        for (let i = 0; i < movies.length; i++) {
            document.getElementById(`ott-item-${i + 1}`).innerHTML = `
                <img src="${movies[i].posterPath}" alt="${movies[i].title}" style="width: 100%; height: 100%;">
                <p>${movies[i].title}</p>`;
        }
    }

    // 첫 페이지 로드
    window.onload = function () {
        fetchMovies(currentPage);
    };
</script>

</body>




</html>