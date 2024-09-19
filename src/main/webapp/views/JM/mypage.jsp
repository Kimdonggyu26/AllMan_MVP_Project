<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
</style>

   	<!-- Header, Nav start -->
   <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->


<!-- body 시작부 -->
<body>
		<form action="#" method="post">
    <div class="container">
        <div class="title">마이페이지</div>
        <hr>
        <div class="mypage">
            <img src="/AllMan_MVP_Project/src/main/webapp/resources/user_upfiles/스크린샷 2024-05-02 093857.png" alt="User Profile"> 
            <div class="mypage-info">
                <h2 id="like">NDHE</h2>
                <div class="button"><a href="">취향 다시 분석하기</a></div>
                <div><a href="#" id="rechange">회원정보 수정</a></div>
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
            <div class="list-container">
                <div class="list-item"><a href="#">게시글 1</a></div>
                <div class="list-item"><a href="#">게시글 1</a></div>
                <div class="list-item"><a href="#">게시글 1</a></div>
                <div class="list-item"><a href="#">게시글 1</a></div>
            </div>
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
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
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
              </ul>
        </div>
    </div>
    </form>
<!-- body부 종료 -->

   	<!-- Header, Nav start -->
   <%--  <%@ include file="/views/common/footer.jsp" %> --%>
    <!-- Header, Nav end -->


</body>




</html>