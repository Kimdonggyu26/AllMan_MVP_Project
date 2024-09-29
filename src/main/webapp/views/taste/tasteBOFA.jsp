

<%@page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String ContextPath = request.getContextPath();
	User u = (User) session.getAttribute("userID");
%>
<body>
    <div class="container">
        <h1 class="username"><%= u.getUserNick() %>님의 분석 결과는</h1>
        <h2 class="highlight">NDHE</h2>
       
            <div class="main">스토리 + 무거운 주제 + 비현실적 + 도전적</div>
            <div class="sub">취향 분석은 마이페이지에서 다시 할 수 있어요!</div>

        <p class="content">취향에 맞는 사람들과 함께 소통해보세요!</p>
        <a type="submit" href="<%=ContextPath%>"><button class="main-button" >메인페이지로</button></a>
    </div>

</body>
</html>