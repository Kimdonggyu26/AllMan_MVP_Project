<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="icon" href="/assets/image/titleIcon.png"/>

<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!--폰트-->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

<style>
  body{
    margin-top: 30px;
    background: #131313;
  }
  header{
    display: flex;
    align-items: center; /* Align items vertically in the center */
    justify-content: center;
    background: #131313;
    display: flex;
  }
  nav{
    background: #131313;
    margin-top: 20px;
    font-weight: bold;
  }
  #searchInput{
    width: 1000px;
  }
  #searchFrom{
    margin-left: 80px ;
  }
  #form-control{
    background-color: #131313; 
    width: 600px;
    height: 44px;
    color: #d6d6d6;
    font-family: "pretendard";
    display: flex;
    align-items: center;
  }
  #searchButton{
    margin-left: 3px;
    width: 96px;
    height: 44px;
    font-family: "pretendard";
  }

  #headerIcon{
    justify-content: right;
  }

  #navBar{
    display: flex;
    justify-content: center;
  }
  .navbar-nav {
    display: flex;
    flex-direction: row; /* 가로 방향으로 정렬 */
  }
  .nav-item{
    padding: 0 80px;
  }
  .nav-link{
    color: #FFFFFF;
    font-family: "pretendard";
    background-color: #131313;
  }
  .nav-link:hover {
    color: #ffffff;
    text-decoration: underline;
  }
  
</style>

<%
	String contextPath = request.getContextPath(); // "/web"
	
	//Member loginUser = (Member)session.getAttribute("loginUser");
	// 해당 구문이 실행되는 시점 
	// 로그인 요청 전 페이지 로드시 : null
	// 로그인 성공 후 페이지 로드시 : 조회된 데이터가 담겨있는 Member객체
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 해당 구문이 실행되는 시점
	// 특정 서비스 요청 전 페이지 로드시 : null
	// 특정 서비스 요청 성공 후 페이지 로드시 : alert로 띄워줄 메세지 
%>

<div class="d-flex justify-content-center">
    <header>
      <div class="col-2">
        <a href="<%=contextPath%>"><img src="<%= contextPath%>/assets/image/header/MOVIE_PICK.png"></a>
      </div>
      
      <!--검색창-->
      <div class="col-8">
        <form action="#" id="searchFrom" class="d-flex justify-content-center">
          <div id="searchInput" class="input-group">
            <input type="text" id="form-control" class="form-control" placeholder="검색" autocomplete="off">
            <div id="searchButton" class="input-group-append">
              <button class="btn btn-danger p" type="button">SEARCH</button>
            </div>
          </div>
        </form>
      </div>
      
      <div id="headerIcon" class="col-2 d-flex align-items-center">
        <div><a href="#"><img src="<%= contextPath%>/assets/image/header/bell.png" alt="" id="bellIcon" class="mr-3"></a></div>
        <div><a href="#"><img src="<%= contextPath%>####//해당 유저 프로필 이미지" id="myImg"></a></div>
      </div>
      
    </div>
  </header>
</div>

<nav id="navBar">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">상영영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">OTT영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">자유게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">취향게시판</a>
    </li>
    <li class="nav-item"></li>
      <a class="nav-link" href="#">고객지원</a>
    </li>
  </ul>
</nav>