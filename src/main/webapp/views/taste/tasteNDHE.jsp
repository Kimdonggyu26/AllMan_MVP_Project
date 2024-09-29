

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
    color: #FE7D7D; /* 강조된 빨간색 텍스트 */
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
	String ContextPath = request.getContextPath(); // "/web"
%>
<body>
    <div class="container">
        <h1 class="username">ooo님의 test용분석 결과는</h1>
        <h2 class="highlight">NDHE</h2>
       
            <div class="main">서사 중심의 역사test용  드라마 애호가</div>
            <div class="sub">깊이 있는 이야기test용 + 시각적 아름다움 + 무거운 주제 + 현실 기반</div>

        <p class="content">취향에 맞는 사람들과test용 함께 소통해보세요!</p>
        <a type="submit" href="<%=ContextPath%>"><button class="main-button" >메인페이지로</button></a>
    </div>

</body>
</html>