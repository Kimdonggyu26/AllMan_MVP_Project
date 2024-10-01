<%@page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #131313;
	
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
    text-align: center;
}

.username {
    font-size: 40px;
    margin-bottom: 30px;
}

.highlight {
    font-size: 40px;
    color: #83FF64; /* 강조된 빨간색 텍스트 */
    margin-bottom: 20px;
}

.content {
    font-size: 24px;
    margin-bottom: 160px;
}
.main{
    font-size: 40px;
    margin-bottom: 10px;
}
.sub{
   font-size: 24px; 
    margin-bottom: 130px;
}
.main-button {
    background-color: #F33F3F;
    color: white;
    width: 570px;
    height: 70px;
    border: none;
    border-radius: 5px;
    font-size: 20px;
    cursor: pointer;
    
}
</style>
</head>

<%
	String ContextPath = request.getContextPath();
	User u = (User) session.getAttribute("loginUser");
%>
<body>
    <div class="container">
        <h1 class="username"><%= u.getUserNick() %>님의 분석 결과는</h1>
        <h2 class="highlight">BOFA</h2>
       		
            <div class="sub">취향 분석은 마이페이지에서 다시 할 수 있어요!</div>

        <p class="content">취향에 맞는 사람들과 함께 소통해보세요!</p>
        <a type="submit"  href="<%=ContextPath %>/logout.us"><button class="main-button" >시작하기</button></a>
    </div>

</body>
</html>