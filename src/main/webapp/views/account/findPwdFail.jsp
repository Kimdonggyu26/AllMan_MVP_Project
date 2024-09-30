<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css')
	;

body {
	background-color: #131313;
	font-family: 'pretendard';
}

input::placeholder {
	padding-left: 20px;
}

.button-group {
	width: 577px;
	height: 70px;
	font-size: 20px;
}

#buttons {
	margin-top: 25px;
	background-color: white;
	color: black;
	width: 577px;
	height: 70px;
	font-size: 20px;
	border-radius: 5px;
	border: 0px;
	padding: 0px;
	font-weight: 800;
}

.container {
	margin-top: 313px;
	align-items: center;
	display: flex;
	flex-direction: column; /* 세로 방향으로 정렬 */
	text-align: left;
}

.idfo {
	font-size: 40px;
	color: white;
	margin: auto;
	margin-bottom: 13px;
}

#ifound {
	color: white;
	margin-top: 30px;
	text-align: left;
}

input:focus {
	outline: none;
}

.font {
	font-size: 15px;
	color: gray;
	text-align: left;
	margin-top: 17px;
	margin-bottom: 45px;
}

#check {
	color: #f33f3f;
	font-size: 62px;
	margin-bottom: 30px;
}
</style>

</head>

<body>
			 <%
				String contextPath = request.getContextPath();
			%> 			
	  <!-- Header, Nav start -->
   	<%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
					<form action="<%= contextPath %>/views/account/findPwd.jsp">
				<div class="container">
				  <i class="fa-regular fa-circle-xmark" id="check"></i>
				          <div class="idfo">일치하는 결과를 찾을 수 없습니다.</div>
				          
				        <div class="button-group">
				  					<button type="submit"  id="buttons">확인</button>
								</div>
				</div>
				</form>

		<!-- Header, Nav start -->
   	<%--  <%@ include file="/views/common/footer.jsp" %> --%>
    <!-- Header, Nav end -->
   
    
</body>
</html>