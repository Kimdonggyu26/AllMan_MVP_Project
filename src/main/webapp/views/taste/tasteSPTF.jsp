

<%@page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
</head>

<%
	String ContextPath = request.getContextPath();
	User u = (User) session.getAttribute("loginUser");
%>
<body>
    <div class="container">
        <h1 class="username"><%= u.getUserNick() %>���� �м� �����</h1>
        <h2 class="highlight">NDHE</h2>
       		
            <div class="sub">���� �м��� �������������� �ٽ� �� �� �־��!</div>

        <p class="content">���⿡ �´� ������ �Բ� �����غ�����!</p>
        <a type="submit" href="<%=ContextPath%>"><button class="main-button" >������������</button></a>
    </div>

</body>
</html>