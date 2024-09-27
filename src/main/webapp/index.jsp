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
	<%
		String contextPath = request.getContextPath(); 
	%>
		<div>
			<form action="<%=contextPath %>/views/movieMain/mainPage.jsp">
				<button>d</button>
			</form>
		</div>
		
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