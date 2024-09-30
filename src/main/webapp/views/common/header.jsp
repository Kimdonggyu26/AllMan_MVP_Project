<%@ page import="com.mvp.semi.user.model.vo.User" %>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
  main{
	width: 1920px;
  }
  body{
    margin-top: 30px;
    background: #131313;
  }
  header{
    display: flex;
    align-items: center; /* Align items vertically in the center */
    justify-content: center;
    background: #131313;
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
  #myImg{
  	width: 30px;
  	height: 30px;
  	border-radius: 100px;
  }
  
</style>

<%
	String contextPath = request.getContextPath(); // "/web"
	User loginUser = (User)session.getAttribute("loginUser");
	int userNo = -1;
	if(loginUser != null){
		userNo = loginUser.getUserNo();	
	}
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!-- 테스트용 -->

<div class="d-flex justify-content-center">
    <header>
	      <div class="col-2">
	        <a href="<%=contextPath%>"><img src="<%=contextPath%>/assets/image/header/MOVIE_PICK.png"></a>
	      </div>
	      <!--검색창-->
	      <div class="col-8">
	        <form action="<%=contextPath%>/searchPage.mv" id="searchFrom" class="d-flex justify-content-center">
	          <div id="searchInput" class="input-group">
	            <input type="text" name="search" id="form-control" class="form-control" placeholder="검색" autocomplete="off">
	            <div id="searchButton" class="input-group-append">
	              <button class="btn btn-danger p" type="submit" style="margin: 0;height: 44px; width: 200px">검색</button>
	            </div>
	          </div>
	        </form>
	      </div>
	      
	      <div id="headerIcon" class="col-2 d-flex align-items-center">
		        
		        
		        <div>
		        	<% if(loginUser == null) { %>
		        		<a href="login.us">로그인</a>
		        	<%} else{%>
		        		<div style="display: flex; flex-direction: row;">

				        	<a href="mypage.us" style="color: f2f2f2f2;  text-decoration: none; color: inherit;"><B><%=loginUser.getUserNick() %></B>님 &nbsp&nbsp&nbsp&nbsp</a>
			        		<!-- 클릭 시 마이페이지 이동 -->
			        		<a href="mypage.us"><img src="<%= contextPath + loginUser.getFilePath()%>" id="myImg"></a>
		        		</div>
		        	<%} %>
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
      <a class="nav-link" href="">OTT영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="list.fbo">자유게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="list.tbo">취향게시판</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        고객지원
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="list.no">공지사항</a>
        <a class="dropdown-item" href="list.faq">FAQ</a>
        <a class="dropdown-item" href="list.iq">1대1문의</a>
      </div>
    </li>
  </ul>
</nav>

<script>
	function saveSearchTerm() {
	    var searchTerm = document.getElementById("searchInput").value; // input에서 검색어 가져오기
	    localStorage.setItem("searchTerm", searchTerm); // 로컬 스토리지에 저장
	}
	
	function loadSearchTerm() {
	    var savedTerm = localStorage.getItem("searchTerm"); // 로컬 스토리지에서 검색어 가져오기
	    if (savedTerm) {
	        document.getElementById("searchInput").value = savedTerm; // input에 검색어 설정
	    }
	}
	
	window.onload = function() {
	    loadSearchTerm(); // 페이지가 로드될 때 검색어를 input에 채움
	};
</script>
