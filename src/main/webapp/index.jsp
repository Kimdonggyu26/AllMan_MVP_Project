<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="바로 메인페이지로">비회원</a>
	<a href="로그인페이지로">회원</a>

	<%-- 
    방법1. 로그인페이지와 메인페이지를 따로 두고 
           index 로드시 분기처리
		if(현재 로그인이 되어있을 경우) {
			<jsp:forward page="<%=request.getContextPath()%>/main.page"/>
		}else{ // 비회원인 경우
			<jsp:forward page="<%=contextPath%>/로그인페이지요청"/>
		}
		
		방법2. 현재페이지에 로그인폼요소랑 메인페이지의 요소를 다 두고 
		if(현재 로그인이 되어있을 경우) {
			영화목록 및 데이터가 보여지는 요소들 
			
		}else{ // 비회원인 경우
			로그인 요청할수 있는 form 요소 
		}
		
		방법3. index에는 로그인폼만 두고 메인페이지는 따로 jsp로 두기 
		if(현재 로그인이 되어있지 않을 경우) {
			로그인폼
		}else {
		   <jsp:forward page="<%=request.getContextPath()%>/main.page"/>
		}
	 --%>
	 
	 <!-- 
	 
	 	http://localhost:8888/mvp/
	 	http://localhost:8888/mvp/main.page
	 
	 
	  -->

</body>
</html>