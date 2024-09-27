<%@page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    String contextPath = request.getContextPath();
    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser != null) {
    	//임시로 검색페이지 요청 // 서블릿으로 처리 필요
        response.sendRedirect(contextPath + "/views/movieMain/mainPage.jsp");
    } else {
        response.sendRedirect(contextPath + "/login.us");
    }
	%>
	 

		
	<%-- 
		방법2. 현재페이지에 로그인폼요소랑 메인페이지의 요소를 다 두고 
		if(현재 로그인이 되어있을 경우) {
			영화목록 및 데이터가 보여지는 요소들 
			
		}else{ // 비회원인 경우
			로그인 요청할수 있는 form 요소 
		}
		
	 --%>
	 
	
	 
	 
	 <!-- 
	 
	 	http://localhost:8888/mvp/
	 	http://localhost:8888/mvp/main.page
	 
	 
	  -->

</body>
</html>