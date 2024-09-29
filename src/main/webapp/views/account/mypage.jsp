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
  color : white;
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
    // 페이지 정보 설정 (예: 1페이지, 한 페이지당 10개의 게시글)
    int currentPage = 1;
    int boardLimit = 10;
		%>
			<%
			PageInfo pi = (PageInfo)request.getAttribute("pi");
			List<Board> list = (List<Board>)request.getAttribute("list");
			%>
    <%// 로그인된 사용자 정보 가져오기
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
        response.sendRedirect("login.jsp"); // 로그인되지 않은 경우 로그인 페이지로 리디렉션
        return;
    
%>

<!-- body 시작부 -->
<body>
		<form action="#" method="post">
    <div class="container">
        <div class="title">마이페이지</div> 
        <button type="submit" id="logout"><a href="<%=contextPath%>/logout.us">로그아웃</a></button>
        <hr>
        <div class="mypage">
            <img src="<%= user.getFilePath() %>" > 
            <div class="mypage-info">
                <h2 id="like"><%= user.getUserNick() %></h2>
                <div class="button"><a href="<%= contextPath %>/analyzeTaste"></a></div>
                <div><a href="<%= contextPath %>/views/account/modifyUser.jsp" id="rechange">회원정보 수정</a></div>
            </div>
        </div>
    
        <div class="favorite-section">
            <h4>즐겨찾기</h4>
            <hr>
            <h4>상영 영화</h4>
            <div class="grid-container">
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item" style="width: 50px;"></div>
            </div>
    
            <h4>OTT</h4>
            <div class="grid-container">
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item"></div>
                <div class="grid-item" style="width: 50px;"></div>
            </div>
        </div>
    
        <div class="post-section">
            <h3>나의 게시글</h3>
            <hr>
             <% for (Board b : tBoards) { %>
        <div class="list-item">
            <a href="<%= contextPath %>/tBoardDetail?boardId=<%= b.getBoardNo() %>">
                <%= b.getBoardTitle() %>
            </a>
            <p><%= b.getRegistDate() %></p>
        </div>
    <% } %>
           	 <ul class="pagination">
                <li class="page-item  <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>"><a class="page-link" href="<%=contextPath%>/mypage.us?page=<%=pi.getCurrentPage()-1%>"> < </a></li>
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
          		<li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
          		<a class="page-link" href="<%= contextPath %>/mypage.us?page=<%=p%>"><%= p %></a>
          		</li>
        			  <% } %>
                <li class="page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>"><a class="page-link" href="<%=contextPath%>/mypage.us?page=<%= pi.getCurrentPage()+1%>"> > </a></li>
              </ul>
        </div>
    
        <div class="inquiry-section">
            <h3>문의내역</h3>
            <hr>
            <div class="list-container">
                <div class="list-item"><a href="#">문의 1</a></div>
                <div class="list-item"><a href="#">문의 1</a></div>
                <div class="list-item"><a href="#">문의 1</a></div>
                <div class="list-item"><a href="#">문의 1</a></div>
            </div>
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"> < </a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#"> > </a></li>
              </ul>
        </div>
    </div>
    </form>
<!-- body부 종료 -->

		 <%@ include file="/views/common/footer.jsp" %>


</body>




</html>